package kaits.nct.common.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.Mac;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.codehaus.jackson.JsonParser;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import kaits.nct.common.mapper.NiceMapper;
import kaits.nct.common.model.NiceApiVO;
import kaits.nct.common.service.NiceService;
import kaits.nct.common.utility.SHA256;

@Service
public class NiceServiceImpl implements NiceService {

	@Value("#{sdprop['nc.sv.tk']}")
	String accessToken;

	@Value("#{sdprop['nc.sv.url']}")
	String url;

	@Value("#{sdprop['nc.sv.id']}")
	String clientID;

	@Value("#{sdprop['nc.sv.pid']}")
	String productID;

	@Value("#{sdprop['nc.sv.sk']}")
	String clientSecretKey;

	@Autowired
	NiceMapper niceMapper;

	@Override
	public String getToken() throws IOException {
		// TODO Auto-generated method stub
		String path = "/digital/niceid/oauth/oauth/token";

		URL obj = new URL(url + path);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//		con.setRequestProperty("Cache-Control", "no-cache");
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
//		con.setRequestProperty("Accept", "application/json");

		String key = clientID + ":" + clientSecretKey;
		String authorization = Base64.getEncoder().encodeToString(key.getBytes());

		con.setRequestProperty("Authorization", "Basic " + authorization);
		System.setProperty("jsse.enableSNIExtension", "false");
		con.setDoOutput(true);
		OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
		wr.write("grant_type=client_credentials&scope=default");
		wr.flush();
		wr.close();

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}

		in.close();
		System.out.println(response.toString());

		return response.toString();
	}

	// 공통 NICE 본인인증 = 휴대폰
	@Override
	public Map<String, Object> getNiceApiToken(String reqDtim, String reqNo, String authType, String businessNo)
			throws IOException, ParseException {
		// TODO Auto-generated method stub
		String path = "/digital/niceid/api/v1.0/common/crypto/token";
		System.out.println("getNiceApiToken");
		URL obj = new URL(url + path);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/json");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date reqDtm = sf.parse(reqDtim);
		long currentTimestamp = reqDtm.getTime() / 1000;

		String key = accessToken + ":" + currentTimestamp + ":" + clientID;
		String authorization = Base64.getEncoder().encodeToString(key.getBytes());

		con.setRequestProperty("Authorization", "bearer " + authorization);
		con.setRequestProperty("client_id", clientID);
		con.setRequestProperty("ProductID", productID);
		System.out.println(productID);
		con.setDoOutput(true);
		OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());

		String requestDataHeader = "\"CNTY_CD\":\"ko\" ";
		String requestDataBody = "\"req_dtim\":\"" + sf.format(reqDtm) + "\" " + ", \"req_no\":\"" + reqNo + "\" "
				+ ", \"enc_mode\":\"" + "1" + "\" ";

		String requestData = "\"dataHedader\":" + "{" + requestDataHeader + "}" + ", \"dataBody\":" + "{"
				+ requestDataBody + "}";

		requestData = "{" + requestData + "}";
		System.out.println(requestData);
		wr.write(requestData);
		wr.flush();
		wr.close();

		Map<String, Object> resultData = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}

			in.close();

			JSONParser parser = new JSONParser();
			Object strObj = parser.parse(response.toString());
			JSONObject jsonObj = (JSONObject) strObj;

			JSONObject dataHeader = (JSONObject) jsonObj.get("dataHeader");
			JSONObject dataBody = (JSONObject) jsonObj.get("dataBody");
			System.out.println(dataHeader);
			System.out.println(dataBody);
			String resultCode = (String) dataHeader.get("GW_RSLT_CD");

			String tokenVersionId = (String) dataBody.get("token_version_id");
			String tokenVal = (String) dataBody.get("token_val");
			String siteCode = (String) dataBody.get("site_code");

			if ("1200".equals(resultCode)) {
				// 성공
				String value = reqDtim.trim() + reqNo.trim() + tokenVal.trim();
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(value.getBytes());
				byte[] arrHashValue = md.digest();
				SHA256 sha256 = new SHA256();
				String resultVal = Base64.getEncoder().encodeToString(arrHashValue);

				String r_key = resultVal.substring(0, 16);
				String iv = resultVal.substring(resultVal.length() - 16);
				String hmac_key = resultVal.substring(0, 32);

				String reqData = "\"returnurl\":\"https://office.nct.or.kr/kaits/nice/apiResult\""
						+ ",\"requestno\":\"" + reqNo + "\"" + ",\"sitecode\":\"" + siteCode + "\"" + ",\"authtype\":\""
						+ authType + "\"" + ",\"methodtype\":\"" + "get" + "\"" + ",\"popupyn\":\"" + "Y" + "\""
//							+ ",\"receivedata\":\"" + "ABCDE" + "\""
				;
				System.out.println("reqData===================================>");
				System.out.println(reqData);
				System.out.println("reqData===================================>");
				if ("U".equals(authType)) {
					reqData += ",\"businessno\":\"" + businessNo + "\"";
				}

				System.out.println(reqData);

				reqData = "{" + reqData + "}";

				SecretKey secureKey = new SecretKeySpec(r_key.getBytes(), "AES");
				Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
				c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(iv.getBytes()));
				byte[] encrypted = c.doFinal(reqData.trim().getBytes());
				String encData = Base64Utils.encodeToString(encrypted);

				byte[] hmacSha256 = this.Hmac256(hmac_key.getBytes(), encData.getBytes());
				String integrityValue = Base64Utils.encodeToString(hmacSha256);

				resultData.put("tokenVersionId", tokenVersionId);
				resultData.put("encData", encData);
				resultData.put("integrityValue", integrityValue);

				niceMapper.insertNiceInfo(new NiceApiVO( tokenVersionId, r_key, iv, hmac_key, null, null, null, null, null, null, null));
				
				

				resultMap.put("resultCode", "S");
				resultMap.put("resultData", resultData);
			} else {
				resultMap.put("resultCode", "F");
				resultData.put("code", dataHeader.get("GW_RSLT_CD"));
				resultData.put("message", dataHeader.get("GW_RSLT_MSG"));
				resultMap.put("resultData", resultData);
			}

			return resultMap;
		} catch (Exception e) {
			resultMap.put("resultCode", "F");
			resultMap.put("resultData", null);
			System.out.println(e);
			return resultMap;
		}

	}

	// 리턴 데이터
	@Override
	public Map<String, Object> getNiceApiReturn(NiceApiVO returnData) throws Exception {
		System.out.println("getNiceApiReturn impl=1==================================>");
		// TODO Auto-generated method stub
		NiceApiVO keyInfo = niceMapper.selectNiceAuth(returnData);
		System.out.println("getNiceApiReturn impl=2==================================>");
		System.out.println(returnData);
		System.out.println("getNiceApiReturn impl=2///==================================>");
		System.out.println(keyInfo);
		System.out.println("getNiceApiReturn impl=2==================================>");
		// 복호화
		SecretKey secureKey = new SecretKeySpec(keyInfo.getNiceAuthKey().getBytes(), "AES");
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(keyInfo.getNiceAuthIv().getBytes()));
		byte[] cipherEnc = Base64.getDecoder().decode(returnData.getNiceEncData());
		String resData = new String(c.doFinal(cipherEnc), "euc-kr");
		System.out.println("getNiceApiReturn impl=3==================================>");
		JSONParser parser = new JSONParser();
		Object strObj = parser.parse(resData);
		JSONObject jsonObj = (JSONObject) strObj;
		System.out.println("getNiceApiReturn impl=4==================================>");
		keyInfo.setNiceAuthName((String) jsonObj.get("name"));
		keyInfo.setNiceAuthMobileNo((String) jsonObj.get("mobileno"));
		keyInfo.setDi((String) jsonObj.get("di"));
		
		System.out.println("getNiceApiReturn impl=5==================================>");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("name", keyInfo.getNiceAuthName());
		resultMap.put("mobileno", keyInfo.getNiceAuthMobileNo());
		resultMap.put("di", keyInfo.getDi());
		
		System.out.println("getNiceApiReturn impl=6==================================>");
		System.out.println(keyInfo);
		
		niceMapper.updateNiceAuth(keyInfo);
		System.out.println("getNiceApiReturn impl=7==================================>");
		return resultMap;
	}

	@Override
	public Map<String, Object> getCryptoToken(String reqDtim, String reqNo) throws IOException, ParseException {
		// TODO Auto-generated method stub
		String path = "/digital/niceid/api/v1.0/common/crypto/token";

		URL obj = new URL(url + path);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//		con.setRequestProperty("Cache-Control", "no-cache");
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/json");
//		con.setRequestProperty("Accept", "application/json");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date reqDtm = sf.parse(reqDtim);
		long currentTimestamp = reqDtm.getTime() / 1000;
		String key = accessToken + ":" + currentTimestamp + ":" + clientID;
		String authorization = Base64.getEncoder().encodeToString(key.getBytes());

		con.setRequestProperty("Authorization", "bearer " + authorization);
		con.setRequestProperty("client_id", clientID);
		con.setRequestProperty("ProductID", productID);
		con.setDoOutput(true);
		OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());

		String requestDataHeader = "\"CNTY_CD\":\"ko\" ";
		String requestDataBody = "\"req_dtim\":\"" + sf.format(reqDtm) + "\" " + ", \"req_no\":\"" + reqNo + "\" "
				+ ", \"enc_mode\":\"" + "1" + "\" ";

		String requestData = "\"dataHedader\":" + "{" + requestDataHeader + "}" + ", \"dataBody\":" + "{"
				+ requestDataBody + "}";

		requestData = "{" + requestData + "}";
		wr.write(requestData);
		wr.flush();
		wr.close();

		Map<String, Object> resultData = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}

			in.close();

			JSONParser parser = new JSONParser();
			Object strObj = parser.parse(response.toString());
			JSONObject jsonObj = (JSONObject) strObj;

			JSONObject dataHeader = (JSONObject) jsonObj.get("dataHeader");
			JSONObject dataBody = (JSONObject) jsonObj.get("dataBody");

			String resultCode = (String) dataHeader.get("GW_RSLT_CD");

			String tokenVersionId = (String) dataBody.get("token_version_id");
			String tokenVal = (String) dataBody.get("token_val");
			String siteCode = (String) dataBody.get("site_code");

			if ("1200".equals(resultCode)) {
				// 성공
				String value = reqDtim.trim() + reqNo.trim() + tokenVal.trim();
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(value.getBytes());
				byte[] arrHashValue = md.digest();
				SHA256 sha256 = new SHA256();
				String resultVal = Base64.getEncoder().encodeToString(arrHashValue);

				String r_key = resultVal.substring(0, 16);
				String iv = resultVal.substring(resultVal.length() - 16);
				String hmac_key = resultVal.substring(0, 32);

				String reqData = "\"returnurl\":\"https://office.nct.or.kr/kaits/nice/result\"" + ",\"requestno\":\""
						+ reqNo + "\"" + ",\"sitecode\":\"" + siteCode + "\"" + ",\"authtype\":\"" + "M" + "\""
//						+ ",\"businessno\":\"" + " + 사업자번호 + " + "\""
						+ ",\"methodtype\":\"" + "get" + "\"" + ",\"popupyn\":\"" + "Y" + "\""
//						+ ",\"receivedata\":\"" + "ABCDE" + "\""
				;

				reqData = "{" + reqData + "}";

				SecretKey secureKey = new SecretKeySpec(r_key.getBytes(), "AES");
				Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
				c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(iv.getBytes()));
				byte[] encrypted = c.doFinal(reqData.trim().getBytes());
				String encData = Base64Utils.encodeToString(encrypted);

				byte[] hmacSha256 = this.Hmac256(hmac_key.getBytes(), encData.getBytes());
				String integrityValue = Base64Utils.encodeToString(hmacSha256);

				resultData.put("tokenVersionId", tokenVersionId);
				resultData.put("encData", encData);
				resultData.put("integrityValue", integrityValue);

				/*
				 * niceMapper.insertNiceInfo(new NiceApiVO( tokenVersionId, r_key, iv, hmac_key,
				 * null, null, null, null, null));
				 */

				resultMap.put("resultCode", "S");
				resultMap.put("resultData", resultData);
			} else {
				resultMap.put("resultCode", "F");
				resultMap.put("resultData", null);
			}

			return resultMap;
		} catch (Exception e) {
			resultMap.put("resultCode", "F");
			resultMap.put("resultData", null);
			System.out.println(e);
			return resultMap;
		}

	}

	public byte[] Hmac256(byte[] secretKey, byte[] message) {
		byte[] hmac256 = null;
		try {
			Mac mac = Mac.getInstance("HmacSHA256");
			SecretKeySpec sks = new SecretKeySpec(secretKey, "HmacSHA256");
			mac.init(sks);
			hmac256 = mac.doFinal(message);
			return hmac256;
		} catch (Exception e) {
			throw new RuntimeException("Failed to generate HMACSHA256 encrypt");
		}
	}

	@Override
	public Map<String, Object> getReturnData(NiceApiVO returnData) throws Exception {
		// TODO Auto-generated method stub
		NiceApiVO keyInfo = niceMapper.selectNiceAuth(returnData);

		// 복호화
		SecretKey secureKey = new SecretKeySpec(keyInfo.getNiceAuthKey().getBytes(), "AES");
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(keyInfo.getNiceAuthIv().getBytes()));
		byte[] cipherEnc = Base64.getDecoder().decode(returnData.getNiceEncData());
		String resData = new String(c.doFinal(cipherEnc), "euc-kr");

		JSONParser parser = new JSONParser();
		Object strObj = parser.parse(resData);
		JSONObject jsonObj = (JSONObject) strObj;

		System.out.println(resData);
		System.out.println(jsonObj);

		keyInfo.setNiceAuthName((String) jsonObj.get("name"));
		keyInfo.setNiceAuthMobileNo((String) jsonObj.get("mobileno"));

		niceMapper.updateNiceAuth(keyInfo);
		return null;
	}

}

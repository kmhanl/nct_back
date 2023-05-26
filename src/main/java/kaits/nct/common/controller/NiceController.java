package kaits.nct.common.controller;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kaits.nct.common.service.NiceService;
import kaits.nct.common.utility.SHA256;

@Controller
@RequestMapping(value="/nice")
public class NiceController {
	
	@Autowired
	private NiceService niceService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/token", method=RequestMethod.POST)
	public ResponseEntity getNiceToken(
			HttpServletRequest request,
			HttpSession session) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출
		String admId = niceService.getToken();
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultSeq", admId);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	//공통 NICE 본인인증 = 휴대폰
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/api/token.do", method=RequestMethod.POST)
	public ResponseEntity getapiToken(
			HttpServletRequest request,
            @RequestParam Map<Object,Object> userInfo,
			HttpSession session) throws Exception {
		
		SimpleDateFormat d = new SimpleDateFormat("yyyyMMddHHmmss");
		String reqDtim = d.format(Calendar.getInstance().getTime());
		String reqNo = "2208207563";
		System.out.println("===사업자=====================================================================");
		System.out.println(reqNo);
		
		String authType = userInfo.get("authType").toString();
		String sno = userInfo.get("businessno").toString();
		System.out.println("===사업자=====================================================================");
		Map<String,Object> resultMap = niceService.getNiceApiToken(reqDtim, reqNo, authType, sno);
		System.out.println("===getComreToken=====================================================================");
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/crypto/token", method=RequestMethod.POST)
	public ResponseEntity getNiceCryptoToken(
			HttpServletRequest request,
			HttpSession session) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// NICE API 암호화 토큰 요청 서비스 호출
		SimpleDateFormat d = new SimpleDateFormat("yyyyMMddHHmmss");
		String reqDtim = d.format(Calendar.getInstance().getTime());
		String reqNo = "111222333";
//		String responseData = niceService.getCryptoToken(reqDtim, reqNo);
		
//		JSONParser parser = new JSONParser();
//		Object strObj = parser.parse(responseData);
//		JSONObject jsonObj = (JSONObject) strObj;
//		
//		
//		JSONObject dataHeader = (JSONObject) jsonObj.get("dataHeader");
//		JSONObject dataBody = (JSONObject) jsonObj.get("dataBody");
//		
//		System.out.println(dataHeader);
//		System.out.println(dataBody);
//		
//		String resultCode = (String) dataHeader.get("GW_RSLT_CD");
//		
//		String tokenVersionId = (String) dataBody.get("token_version_id");
//		String tokenVal = (String) dataBody.get("token_val");
//		String siteCode = (String) dataBody.get("site_code");
//
//		Map<Object,Object> resultData = new HashMap<Object, Object>();
//		Map<Object,Object> resultMap = new HashMap<Object, Object>();
//
//		if ("1200".equals(resultCode)) {
//			// 성공
//			String value = reqDtim.trim() + reqNo.trim() + tokenVal.trim();
//			MessageDigest md = MessageDigest.getInstance("SHA-256");
//			md.update(value.getBytes());
//			byte[] arrHashValue = md.digest();
//			SHA256 sha256 = new SHA256();
//			String resultVal = Base64.getEncoder().encodeToString(arrHashValue);
//			
//			System.out.println(resultVal);
//			
//			String key = resultVal.substring(0, 16);
//			String iv = resultVal.substring(resultVal.length() - 16);
//			String hmac_key = resultVal.substring(0, 32);
//			
//			System.out.println(key);
//			System.out.println(iv);
//			System.out.println(hmac_key);
//			
//			String reqData = "\"returnurl\":\"https://office.nct.or.kr/kaits/nice/result\""
//					+ ",\"requestno\":\"" + reqNo + "\""
//					+ ",\"sitecode\":\"" + siteCode + "\""
//					+ ",\"authtype\":\"" + "M" + "\""
////					+ ",\"businessno\":\"" + "1638701878" + "\""
//					+ ",\"methodtype\":\"" + "get" + "\""
//					+ ",\"popupyn\":\"" + "Y" + "\""
////					+ ",\"receivedata\":\"" + "ABCDE" + "\""
//					;
//			
//			reqData = "{" + reqData + "}";
//			System.out.println(reqData);
//			
//			SecretKey secureKey = new SecretKeySpec(key.getBytes(), "AES");
//			Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
//			c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(iv.getBytes()));
//			byte[] encrypted = c.doFinal(reqData.trim().getBytes());
//			String encData = Base64Utils.encodeToString(encrypted);
//			
//			byte[] hmacSha256 = this.Hmac256(hmac_key.getBytes(), encData.getBytes());
//			String integrityValue = Base64Utils.encodeToString(hmacSha256); 
//			
//			resultData.put("tokenVersionId", tokenVersionId);
//			resultData.put("encData", encData);
//			resultData.put("integrityValue", integrityValue);
//			
//			resultMap.put("resultCode", "S");
//			resultMap.put("resultData", resultData);
//		} else {
//			resultMap.put("resultCode", "F");
//			resultMap.put("resultData", null);
//		}
		Map<String,Object> resultMap = niceService.getCryptoToken(reqDtim, reqNo);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
}

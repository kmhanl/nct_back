package kaits.nct.common.service;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.Map;

import javax.crypto.NoSuchPaddingException;

import kaits.nct.common.model.NiceApiVO;

public interface NiceService {
	
	Map<String, Object> getNiceApiToken(String reqDtim, String reqNo, String authType, String businessNo) throws IOException, ParseException;
	Map<String, Object> getNiceApiReturn(NiceApiVO returnData) throws Exception;
	
	/**
	 * NICE API 토큰 발급
	 * @param data
	 * @return
	 * @throws IOException
	 */
	String getToken() throws IOException;
	/**
	 * NICE API 암호화토큰 요청
	 * @param data
	 * @return
	 * @throws IOException
	 */
	Map<String, Object> getCryptoToken(String reqDtim, String reqNo) throws IOException, ParseException;
	/**
	 * NICE API 암호화토큰 요청
	 * @param data
	 * @return
	 * @throws IOException
	 */
	Map<String, Object> getReturnData(NiceApiVO returnData) throws Exception;
}

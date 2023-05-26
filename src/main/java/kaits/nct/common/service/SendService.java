package kaits.nct.common.service;

import java.io.IOException;

import kaits.nct.common.model.EmailSaveDTO;
import kaits.nct.common.model.SmsSaveDTO;

public interface SendService {
	/**
	 * SMS 전송 (다이렉트 샌드 API 호출)
	 * @param data
	 * @return
	 * @throws IOException
	 */
	String sendSMS(SmsSaveDTO smsSaveDTO) throws IOException;
	/**
	 * SMS 전송 (다이렉트 샌드 API 호출)
	 * @param data
	 * @return
	 * @throws IOException
	 */
	String sendEmail(EmailSaveDTO emailSaveDTO) throws IOException;
	
	String sendCommonEmail(EmailSaveDTO emailSaveDTO) throws IOException;
	
	String sendCallEmail(EmailSaveDTO emailSaveDTO) throws IOException;
	
	/**
	 * SMS 히스토리 저장
	 * @param smsSaveDTO
	 */
	void saveSmsHistory(SmsSaveDTO smsSaveDTO);
}

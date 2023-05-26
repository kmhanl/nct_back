package kaits.nct.common.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.common.model.SmsVO;

@Mapper
public interface SendMapper {
	/**
	 * SMS 발송 후 히스토리 저장
	 * @param params
	 * @return
	 */
	public int insertSmsHistory(SmsVO param);
}

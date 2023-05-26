package kaits.nct.system.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.system.model.SystemTechVO;

@Mapper
public interface SystemTechMapper {
	/**
	 * 기술범위 조회
	 * @param params
	 * @return
	 */
	public List<SystemTechVO> getTechList(SystemTechVO params); // 서비스와 동일하게 선언되고 XML에 동일한 메서드가 있어야됨.
}

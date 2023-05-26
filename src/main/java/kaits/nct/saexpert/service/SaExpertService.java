package kaits.nct.saexpert.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.saexpert.model.SaExpertAgendaVO;
import kaits.nct.saexpert.model.SaExpertTabVO;

public interface SaExpertService {

	
	/**
	 * 보호위원회 - 안건현황 리스트 조회
	 * @param expertAgendaVO
	 * @return
	 */
	List<SaExpertAgendaVO> getAgendaList(SaExpertAgendaVO param);

	/**
	 * 보호위원회 - 상태별 탭 데이터 조회
	 * @return
	 */
	List<SaExpertTabVO> getTabList();
	
	/**
	 * 페이징 데이터 조회
	 * @return
	 */
	PagingVO getPaging();
}

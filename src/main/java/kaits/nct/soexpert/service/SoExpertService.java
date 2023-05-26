package kaits.nct.soexpert.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.soexpert.model.SoExpertAgendaVO;
import kaits.nct.soexpert.model.SoExpertTabVO;

public interface SoExpertService {
	
	/**
	 * 소위원회 - 안건현황 리스트 조회
	 * @param expertAgendaVO
	 * @return
	 */
	List<SoExpertAgendaVO> getAgendaList(SoExpertAgendaVO param);

	/**
	 * 소위원회 - 상태별 탭 데이터 조회
	 * @return
	 */
	List<SoExpertTabVO> getTabList();
	
	/**
	 * 페이징 데이터 조회
	 * @return
	 */
	PagingVO getPaging();
}

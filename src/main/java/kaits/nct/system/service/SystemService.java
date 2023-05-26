package kaits.nct.system.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.system.model.SystemTechVO;

public interface SystemService {
	/**
	 * 전문위원회 - 접수현황 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<SystemTechVO> getTechList(SystemTechVO param); // impl에도 동일하게 선언
	
	/**
	 * 페이징 데이터 조회
	 * @return
	 */
	PagingVO getPaging();
}

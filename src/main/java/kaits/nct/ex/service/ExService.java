package kaits.nct.ex.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.ex.model.ExInfoDataVO;
import kaits.nct.ex.model.ExAgdListDataVO;

import kaits.nct.expert.model.ExDatePickStatusVO;

import kaits.nct.expert.model.agenda.ExpertAgendaListVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;


public interface ExService {
	
	/** 전문위원회 > 위원회 회차 정보 조회 **/
	List<ExInfoDataVO> getExInfoData(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 회차별 왼쪽 안건 리스트 조회 **/
	List<ExAgdListDataVO> loadAgendaList(ExAgdListDataVO param);
	
	/** 전문위원회 > 위원회 회차별 왼쪽 안건 리스트 > 기술명칭 조회 **/
	List<ExAgdListDataVO> loadAgendaTitList(ExAgdListDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 위원회 개최 처리  **/
	void openProcEx(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 위원회 개최 취소 처리  **/
	void cancelProcEx(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 위원회 삭제 처리  **/
	void deleteProcEx(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 위원회 진행중 > 개최 회수  처리  **/
	void backProcEx(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 위원회 진행중 > 위원회 종료 처리  **/
	void endProcEx(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 결과 도출중 > 위원회 종료 회수 처리  **/
	void endBackProcEx(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 결과 종료 > 기술안보과 이관 처리  **/
	void sendProcExdo(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 현황 > 결과 도출중 > 이관 회수 처리  **/
	void returnProcEx(ExInfoDataVO param);
	
	
	
}

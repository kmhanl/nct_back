package kaits.nct.expert.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.expert.model.ExDataInfoVO;
import kaits.nct.expert.model.ExDatePickStatusVO;
import kaits.nct.expert.model.ExpertCommitteeMemberSaveDTO;
import kaits.nct.expert.model.ExpertCommitteeMemberVO;
import kaits.nct.expert.model.ExpertCommitteeOpinionVO;
import kaits.nct.expert.model.ExpertCommitteeSaveDTO;
import kaits.nct.expert.model.ExpertCommitteeVO;
import kaits.nct.expert.model.ExpertCountryVO;
import kaits.nct.expert.model.ExpertFileVO;
import kaits.nct.expert.model.ExpertPrintOpinionVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.ExpertTechVO;
import kaits.nct.expert.model.agenda.ExpertAgendaListVO;
import kaits.nct.expert.model.agenda.ExpertAgendaModifyDTO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.agenda.ExpertAgendaTechVO;
import kaits.nct.expert.model.agenda.ExpertAgendaVO;
import kaits.nct.expert.model.receipt.ExpertReceiptCountryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptDTO;
import kaits.nct.expert.model.receipt.ExpertReceiptHistoryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptSaveDTO;
import kaits.nct.expert.model.receipt.ExpertReceiptStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptTechVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;

public interface ExpertService {
	/**
	 * 전문위원회 - 접수현황 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<ExpertReceiptVO> getReceiptList(ExpertReceiptVO param);
	
	/**
	 * 전문위원회 - 접수현황 상태별 데이터 조회 (탭)
	 * @return
	 */
	List<ExpertTabVO> getExpertTabList();
	
	/**
	 * 전문위원회 - 접수 분야 조회 (접수현황 상세 팝업)
	 * @return
	 */
	List<ExpertReceiptTechVO> getReceiptTechList(ExpertReceiptTechVO param);
	
	/**
	 * 전문위원회 - 접수 대상국 조회 (접수현황 상세 팝업)
	 * @return
	 */
	List<ExpertReceiptCountryVO> getReceiptCountryList(ExpertReceiptCountryVO param);
	
	/**
	 * 전문위원회 - 접수 파일 조회 (접수현황 상세 팝업)
	 * @return
	 */
	List<ExpertFileVO> getReceiptFileList(ExpertFileVO param);
	
	/**
	 * 전문위원회 - 접수 히스토리 조회 (접수현황 상세 팝업)
	 * @return
	 */
	List<ExpertReceiptHistoryVO> getReceiptHistoryList(ExpertReceiptHistoryVO param);

	/**
	 * 전문위원회 - 열람 및 검토 허용 분야 리스트 조회 (접수현황 상세 팝업)
	 * @return
	 */
	List<ExpertReceiptTechVO> getTechListWithCompetence(String rcptIdx);
	
	/**
	 * 전문위원회 - 분야 리스트 조회 (검토요청 팝업)
	 * @return
	 */
	List<ExpertTechVO> getTechList();
	
	/**
	 * 전문위원회 - 분야 리스트 조회 (검토요청 팝업)
	 * @return
	 */
	List<ExpertTechItemVO> getTechItemList(ExpertTechItemVO param);
	
	/**
	 * 전문위원회 - 분야 리스트 조회 (검토요청 팝업)
	 * @return
	 */
	List<ExpertCountryVO> getCountryList(ExpertCountryVO param);
	
	/**
	 * 전문위원회 - 안건현황 리스트 조회
	 * @param expertAgendaVO
	 * @return
	 */
	List<ExpertAgendaStatVO> getAgendaStatList(ExpertAgendaStatVO param);
	
	/** 전문위원회 >참석일 선택 > 상세  조회 **/
	List<ExDataInfoVO> getExDateInfo(ExDataInfoVO param);
	List<ExDatePickStatusVO> getDatePickStatus(ExDatePickStatusVO param);
	
	/**
	 * 전문위원회 - 안건코드 조회
	 * @param expertAgendaVO
	 * @return
	 */
	List<ExpertAgendaStatVO> getSearchAgendaCode(ExpertAgendaStatVO param);
	
	/**
	 * 전문위원회 - 접수현황 상세보기 : 반려/반려회수/승인/승인회수 시 상태 변경
	 * @param ExpRecListVO
	 * @return
	 */
	void changeReceiptStatus(ExpertReceiptVO param);
	
	/**
	 * 전문위원회 - 접수상세 의견 데이터 저장
	 * @param ExpertReceiptHistoryVO
	 * @return
	 */
	void saveReceiptHistory(ExpertReceiptHistoryVO param);
	
	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	void saveReceiptCompetence(ExpertReceiptDTO expertReceiptDTO);
	
	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	String saveReceipt(ExpertReceiptSaveDTO param);
	
	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	String getAgdCode(ExpertAgendaStatVO param);
	
	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	void saveAgenda(ExpertAgendaVO param);
	
	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	void saveAgendaStat(ExpertAgendaStatVO param);

	/**
	 * 전문위원회 - 검토요청 파일 저장
	 * @param expertAgendaFileVO
	 * @return
	 */
	void saveAgendaFile(ExpertFileVO param);

	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	void saveCommittee(ExpertCommitteeSaveDTO param);

	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	void saveCommitteeMember(ExpertCommitteeMemberVO param);
	
	/**
	 * 전문위원회 - 위원회 개최일 확정
	 * @param expertAgendaVO
	 * @return
	 */
	void confirmCommitteeInfo(ExpertCommitteeVO param);
	
	/**
	 * 전문위원회 - 위원회 개최 취소
	 * @param expertAgendaVO
	 * @return
	 */
	void cancelCommitteeInfo(ExpertCommitteeVO param);
	
	/**
	 * 전문위원회 - 위원회 개최 취소
	 * @param expertAgendaVO
	 * @return
	 */
	void startCommitteeInfo(ExpertCommitteeVO param);
	/**
	 * 전문위원회 - 위원회 개최 취소
	 * @param expertAgendaVO
	 * @return
	 */
	void stopCommitteeInfo(ExpertCommitteeVO param);

	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	String modifyAgenda(ExpertAgendaModifyDTO param);
	
	/**
	 * 전문위원회 - 위원 구성 수정
	 * @param expertAgendaVO
	 * @return
	 */
	String modifyMember(ExpertCommitteeMemberSaveDTO param);
	
	/**
	 * 전문위원회 - 위원 구성 수정
	 * @param expertAgendaVO
	 * @return
	 */
	String modifyCommitteeDate(ExpertCommitteeSaveDTO param);
	
	/**
	 * 전문위원회 - 참석일선택 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	ExpertCommitteeVO getCommitteeData(ExpertCommitteeVO param);
	/**
	 * 전문위원회 - 참석일선택 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	ExpertCommitteeOpinionVO getCommitteeOpinionData(ExpertCommitteeOpinionVO param);
	/**
	 * 전문위원회 - 접수현황 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<ExpertCommitteeVO> getDatepickList(ExpertCommitteeVO param);
	List<ExpertCommitteeVO> getDatePList(ExpertCommitteeVO param);
	List<ExpertCommitteeVO> getExLiveList(ExpertCommitteeVO param);
	
	
	
	
	
	
	/** 전문위원회 > 전문위원,기술간사 위원회 리스트 조회 **/
	List<ExpertCommitteeVO> getExpMemList(ExpertCommitteeVO param);
	
	/** 전문위원회 > 전문위원,기술간사 위원회 리스트 > 자료 열람 위원회 정보 조회 **/
	ExpertCommitteeVO exeInfoData(ExpertCommitteeVO param);
	
	/** 전문위원회 > 전문위원,기술간사 위원회 리스트 > 자료 열람 위원회 정보 조회 **/
	ExpertCommitteeVO expIdxInfoData(ExpertCommitteeVO param);
	
	List<ExpertCommitteeOpinionVO> expMemOpinionList(ExpertCommitteeOpinionVO param);
	
	List<ExpertPrintOpinionVO> expMemPrintList(ExpertPrintOpinionVO param);
	
	/**
	 * 전문위원회 - 위원회 구성원 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<ExpertCommitteeMemberVO> getCommitteeMemberList(ExpertCommitteeMemberVO param);
	
	/**
	 * 전문위원회 - 로그인한 위원회 구성원의 Member 상태 조회 
	 * @param expertReceiptVO
	 * @return
	 */
	ExpertCommitteeMemberVO getLoginMemberStat(ExpertCommitteeMemberVO param);
	
	/**
	 * 전문위원회 - 위원회 의견 상태 그룹 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<ExpertCommitteeOpinionVO> getCommitteOpinionGroupList(ExpertCommitteeOpinionVO param);
	/**
	 * 전문위원회 - 위원회 의견 상태 그룹 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<ExpertAgendaStatVO> getCommitteAgendaList(ExpertAgendaStatVO param);
	
	List<ExpertAgendaListVO> getAgendaList(ExpertAgendaListVO param);
	List<ExpertAgendaListVO> getAgendaTList(ExpertAgendaListVO param);
	List<ExpertAgendaTechVO> getTechAreaList(ExpertAgendaTechVO param);
	
	List<ExpertAgendaListVO> expAgendaList(ExpertAgendaListVO param);
	List<ExpertAgendaListVO> expAgendaTList(ExpertAgendaListVO param);
	/**
	 * 전문위원회 - 자료 열람 비밀 유지 동의 저장 
	 * @param expertAgendaVO
	 * @return
	 */
	void updateCommitteeAgreeView(ExpertCommitteeMemberVO param);
	
	
	/**
	 * 전문위원회 - 검토 의견 작성
	 * @param expertAgendaVO
	 * @return
	 */
	void saveCommitteeOpinion(ExpertCommitteeOpinionVO param);
	/**
	 * 전문위원회 - 검토 의견 작성
	 * @param expertAgendaVO
	 * @return
	 */
	void saveCommitteeOpinionStat(ExpertCommitteeMemberVO param);
	/**
	 * 페이징 데이터 조회
	 * @return
	 */
	PagingVO getPaging();

	/**
	 * 전문위원회 - 검토요청 데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	void deleteMetaData(ExpertReceiptStatVO param);
	
	/**
	 * 전문위원회 - 검토요청 검토결과확정
	 * @param expertAgendaStatVO
	 * @return
	 */
	void deleteAgenda(ExpertAgendaStatVO param);
	/**
	 * 전문위원회 - 검토요청 검토결과확정
	 * @param expertAgendaStatVO
	 * @return
	 */
	void setAgendaComplete(ExpertAgendaStatVO param);
	/**
	 * 전문위원회 - 검토요청 검토결과확정
	 * @param expertAgendaStatVO
	 * @return
	 */
	void setCommitteeStatusCS(ExpertCommitteeVO param);

	int setReceiptCnt(ExpertReceiptVO param);

	void setDelete(ExpertReceiptVO param);
}

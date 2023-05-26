package kaits.nct.exp.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.exp.model.ExpAgdListVO;
import kaits.nct.exp.model.ExpListTabVO;
import kaits.nct.exp.model.ExpListTechVO;
import kaits.nct.exp.model.ExpLoadFileVO;
import kaits.nct.exp.model.ExpNctTechVO;
import kaits.nct.exp.model.ExpRecCompeVO;
import kaits.nct.exp.model.ExpRecConturyVO;
import kaits.nct.exp.model.ExpRecHistoryVO;
import kaits.nct.exp.model.ExpRecListVO;
import kaits.nct.exp.model.ExpRecTechVO;
import kaits.nct.exp.model.ExpRecUpdateVO;
import kaits.nct.exp.model.ExpMetaVO;
import kaits.nct.exp.model.ExpRecSaveDTO;
import kaits.nct.exp.model.ExpSchComVO;
import kaits.nct.exp.model.ExpSendAgdDTO;
import kaits.nct.exp.model.ExpTopTabVO;
import kaits.nct.exp.model.ExtRecCompeDTO;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.receipt.ExpertReceiptHistoryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptSaveDTO;
import kaits.nct.member.model.ComMemberVO;



public interface ExpService {
	/** 
	 * 리스트 공통  페이징 데이터 조회 
	 * @return
	*/
	PagingVO getPaging();
	
	/** 
	 * 공통 국가 핵심 기술 분야 명칭 조회 
	 * @return
	*/
	List<ExpNctTechVO> nctTech(ExpNctTechVO param);
	
	/** 
	 * 공통 로그인한 계정의 기술 분야 권한 조회 
	 * @return
	*/
	List<ExpNctTechVO> haveTech(ExpNctTechVO param);
	
	/** 
	 * 리스트 공통  페이징 Top Tap 카운트
	 * @return
	*/
	List<ExpTopTabVO> recListTap();
	List<ExpTopTabVO> agdListTap();
	
	/**
	 * 공통 리스트 접수 현황 리스트 조회  >>기술 분야 2Depth 리스트 카운트 ()
	 * @return
	 */
	List<ExpListTechVO> expListTechCnt();
	
	/**
	 * 공통 리스트 접수 현황 리스트 조회  >>기술 분야 2Depth 리스트 카운트 ()
	 * @return
	 */
	List<ExpListTechVO> expListTechList();
	
	/**
	 * 공통 리스트 접수 현황 히스토리 / 검토의견 저장 처리 
	 * @param ExpRecHistoryVO
	 * @return
	 */
	void insertRecHistory(ExpRecHistoryVO param);
	
	/**
	 * 공통 리스트 접수 신청서 라스트 상태 업데이트 
	 * @param ExpRecUpdateVO
	 * @return
	 */
	void updateRecStat(ExpRecUpdateVO param);
	
	
	/**
	 * 기업 정보 조회
	 * 
	 * @param member 검증할 유저정보(아이디,패스워드)
	 * @return 체크된 유저정보
	 */
	List<ExpSchComVO> schCompany(ExpSchComVO param);
	
	/**
	 * 전문위원회 -  접수현황 > 신규 등록 >> 기술 분야 기술 범위 조회
	 * @param expertAgendaVO
	 * @return
	 */
	List<ExpNctTechVO> loadTechAreaList(ExpNctTechVO param);
	
	/**
	 * 전문위원회 - 접수현황 > 신규 등록 >> 신규 등록  채번  
	 * @param ExpRecListVO
	 * @return
	 */
	String makeNewCode(ExpMetaVO param);
	
	/**
	 * 전문위원회 -  접수현황 > 신규 등록 >>  데이터 저장
	 * @param expertAgendaVO
	 * @return
	 */
	String saveMetaData(ExpRecSaveDTO param);
	
	/**
	 * 전문위원회 -  안건현황 > 리스트 > 검토 요청   데이터 저장
	 * @param ExpSendAgdDTO
	 * @return
	 */
	String saveSendData(ExpSendAgdDTO param);
	
	/**
	 * 전문위원회 - 접수현황 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpRecListVO
	 * @return
	 */
	List<ExpRecListVO> loadListRec(ExpRecListVO param);
	
	/**
	 * 전문위원회 - 안건 현황 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpAgdListVO
	 * @return
	 */
	List<ExpAgdListVO> loadListAgd(ExpAgdListVO param);
	
	/**
	 * 전문위원회 - 검토 준비중 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpAgdListVO
	 * @return
	 */
	List<ExpAgdListVO> loadListRdy(ExpAgdListVO param);
	
	/**
	 * 전문위원회 - 검토 준비중 리스트 > 위원회 구성 > 안건 추가 팝업 > 안건 조회   
	 * @param ExpAgdListVO
	 * @return
	 */
	List<ExpAgdListVO> loadListAddAgd(ExpAgdListVO param);
	
	/**
	 *  전문위원회 - 공통  + 메타 상세 조회 
	 * @return
	 */
	List<ExpMetaVO> loadViewRecMeta(ExpMetaVO param);
	List<ExpMetaVO> loadViewAgdMeta(ExpMetaVO param);
	
	/**
	 *  전문위원회 - 접수현황 상세  >> 기술 명칭 리스트 조회
	 * @return
	 */
	List<ExpRecTechVO> expRecViewTech(ExpRecTechVO param);
	
	/**
	 *  전문위원회 - 접수현황 상세  >> 대상국 리스트 조회
	 * @return
	 */
	List<ExpRecConturyVO> expRecViewCountury(ExpRecConturyVO param);
	
	/**
	 *  전문위원회 - 접수현황 상세  >> 히스토리 리스트 조회
	 * @return
	 */
	List<ExpRecHistoryVO> expRecViewHistory(ExpRecHistoryVO param);
	
	/**
	 *  전문위원회 - 접수현황 상세  >> 검토 권한 리스트 조회
	 * @return
	 */
	List<ExpRecCompeVO> expRecViewCompe(ExpRecCompeVO param);
	
	
	/**
	 *  전문위원회 - 접수현황 상세  >> 신청서 + 메타 상세 조회 
	 * @return
	 */
	List<ExpLoadFileVO> expViewFile(ExpLoadFileVO param);
	
	/**
	 *전문위원회 - 접수현황 상세  >> 의견첨부 권한 저장
	 * @param ExtRecCompeDTO
	 * @return
	 */
	void saveRecCompe(ExtRecCompeDTO expRecCompeDTO);
	
	
	
	
	
	
	
}

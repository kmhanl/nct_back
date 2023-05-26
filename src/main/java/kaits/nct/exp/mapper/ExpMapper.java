package kaits.nct.exp.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.exp.model.ExpAgdHistoryVO;
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
import kaits.nct.exp.model.ExpSchComVO;
import kaits.nct.exp.model.ExpTopTabVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.receipt.ExpertReceiptCountryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptTechVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberTabVO;




@Mapper
public interface ExpMapper {
	
	/**
	 * 접수 현황 > 리스트 Top Tap 카운트 ()
	 * @return
	 */
	
	
	
	/**
	 * 공통 리스트 기술 분야 2Depth 리스트 카운트()
	 * @return
	 */
	public List<ExpListTechVO> expComListTechCnt(String string);
	
	/**
	 * 공통 리스트 기술 분야 2Depth 리스트 리스트()
	 * @return
	 */
	public List<ExpListTechVO> expComListTechList(String string);
	
	/**
	 * 공통 국가 핵심 기술 분야 명칭 조회 
	 * @param ExpNctTechVO
	 * @param params
	 * @return
	 */
	public List<ExpNctTechVO> nctTech(ExpNctTechVO params);
	
	/**
	 * 공통 로그인한 계정의 기술 분야 권한 조회 
	 * @param ExpNctTechVO
	 * @param params
	 * @return
	 */
	public List<ExpNctTechVO> haveTech(ExpNctTechVO params);
	
	/**
	 * * 공통 리스트 접수 현황 히스토리 / 검토의견 저장 처리 
	 * @param ExpRecHistoryVO
	 * @return
	 */
	public int insertRecHistory(ExpRecHistoryVO params);
	
	/**
	 * * 공통 리스트 안건 현황 히스토리 인설트 
	 * @param ExpAgdHistoryVO
	 * @return
	 */
	public int insertAgdHistory(ExpAgdHistoryVO params);
	
	/**
	 * * 공통 리스트 접수 현황  신청서 상태값 라스트 업데이트 
	 * @param ExpRecUpdateVO
	 * @return
	 */
	public int updateRecStat(ExpRecUpdateVO params);
	public int updateSendRec(ExpRecUpdateVO params);
	
	
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 대상 기업 조회 (자동 검색 / 셀렉트) 
	 * @param ExpSchComVO
	 * @param params
	 * @return
	 */
	public List<ExpSchComVO> schCompany(ExpSchComVO param);
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 기술 분야 기술 범위 조회 
	 * @param ExpSchComVO
	 * @param params
	 * @return
	 */
	public List<ExpNctTechVO> loadTechAreaList(ExpNctTechVO param);
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 신규 메타 코드 생성
	 * @param params
	 * @return
	 */
	public String makeNewMetaCode();
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 신규 접수 번호 생성 
	 * @param params
	 * @return
	 */
	public String makeNewRecCode();
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > - 메타 데이터 저장
	 * @param ExpMetaVO
	 * @return
	 */
	public int saveMetaData(ExpMetaVO param);
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > - 접수 데이터 저장
	 * @param ExpMetaVO
	 * @return
	 */
	public int saveRecData(ExpMetaVO param);
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > - 메타 데이터 저장 > 기술분야 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveMetaTech(ExpRecTechVO param);
	
	/**
	 *전문위원회 - 접수현황 >> 신규 등록 > - 메타 데이터 저장 > 대상국 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveMetaCountry(ExpRecConturyVO param);
	
	
	/**
	 * 전문위원회 - 접수현황 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpRecListVO
	 * @param params
	 * @return
	 */
	public List<ExpTopTabVO> loadListRecTap(ExpRecListVO params);
	public List<ExpRecListVO> loadListRecTotal(ExpRecListVO params);
	public List<ExpRecListVO> loadListRecPage(ExpRecListVO params);
	
	/**
	 * 전문위원회 - 안건현황 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpAgdListVO
	 * @param params
	 * @return
	 */
	public List<ExpTopTabVO> loadListAgdTap(ExpAgdListVO params);
	public List<ExpAgdListVO> loadListAgdTotal(ExpAgdListVO params);
	public List<ExpAgdListVO> loadListAgdPage(ExpAgdListVO params);
	
	/**
	 * 전문위원회 - 안건현황 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpAgdListVO
	 * @param params
	 * @return
	 */
	public List<ExpTopTabVO> loadListRdyTap(ExpAgdListVO params);
	public List<ExpAgdListVO> loadListRdyTotal(ExpAgdListVO params);
	public List<ExpAgdListVO> loadListRdyPage(ExpAgdListVO params);
	
	/**
	 * 전문위원회 -  검토 준비중 리스트 > 위원회 구성 > 안건 추가 팝업 > 안건 조회   
	 * @param ExpAgdListVO
	 * @param params
	 * @return
	 */
	public List<ExpAgdListVO> loadListAddAgd(ExpAgdListVO params);
	
	/**
	 * 전문위원회 - 공통  >> 신청서 + 메타 상세 조회 
	 * @param ExpMetaVO
	 * @param params
	 * @return
	 */
	public List<ExpMetaVO> loadViewRecMeta(ExpMetaVO params);
	public List<ExpMetaVO> loadViewAgdMeta(ExpMetaVO params);
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 기술 명칭 리스트 조회 
	 * @param ExpRecTechVO
	 * @param params
	 * @return
	 */
	public List<ExpRecTechVO> expRecViewTech(ExpRecTechVO params);
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 대상국 리스트 조회 
	 * @param ExpRecConturyVO
	 * @param params
	 * @return
	 */
	public List<ExpRecConturyVO> expRecViewCountury(ExpRecConturyVO params);
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 히스토리 리스트 조회 
	 * @param ExpRecHistoryVO
	 * @param params
	 * @return
	 */
	public List<ExpRecHistoryVO> expRecViewHistory(ExpRecHistoryVO params);
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 검토 권한 리스트 조회 
	 * @param ExpRecCompeVO
	 * @param params
	 * @return
	 */
	public List<ExpRecCompeVO> expRecViewCompe(ExpRecCompeVO params);
	
	
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 첨부 파일 조회
	 * @param ExpMetaVO
	 * @param params
	 * @return
	 */
	public List<ExpLoadFileVO> expViewFile(ExpLoadFileVO params);
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 열람 및 의견 작성 권한 삭제
	 * @param params
	 * @return
	 */
	public int delRecCompe(ExpRecCompeVO params);
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 열람 및 의견 작성 권한 생성
	 * @param params
	 * @return
	 */
	public int saveRecCompe(ExpRecCompeVO params);
	
	
	/**
	 * 전문위원회 - 안선 현황 > 리스트 > 검토 요청 > 신규 안건 데이터 저장 
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int insertNewAgd(ExpAgdListVO param);
	
	
}

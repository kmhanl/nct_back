package kaits.nct.expert.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.expert.model.ExpertCountryVO;
import kaits.nct.expert.model.ExpertFileVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptCountryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptHistoryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptTechVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;

@Mapper
public interface ExpertReceiptMapper {
	/**
	 * 접수 현황 조회
	 * @param params
	 * @return
	 */
	public List<ExpertReceiptVO> getReceiptList(ExpertReceiptVO params);
	
	/**
	 * 접수 현황 상태별 데이터 수 조회
	 * @param params
	 * @return
	 */
	public List<ExpertTabVO> getReceiptListGroupCount(ExpertReceiptVO params);
	/**
	 * 접수 현황 조회
	 * @param params
	 * @return
	 */
	public List<ExpertReceiptVO> getReceiptStatList(ExpertReceiptVO params);
	
	/**
	 * 접수 현황 상태별 데이터 수 조회
	 * @param params
	 * @return
	 */
	public List<ExpertTabVO> getReceiptStatListGroupCount(ExpertReceiptVO params);
	
	/**
	 * 접수 기술 리스트 조회
	 * @param params
	 * @return
	 */
	public List<ExpertReceiptTechVO> getReceiptTechList(ExpertReceiptTechVO params);
	
	/**
	 * 접수 기술 리스트 조회
	 * @param params
	 * @return
	 */
	public List<ExpertReceiptTechVO> getReceiptStatTechList(ExpertReceiptTechVO params);
	
	/**
	 * 접수 대상국 리스트 조회
	 * @param params
	 * @return
	 */
	public List<ExpertReceiptCountryVO> getReceiptCountryList(ExpertReceiptCountryVO params);
	
	/**
	 * 접수 파일 리스트 조회
	 * @param params
	 * @return
	 */
	public List<ExpertFileVO> getReceiptFileList(ExpertFileVO params);
	
	/**
	 * 접수 파일 리스트 조회
	 * @param params
	 * @return
	 */
	public List<ExpertFileVO> getReceiptStatFileList(ExpertFileVO params);
	
	/**
	 * 국가 코드 조회
	 * @return
	 */
	public List<ExpertCountryVO> getCountryList(ExpertCountryVO param);
	
	/**
	 * 접수 히스토리 리스트 조회
	 * @param params
	 * @return
	 */
	public List<ExpertReceiptHistoryVO> getReceiptHistoryList(ExpertReceiptHistoryVO params);
	
	/**
	 * 접수 히스토리 리스트 조회
	 * @param params
	 * @return
	 */
	public List<ExpertReceiptTechVO> getReceiptCompetenceList(ExpertReceiptTechVO params);
	
	/**
	 * 접수내역 상태 변경
	 * @param params
	 * @return
	 */
	public int updateReceiptStatus(ExpertReceiptVO params);
	
	/**
	 * 접수 히스토리 생성
	 * @param params
	 * @return
	 */
	public int saveReceiptHistory(ExpertReceiptHistoryVO params);
	/**
	 * 접수 열람 및 의견 작성 권한 삭제
	 * @param params
	 * @return
	 */
	public int deleteReceiptCompetence(ExpertReceiptTechVO params);
	/**
	 * 접수 열람 및 의견 작성 권한 생성
	 * @param params
	 * @return
	 */
	public int saveReceiptCompetence(ExpertReceiptTechVO params);
	
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public int updateAgendaReceiptStatus(ExpertReceiptVO params);
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public String getNewRcptIdx();
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public String getNewRcptStatCode();
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public String getNewMetaCode();
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveReceipt(ExpertReceiptVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveReceiptStat(ExpertReceiptVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveMetaData(ExpertReceiptVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveReceiptTech(ExpertReceiptTechVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveMetaTech(ExpertReceiptTechVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveReceiptCountry(ExpertReceiptCountryVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveMetaCountry(ExpertReceiptCountryVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveMetaLinkAgenda(ExpertAgendaStatVO param);
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int deleteMeta(ExpertReceiptStatVO param);
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public String getNewCpnId();
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveComMember(ExpertReceiptVO param);

	public int setReceiptCnt(ExpertReceiptVO param);

	public void setDelete(ExpertReceiptVO param);
}

package kaits.nct.expert.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.expert.model.ExDataInfoVO;
import kaits.nct.expert.model.ExDatePickStatusVO;
import kaits.nct.expert.model.ExpertCommitteeMemberVO;
import kaits.nct.expert.model.ExpertCommitteeOpinionVO;
import kaits.nct.expert.model.ExpertCommitteeVO;
import kaits.nct.expert.model.ExpertPrintOpinionVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.agenda.ExpertAgendaListVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.agenda.ExpertAgendaTechVO;

@Mapper
public interface ExpertCommitteeMapper {
	/**
	 * 전문위원회 구성 > 새로운 전문위원회 번호 조회
	 * @param params
	 * @return
	 */
	public List<ExpertTabVO> getCommitteeListGroupCount(ExpertCommitteeVO param);
	
	/**
	 * 전문위원회 구성 > 새로운 전문위원회 번호 조회
	 * @param params
	 * @return
	 */
	public List<ExpertCommitteeVO> getCommitteeList(ExpertCommitteeVO param);
	public List<ExpertCommitteeVO> getDatePList(ExpertCommitteeVO param);
	public List<ExpertCommitteeVO> getExLiveList(ExpertCommitteeVO param);
	
	/** 전문위원회 > 전문위원,기술간사 위원회 리스트 조회 **/
	public List<ExpertCommitteeVO> getExpMemList(ExpertCommitteeVO param);
	
	public List<ExpertCommitteeVO> exeInfoData(ExpertCommitteeVO param);
	public List<ExpertCommitteeVO> expIdxInfoData(ExpertCommitteeVO param);
	
	
	/** 전문위원회 > 참석일 선택  > 상세 > 기본 정보  조회  **/
	public List<ExDataInfoVO> getExDateInfo(ExDataInfoVO param);
	
	/** 전문위원회 참석일 선택 현황 조회 > 위원회 키 > 멤버별 선택 현황 조회 **/
	public List<ExDatePickStatusVO> getDatePickStatus(ExDatePickStatusVO param);
	
	/**
	 * 전문위원회 구성 > 새로운 전문위원회 번호 조회
	 * @param params
	 * @return
	 */
	public List<ExpertCommitteeMemberVO> getCommitteeMemberList(ExpertCommitteeMemberVO param);
	
	/**
	 * 전문위원회 구성 > 로그인한 전문위원의 member 상태조회
	 * @param params
	 * @return
	 */
	public ExpertCommitteeMemberVO getLoginMemberStat(ExpertCommitteeMemberVO param);
	
	/**
	 * 전문위원회 구성 > 새로운 전문위원회 번호 조회
	 * @param params
	 * @return
	 */
	public List<ExpertCommitteeOpinionVO> selectCommitteeOpinionGroupCount(ExpertCommitteeOpinionVO param);
	
	public List<ExpertCommitteeOpinionVO> expMemOpinionList(ExpertCommitteeOpinionVO param);
	
	public List<ExpertPrintOpinionVO> expMemPrintList(ExpertPrintOpinionVO param);
	/**
	 * 전문위원회 구성 > 새로운 전문위원회 번호 조회
	 * @param params
	 * @return
	 */
	public ExpertCommitteeOpinionVO selectCommitteeOpinion(ExpertCommitteeOpinionVO param);
	/**
	 * 전문위원회 구성 > 새로운 전문위원회 번호 조회
	 * @param params
	 * @return
	 */
	public List<ExpertAgendaStatVO> getCommitteeAgendaList(ExpertAgendaStatVO param);
	public List<ExpertAgendaListVO> getAgendaList(ExpertAgendaListVO param);
	public List<ExpertAgendaListVO> getAgendaTList(ExpertAgendaListVO param);
	public List<ExpertAgendaTechVO> getTechAreaList(ExpertAgendaTechVO param);
	
	public List<ExpertAgendaListVO> expAgendaList(ExpertAgendaListVO param);
	public List<ExpertAgendaListVO> expAgendaTList(ExpertAgendaListVO param);
	/**
	 * 전문위원회 구성 > 새로운 전문위원회 번호 조회
	 * @param params
	 * @return
	 */
	public String getNewCommitteeIdx(ExpertCommitteeVO param);
	/**
	 * 전문위원회 구성 > 전문위원회 정보 데이터 저장
	 * @param ExpertCommitteeVO
	 * @return
	 */
	public int saveCommitteeInfo(ExpertCommitteeVO param);
	/**
	 * 전문위원회 구성 > 전문위원회 구성원 정보 데이터 저장
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int saveCommitteeMember(ExpertCommitteeMemberVO param);
	/**
	 * 전문위원회 구성 > 전문위원회 구성원 정보 데이터 저장
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int updateAgendaAfterSaveCommittee(ExpertAgendaStatVO param);
	/**
	 * 전문위원회 구성 > 위원회 위원 삭제
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int deleteCommitteeMember(ExpertCommitteeMemberVO param);
	/**
	 * 전문위원회 구성 > 위원회 위원 삭제
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int updateCommitteeInfo(ExpertCommitteeVO param);
	/**
	 * 전문위원회 구성 > 위원회 위원 수정
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int updateCommitteeMember(ExpertCommitteeMemberVO param);
	/**
	 * 전문위원회 구성 > 개최일 확정
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int updateCommitteeInfoConfirmation(ExpertCommitteeVO param);
	/**
	 * 전문위원회 구성 > 개최 취소
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int updateCommitteeInfoCancel(ExpertCommitteeVO param);
	/**
	 * 전문위원회 구성 > 개최 취소
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int updateCommitteeInfoStart(ExpertCommitteeVO param);
	/**
	 * 전문위원회 > 검토 의견 제출
	 * @param ExpertCommitteeOpinionVO
	 * @return
	 */
	public int insertCommitteeOpinion(ExpertCommitteeOpinionVO param);
	/**
	 * 전문위원회 > 검토 의견 제출 수정
	 * @param ExpertCommitteeOpinionVO
	 * @return
	 */
	public int updateCommitteeOpinion(ExpertCommitteeOpinionVO param);
	
	/**
	 * 전문위원회 > 자료 열람 비밀 유지 동의 저장
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	public int updateCommitteeAgreeView(ExpertCommitteeMemberVO param);
	
	
	/**
	 * 전문위원회 > 검토 의견 제출
	 * @param ExpertCommitteeOpinionVO
	 * @return
	 */
	public int selectCommitteeOpinionCount(ExpertCommitteeOpinionVO param);
	/**
	 * 전문위원회 > 최종의견 제출
	 * @param ExpertCommitteeOpinionVO
	 * @return
	 */
	public int updateCommitteeMemberStat(ExpertCommitteeMemberVO param);
	/**
	 * 전문위원회 > 최종의견 제출
	 * @param ExpertCommitteeOpinionVO
	 * @return
	 */
	public int updateCommitteeInfoStatus(ExpertCommitteeVO param);
}

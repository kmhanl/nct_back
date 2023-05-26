package kaits.nct.research.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
/**import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;**/
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberAuthorityVO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberTabVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.research.model.IntoMemVO;
import kaits.nct.research.model.ResearchMemberVO;
import kaits.nct.research.model.ResearchVO;

@Mapper
public interface ResearchMapper {
	/**
	 * 실태조사 리스트
	 * @param member
	 * @return
	 */
	public List<ResearchVO> getResearchList(ResearchVO params);
	
	public void InsertMember(IntoMemVO params);
	
	/** 실태조사 테스트 이메일 발송 대상 기업 리스트 조회 **/
	public List<ResearchMemberVO> getTargetList(ResearchMemberVO params);
	public List<ResearchMemberVO> getTargetTestList(ResearchMemberVO params);
	public List<ResearchMemberVO> getTarget01List(ResearchMemberVO params);
	
	
}

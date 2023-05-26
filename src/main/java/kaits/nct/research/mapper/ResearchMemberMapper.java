package kaits.nct.research.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
/**import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;**/
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberAuthorityVO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberTabVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.research.model.ResearchMemberVO;

@Mapper
public interface ResearchMemberMapper {
	/**
	 * 로그인 유저 검증
	 * @param member
	 * @return
	 */
	public ResearchMemberVO ResearchLoginCheck(ResearchMemberVO member);
	
	
}

package kaits.nct.research.service;

import java.util.List;
import java.util.Map;

import kaits.nct.common.model.PagingVO;
/**import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;**/
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberInvitationSaveDTO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberTabVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.research.model.ResearchKeyVO;
import kaits.nct.research.model.ResearchMemberVO;
import kaits.nct.research.model.ResearchVO;

public interface ResearchMemberService {
	/**
	 * 로그인 처리
	 * 
	 * @param member 검증할 유저정보(아이디,패스워드)
	 * @return 체크된 유저정보
	 */
	ResearchMemberVO ResearchLoginCheck(ResearchMemberVO member);
	
	
	
	
	
	
	
}
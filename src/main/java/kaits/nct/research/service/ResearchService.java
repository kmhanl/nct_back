package kaits.nct.research.service;

import java.util.List;
import java.util.Map;

import kaits.nct.common.model.PagingVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
/**import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;**/
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberInvitationSaveDTO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberTabVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.research.model.IntoMemDTO;
import kaits.nct.research.model.ResearchKeyVO;
import kaits.nct.research.model.ResearchMemberVO;
import kaits.nct.research.model.ResearchVO;

public interface ResearchService {
	
	/** 실태조사 리스트 **/
	List<ResearchVO> getResearchList(ResearchVO param);
	
	/**
	 * 페이징 데이터 조회
	 * @return
	 */
	PagingVO getPaging();
	
	String MakeKey(ResearchKeyVO member);
	
	/** 실태조사 대상 기업 인설트 리스트 **/
	String InsertRscMember(IntoMemDTO param);//Insert
	
	/** 실태조사 테스트 이메일 발송 대상 기업 리스트 조회 **/
	List<ResearchMemberVO> getTargetList(ResearchMemberVO param);
	
	List<ResearchMemberVO> getTargetTestList(ResearchMemberVO param);
	List<ResearchMemberVO> getTarget01List(ResearchMemberVO param);
}
package kaits.nct.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.common.model.OtpVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemHistoryVO;
import kaits.nct.member.model.MemberAuthVO;
import kaits.nct.member.model.MemberAuthorityVO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberTabVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.research.model.EndFileVO;

@Mapper
public interface MemberMapper {
	
	/** 업무 포털 계정 히스토리 insert **/
	public String insertMemHistory(MemHistoryVO param);
	
	public MemberInvitationVO getAdminInviChk(MemberInvitationVO inviCode);
	/**
	 * 로그인 유저 검증
	 * @param member
	 * @return
	 */
	public MemberVO UserCheck(MemberVO member);
	
	/**
	 * 기업 정보 조회
	 * @param member
	 * @return
	 */
	public List<ComMemberVO> comMemberSelect(ComMemberVO param);
	
	/**
	 * 유저 리스트 조회
	 * @param member
	 * @return
	 */
	public List<MemberVO> admMemberSelect(MemberVO member);
	
	/**
	 * 회원정보 저장
	 * @param MemberVO
	 * @return
	 */
	public int saveAdminMember(MemberVO param);
	
	/**
	 * 초대 권한 업데이트 
	 **/
	public int inviFlagUpdate(String admInviKey);
	
	/**
	 * 초대 권한 키 > 아이디 업데이트 업데이트 
	 **/
	//public String inviAuthUpdate(String admInviKey, String admId);
	void inviAuthUpdate(@Param("admInviKey") String admInviKey, @Param("admId") String admId);
	
	/**
	 * 같은 아이디 조회
	 * @param MemberVO
	 * @return
	 */
	public int isExistsUser(MemberVO param);
	
	/**
	 * 같은 아이디 조회
	 * @param MemberVO
	 * @return
	 */
	public String getInvitationSeq();
	
	/**
	 * 초대정보 저장
	 * @param MemberVO
	 * @return
	 */
	public int saveAdminInvitation(MemberInvitationVO param);
	
	/**
	 * 초대정보 권한 저장
	 * @param MemberVO
	 * @return
	 */
	public int saveAdminAuthority(MemberAuthorityVO param);

	/**
	 * 초대정보 조회
	 * @param MemberInvitationVO
	 * @return
	 */
	public List<MemberInvitationVO> getAdminInvitation(MemberInvitationVO param);
	
	/**
	 * 초대정보 상태별 데이터 수 조회
	 * @param MemberInvitationVO
	 * @return
	 */
	public List<MemberTabVO> getAdminInvitationGroupCount(MemberInvitationVO param);
	
	/**
	 * 기업유저 상태별 데이터 수 조회
	 * @param MemberInvitationVO
	 * @return
	 */
	public List<MemberTabVO> getComMemberGroupCount(ComMemberVO param);

	/**
	 * 관리자 유저 조회
	 * @param member
	 * @return
	 */
	public List<MemberVO> getAdminMembers(MemberVO member);	
	
	public List<MemberAuthVO> getAdminMemberAuth(MemberAuthVO member);	
	
	/**
	 * 관리자 유저 상태별 데이터 수 조회
	 * @param MemberInvitationVO
	 * @return
	 */
	public List<MemberTabVO> getAdminMemberGroupCount(MemberVO param);
	
	/**
	 * 관리자 유저 승인 후 상태 업데이트
	 * @param MemberInvitationVO
	 * @return
	 */
	public int setAdminMember(MemberVO param);
	
	/**
	 * 관리자 유저 승인 후 상태 업데이트
	 * @param MemberInvitationVO
	 * @return
	 */
	public void saveOtpAuth(MemberVO param);
	
	/**
	 * 관리자 유저 승인 후 상태 업데이트
	 * @param MemberInvitationVO
	 * @return
	 */
	public OtpVO getOtpAuth(MemberVO param);

	public String getComInvitationSeq();

	public void setComInvitation(MemberInvitationVO miParam);
	public void deleteAdminAuthority(MemberVO params);

	public List<MemberTabVO> getComInvitationGroupCount(MemberInvitationVO param);

	public List<MemberInvitationVO> getComInvitation(MemberInvitationVO param);

	public ComMemberVO ComMember(ComMemberVO param);

	public EndFileVO EndFileCheck(EndFileVO diCode);

	public void comapply(ComMemberVO comMemberVo);

	public List<ComMemberVO> totComMemberList();
}

package kaits.nct.member.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import kaits.nct.common.model.PagingVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemHistoryVO;
import kaits.nct.member.model.MemberAuthVO;
import kaits.nct.member.model.MemberInvitationSaveDTO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberSaveDTO;
import kaits.nct.member.model.MemberTabVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.model.OtpMemVO;
import kaits.nct.research.model.EndFileVO;

public interface MemberService {
	
	
	/** 업무 포털 계정 히스토리 insert **/
	String insertMemHistory(MemHistoryVO param);
	
	/**
	 * 로그인 처리
	 * 
	 * @param member 검증할 유저정보(아이디,패스워드)
	 * @return 체크된 유저정보
	 */
	MemberVO UserCheck(MemberVO member);
	/**
	 * OTP 인증번호 발행
	 * 
	 * @param member 유저정보
	 * @return 발행결과(미정)
	 */
	Map<Object,Object> otpSend(MemberVO member);
	/**
	 * OTP 인증번호 발행
	 * 
	 * @param member 유저정보
	 * @return 발행결과(미정)
	 */
	void otpSave(MemberVO member);
	/**
	 * OTP 인증
	 * 
	 * @param member 유저정보
	 * @param otpNumber 입력한 OTP 인증번호
	 * @return 인증결과(미정)
	 */
	Map<Object,Object> otpCheck(MemberVO member);
	/**
	 * 기업 정보 조회
	 * 
	 * @param member 검증할 유저정보(아이디,패스워드)
	 * @return 체크된 유저정보
	 */
	List<ComMemberVO> getCompany(ComMemberVO param);
	/**
	 * 기술 분야 권한에 따른 유저 정보 조회
	 * 
	 * @param member 기술분야
	 * @return 체크된 유저정보
	 */
	List<MemberVO> getAdmMemberList(MemberVO param);

	/**
	 * 유저 정보 저장
	 * 
	 * @param member 기술분야
	 * @return 체크된 유저정보
	 */
	String setAdmMember(MemberVO param);
	
	/**
	 * 유저 정보 저장
	 * 
	 * @param member 기술분야
	 * @return 체크된 유저정보
	 */
	boolean isExistsUser(MemberVO param);

	/**
	 * 유저 정보 저장
	 * 
	 * @param member 기술분야
	 * @return 체크된 유저정보
	 */
	String setAdmInvitation(MemberInvitationSaveDTO param);
	/**
	 * 전문위원회 - 접수현황 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<MemberInvitationVO> getAdminInvitationList(MemberInvitationVO param);
	MemberInvitationVO getAdminInviChk(MemberInvitationVO param);
	/**
	 * 전문위원회 - 접수현황 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	List<MemberVO> getAdminMemberList(MemberVO param);
	/**
	 * 전문위원회 - 접수현황 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	MemberVO getAdminMemberInfo(MemberVO param);
	List<MemberAuthVO> getAdminMemberAuth(MemberAuthVO param);
	/**
	 * 전문위원회 - 접수현황 리스트 조회
	 * @param expertReceiptVO
	 * @return
	 */
	String applyAdminMember(MemberSaveDTO param);
	
	/**
	 * 전문위원회 - 접수현황 상태별 데이터 조회 (탭)
	 * @return
	 */
	List<MemberTabVO> getMemberTabList();

	/**
	 * 페이징 데이터 조회
	 * @return
	 */
	PagingVO getPaging();

	String setComInvitation(MemberInvitationSaveDTO param);

	List<MemberInvitationVO> getComInvitationList(MemberInvitationVO params);

	ComMemberVO getComMemberInfo(ComMemberVO param);

	EndFileVO EndFileCheck(EndFileVO endFile);

	String comapply(ComMemberVO comMemberVo);

	List<ComMemberVO> totComMemberList();
	
	String otpUserSend(OtpMemVO param);

	String otpUserSend2() throws IOException;
}

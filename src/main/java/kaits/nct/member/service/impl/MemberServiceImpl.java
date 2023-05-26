package kaits.nct.member.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kaits.nct.common.model.OtpVO;
import kaits.nct.common.model.PagingVO;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.ex.model.ExInfoDataVO;
import kaits.nct.member.mapper.MemberMapper;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemHistoryVO;
import kaits.nct.member.model.MemberAuthVO;
import kaits.nct.member.model.MemberAuthorityVO;
import kaits.nct.member.model.MemberInvitationSaveDTO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberSaveDTO;
import kaits.nct.member.model.MemberTabVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.model.OtpMemVO;
import kaits.nct.member.service.MemberService;
import kaits.nct.research.model.EndFileVO;

@Service
public class MemberServiceImpl implements MemberService {
	private PagingVO paging;
	private List<MemberTabVO> tabList;
	
	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;

	/** 업무 포털 계정 히스토리 insert 서비스 **/
	@Override
	public String insertMemHistory(MemHistoryVO param) { 
		String admId = param.getAdmId();
		try {
			memberMapper.insertMemHistory(param);
        } catch (Exception e) {
            e.printStackTrace();
        }		
		return admId;
	}
	
	
	/**
	 * 로그인 처리
	 */
	@Override
	public MemberVO UserCheck(MemberVO member) {
		// TODO Auto-generated method stub
        try {
            String encPw = DataScrty.encryptPassword(member.getAdmPassword());
            member.setAdmPassword(encPw);
            MemberVO loginMember = memberMapper.UserCheck(member);
            return loginMember;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	/**
	 * OTP 인증번호 발행
	 */
	@Override
	public Map<Object, Object> otpSend(MemberVO member) {
		// TODO Auto-generated method stub
		// OTP 번호 발송 서비스
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();
    	resultMap.put("resultCode", "S");
    	resultMap.put("resultData", null);
		return resultMap;
	}

	/**
	 * OTP 인증
	 */
	@Override
	public Map<Object, Object> otpCheck(MemberVO member) {
		// TODO Auto-generated method stub
		// OTP 인증
		OtpVO otpInfo = memberMapper.getOtpAuth(member);
		boolean isOk = false;
		
		if (member.getAdmOtpNumber().equals(otpInfo.getOtpCode())) {
			isOk = true;
		}
		
		
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();
    	if (isOk) {
    		resultMap.put("resultCode", "S");
    		resultMap.put("resultMessage", "인증성공");
    	} else {
    		resultMap.put("resultCode", "F");
    		resultMap.put("resultMessage", "인증실");
    	}
    	
    	// 테스트
    	// '1234' 아닐 시 실패
    	// '인증번호 불일치'
//    	String sendOtpNumber = "1234";
//    	if (sendOtpNumber.equals(otpNumber)) {
//        	resultMap.put("resultCode", "S");
//        	resultMap.put("resultMessage", "인증성공");
//    	} else {
//        	resultMap.put("resultCode", "F");
//        	resultMap.put("resultMessage", "OTP 인증번호가 일치하지 않습니다.");
//    	}
    	
		return resultMap;
	}

	@Override
	public List<ComMemberVO> getCompany(ComMemberVO param) {
		// TODO Auto-generated method stub
		List<ComMemberVO> resultList = memberMapper.comMemberSelect(param);

		int totalRows = resultList.size();
		tabList = memberMapper.getComMemberGroupCount(param);
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);
		
		return resultList;
	}
	

	/**
	 * 로그인 처리
	 */
	@Override
	public List<MemberVO> getAdmMemberList(MemberVO member) {
		// TODO Auto-generated method stub
		return memberMapper.admMemberSelect(member);
	}

	@Override
	public String setAdmMember(MemberVO param) {
		// TODO Auto-generated method stub
        String encPw;
        String admInviYn = param.getAdmInviYn();
		try {
			encPw = DataScrty.encryptPassword(param.getAdmPassword());
			param.setAdmPassword(encPw);
            memberMapper.saveAdminMember(param);
            
            if("Y".equals(admInviYn)) {
            	String admInviKey = param.getAdmInviKey();
            	String admId = param.getAdmId();
    			System.out.println("초대 키 업데이트  업데이트"+ admInviKey + "admId:" +admId);
    			memberMapper.inviFlagUpdate(admInviKey);
    			memberMapper.inviAuthUpdate(admInviKey, admId);
    			
    			
    		}
            return "회원가입 완료";
        } catch (Exception e) {
            e.printStackTrace();
            return "회원가입 실패(서버오류)";
        }
	}
	
	

	@Override
	public boolean isExistsUser(MemberVO param) {
		// TODO Auto-generated method stub
		boolean isExists = false;
		int cntUser = memberMapper.isExistsUser(param);
		
		if (cntUser > 0) isExists = true;
		return isExists;
	}

	@Override
	public String setAdmInvitation(MemberInvitationSaveDTO param) {
		// TODO Auto-generated method stub
		String admId = memberMapper.getInvitationSeq();
		MemberInvitationVO miParam = param.getMemberInvitationInfo();
		miParam.setAdmInviId(admId);
		// 초대정보 저장
		memberMapper.saveAdminInvitation(miParam);
		
		for (MemberAuthorityVO ent : param.getTechList()) {
			ent.setAdmId(admId);
			memberMapper.saveAdminAuthority(ent);
		}
		return admId;
	}
	
	@Override
	public MemberInvitationVO getAdminInviChk(MemberInvitationVO inviCode){
		try {
			MemberInvitationVO rscInviKey = memberMapper.getAdminInviChk(inviCode);
            return rscInviKey;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public List<MemberInvitationVO> getAdminInvitationList(MemberInvitationVO param) {
		// TODO Auto-generated method stub
		List<MemberInvitationVO> resultList = memberMapper.getAdminInvitation(param);

		int totalRows = resultList.size();
		tabList = memberMapper.getAdminInvitationGroupCount(param);
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);
		
		return resultList;
	}

	@Override
	public List<MemberVO> getAdminMemberList(MemberVO param) {
		// TODO Auto-generated method stub
		List<MemberVO> resultList = memberMapper.getAdminMembers(param);

		int totalRows = resultList.size();
		tabList = memberMapper.getAdminMemberGroupCount(param);
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);
		
		return resultList;
	}
	
	@Override
	public List<MemberAuthVO> getAdminMemberAuth(MemberAuthVO param) {
		// TODO Auto-generated method stub
		List<MemberAuthVO> resultList = memberMapper.getAdminMemberAuth(param);

		return resultList;
	}

	@Override
	public MemberVO getAdminMemberInfo(MemberVO param) {
		// TODO Auto-generated method stub
        MemberVO loginMember = memberMapper.UserCheck(param);
        return loginMember;
	}

	@Override
	public String applyAdminMember(MemberSaveDTO param) {
		// TODO Auto-generated method stub
		// 승인 권한 및 상태 업데이트
		int result = memberMapper.setAdminMember(param.getAdmInfo());
		
		
		memberMapper.deleteAdminAuthority(param.getAdmInfo());
		// 기술분야 권한 추가
		System.out.println("================>"+ param.getAdmInfo());
		for (MemberAuthorityVO ent : param.getTechList()) {
			memberMapper.saveAdminAuthority(ent);
		}
		return param.getAdmInfo().getAdmId();
	}

	@Override
	public List<MemberTabVO> getMemberTabList() {
		// TODO Auto-generated method stub
		return tabList;
	}

	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}

	@Override
	public void otpSave(MemberVO member) {
		// TODO Auto-generated method stub
		memberMapper.saveOtpAuth(member);
	}
	
	@Override
	public String setComInvitation(MemberInvitationSaveDTO param) {
		// TODO Auto-generated method stub
		String admId = memberMapper.getComInvitationSeq();
		MemberInvitationVO miParam = param.getMemberInvitationInfo();
		miParam.setAdmInviId(admId);
		// 초대정보 저장
		memberMapper.setComInvitation(miParam);
		
		/*
		 * for (MemberAuthorityVO ent : param.getTechList()) { ent.setAdmId(admId);
		 * memberMapper.saveAdminAuthority(ent); }
		 */
		return admId;
	}
	
	@Override
	public List<MemberInvitationVO> getComInvitationList(MemberInvitationVO param) {
		// TODO Auto-generated method stub
		List<MemberInvitationVO> resultList = memberMapper.getComInvitation(param);

		int totalRows = resultList.size();
		tabList = memberMapper.getComInvitationGroupCount(param);
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);
		
		return resultList;
	}
	
	@Override
	public ComMemberVO getComMemberInfo(ComMemberVO param) {
		// TODO Auto-generated method stub
		ComMemberVO comMember = memberMapper.ComMember(param);
        return comMember;
	}
	
	@Override
	public EndFileVO EndFileCheck(EndFileVO diCode){
		// TODO Auto-generated method stub
		try {
			EndFileVO rscMemDi = memberMapper.EndFileCheck(diCode);
            return rscMemDi;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}	
	
	@Override
	public String comapply(ComMemberVO comMemberVo){
		// TODO Auto-generated method stub
		String result = "";
		try {
			String cpnId = comMemberVo.getCpnId();
			String cpnStat = comMemberVo.getCpnStat();
			System.out.println("승인여부 ===" + cpnId + cpnStat);
			comMemberVo.setCpnId(cpnId);
			memberMapper.comapply(comMemberVo);
            result = "S";
			
        } catch (Exception e) {
            result = "F";
        }
		return result;
	}
	
	@Override
	public List<ComMemberVO> totComMemberList() {
		// TODO Auto-generated method stub
		List<ComMemberVO> resultList = memberMapper.totComMemberList();

		
		return resultList;
	}
	
	@Override
	public String otpUserSend(OtpMemVO param) {
		// TODO Auto-generated method stub
		String rscMemDi = "test";
		try {
			/*
			 * // EndFileVO rscMemDi = memberMapper.EndFileCheck(diCode);
			 */
			return rscMemDi;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String otpUserSend2() throws IOException {
		
		String userId = "test01";
		String userName = "김연식";
		String mobile = "01028040565";
		//
		System.out.println("impl진입=====");
		URL url = new URL("https://10.10.20.100:8443/webapi/ver3/users");
		HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		httpConn.setRequestMethod("POST");
		httpConn.setRequestProperty("X-GPTWR-Authorization", "C17520438948831F42688FE4787CAC23");
		httpConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

		httpConn.setDoOutput(true);
		System.out.println("impl진입=====1");
		OutputStreamWriter writer = new OutputStreamWriter(httpConn.getOutputStream());
		System.out.println("impl진입=====1-2");
		writer.write("userId="+userId+"&userName="+userName+"&mobile="+mobile);
		System.out.println("impl진입=====1-3");
		writer.flush();
		System.out.println("impl진입=====1-4");
		writer.close();
		System.out.println("impl진입=====1-5");
		httpConn.getOutputStream().close();
		System.out.println("impl진입=====2");
		InputStream responseStream = httpConn.getResponseCode() / 100 == 2
				? httpConn.getInputStream()
				: httpConn.getErrorStream();
		Scanner s = new Scanner(responseStream).useDelimiter("\\A");
		String response = s.hasNext() ? s.next() : "";
		System.out.println("impl진입=====3");
		System.out.println(response);
		return response;
	}
}
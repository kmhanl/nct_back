package kaits.nct.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kaits.nct.common.model.NiceApiVO;
import kaits.nct.common.service.NiceService;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemHistoryVO;
import kaits.nct.member.model.MemberAuthVO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;
import kaits.nct.research.model.EndFileVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	NiceService niceService;
	
	
	/** 업무 포털 로그인 페이지 컨트롤러 **/
    @RequestMapping(value = {"/login", "/login.do"})
    public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/dash.do";
    	}
    	model.addAttribute("member", user);
    	// 로그인 화면으로 이동
        return ".tiles/member/login";
    }
    
    /** 업무 포털 로그아웃 컨트롤러 **/
    @RequestMapping(value = {"/logout", "/logout.do"})
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	String admHisCode = "MEM002";
    	String admHisMenu = "BASIC";
    	String admHisComment = "업무 포털 로그아웃";
    	MemHistoryVO memHistory = new MemHistoryVO();
    	memHistory.setAdmId(user.getAdmId());
    	memHistory.setAdmHisMenu(admHisMenu);
    	memHistory.setAdmHisCode(admHisCode);
    	memHistory.setAdmHisComment(admHisComment);
    	
    	///** 업무 포털 계정 히스토리 insert **///
    	//String saveMemHistory = memberService.insertMemHistory(memHistory);
    	
	    session.removeAttribute("user"); // 세션 종료
    	return "redirect:/member/login"; // 로그인 화면으로 이동
    }
	
    /**
	 * 회원가입 - 화면 컨트롤러
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = {"/join", "/join.do"})
    public String join(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
        	session.removeAttribute("user");
    	}
    	String nctCode = request.getParameter("nctCode");
    	String joinMode = "";
    	
    	if(nctCode != null) {
    		joinMode = "InviJoin";
    			MemberInvitationVO params = new MemberInvitationVO(); // 리스트 조회 조건 파라메터 생성
    			params.setAdmInviId(nctCode);
    			MemberInvitationVO inviChk = memberService.getAdminInviChk(params);
    			model.addAttribute("inviChk", inviChk);
    	}else {
    		joinMode = "NewJoin";
    	}
    	model.addAttribute("joinMode", joinMode);
    	model.addAttribute("nctCode", nctCode);
    	// 회원가입 - 동의 및 인증 화면으로 이동
        return ".tiles/member/join";
    }
    
    
    
	/**
	 * 회원가입 - 회원가입요청 화면 컨트롤러
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping(value = {"/joincall", "/joincall.do"})
    public String joinCall(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
        	session.removeAttribute("user");
    	}
    	// 회원가입 - 회원가입요청 화면으로 이동
        return ".tiles/member/joincall";
    }

	/**
	 * 회원가입 - 동의 및 인증 화면 컨트롤러
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping(value = {"/joinagree", "/joinagree.do"})
    public String joinagree(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
        	session.removeAttribute("user");
    	}
    	// 회원가입 - 동의 및 인증 화면으로 이동
        return ".tiles/member/joinagree";
    }

	/**
	 * 회원가입 - 회원 정보 입력 화면 컨트롤러
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping(value = {"/joinform", "/joinform.do"})
    public String joinform(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
        	session.removeAttribute("user");
    	}
    	// 회원가입 - 회원 정보 입력 화면으로 이동
        return ".tiles/member/joinform";
    }
    
    /**
     * 회원가입 - 회원 가입 완료 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/joininfo", "/joininfo.do"})
    public String joininfo(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
    		session.removeAttribute("user");
    	}
    	// 회원가입 - 회원 가입 완료 화면으로 이동
    	return ".tiles/member/joininfo";
    }
    
    /**
     * 회원가입 - 회원 가입 완료 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/meminfo", "/meminfo.do"})
    public String meminfo(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
    		session.removeAttribute("user");
    	}
    	
    	String infoCode = request.getParameter("infoCode");
    	System.out.println(infoCode+"===========================");
    	model.addAttribute("infoCode", infoCode);
    	
    	// 회원가입 - 회원 가입 완료 화면으로 이동
    	return ".tiles/member/memInfo";
    }
    
    /**
     * 아이디 찾기 - 정보 입력 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/findid", "/findid.do"})
    public String findid(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
    		session.removeAttribute("user");
    	}
    	// 아이디 찾기 - 정보 입력 화면으로 이동
    	return ".tiles/member/findid";
    }
    
    /**
     * 아이디 찾기 - 결과 확인 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/findidinfo", "/findidinfo.do"})
    public String findidinfo(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
    		session.removeAttribute("user");
    	}
    	// 아이디 찾기 - 결과 확인 화면으로 이동
    	return ".tiles/member/findidinfo";
    }
    
    /**
     * 비밀번호 찾기 - 정보 입력 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/findpw", "/findpw.do"})
    public String findpw(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
    		session.removeAttribute("user");
    	}
    	// 비밀번호 찾기 - 정보 입력 화면으로 이동
    	return ".tiles/member/findpw";
    }
    
    /**
     * 비밀번호 찾기 - 결과 확인 및 비밀번호 재설정 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/findpwinfo", "/findpwinfo.do"})
    public String findpwinfo(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	
    	// 세션 확인
    	if (user != null) {
    		// 사용자가 로그인되어 있으면 세션 종료
    		session.removeAttribute("user");
    	}
    	// 비밀번호 찾기 - 결과 확인 및 비밀번호 재설정 화면으로 이동
    	return ".tiles/member/findpwinfo";
    }
    
    /**
     * 업무 포털 회원 초대 관리 리스트
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/invitationList", "/invitationList.do"})
    public String showinvitationList(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		model.addAttribute("message", "접근 권한이 없습니다.");
    		return ".tiles/common/error";
    	}
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "06");
    	model.addAttribute("subMenuType", "00");

    	MemberInvitationVO params = new MemberInvitationVO(); // 리스트 조회 조건 파라메터 생성
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	String admInviStat = request.getParameter("admInviStat");
    	if (!"200".equals(admInviStat) && !"400".equals(admInviStat)) {
    		admInviStat = null;
    	}
    	params.setAdmInviStat(admInviStat);
    	
    	List<MemberInvitationVO> invitationList = memberService.getAdminInvitationList(params);
//
    	model.addAttribute("invitationList", invitationList);
    	model.addAttribute("tabList", memberService.getMemberTabList());
    	model.addAttribute("paging", memberService.getPaging());
    	return "/member/invitationList";
    }
    
    /**
     * 업무 포털 회원 관리 초대 신규 등록
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/invitationWrite", "/invitationWrite.do"})
    public String showinvitationWritePopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	return "/member/popup/invitationWrite";
    }
    
    /**
     * 업무 포털 회원 관리 리스트
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/memberList", "/memberList.do"})
    public String showmemberList(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		model.addAttribute("message", "접근 권한이 없습니다.");
    		return ".tiles/common/error";
    	}
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "06");
    	model.addAttribute("subMenuType", "01");

    	MemberVO params = new MemberVO(); // 리스트 조회 조건 파라메터 생성
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	String admStat = request.getParameter("admStat");
    	if (!"200".equals(admStat) && !"300".equals(admStat) && !"400".equals(admStat)) {
    		admStat = null;
    	}
    	params.setAdmStat(admStat);
    	
    	List<MemberVO> memberList = memberService.getAdminMemberList(params);
//
    	model.addAttribute("memberList", memberList);
    	model.addAttribute("tabList", memberService.getMemberTabList());
    	model.addAttribute("paging", memberService.getPaging());
    	
    	return "/member/memberList";
    }
    
    /**
     * 업무 포털 회원 관리 상세 보기
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/memberEdit", "/memberEdit.do"})
    public String showmemberEditPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String admId = request.getParameter("admId");
    	
    	MemberVO param = new MemberVO();
    	param.setAdmId(admId);
    	
    	MemberVO member = memberService.getAdminMemberInfo(param);
    	
    	model.addAttribute("member", member);
    	
    	return "/member/popup/memberEdit";
    }
    
    /**
     * 업무 포털 회원 관리 상세 보기
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/memberview", "/memberview.do"})
    public String showmemberviewPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String admId = request.getParameter("admId");
    	
    	MemberVO param = new MemberVO();
    	param.setAdmId(admId);
    	MemberVO member = memberService.getAdminMemberInfo(param);
    	model.addAttribute("member", member);
    	
    	String mode = request.getParameter("mode");
    	String admInviKey = request.getParameter("admInviKey");
    	String admstat = request.getParameter("admstat");
    	System.out.println("================>"+ admInviKey + "====>"+ mode + " admstat:"+ admstat);
    	
    	MemberAuthVO params = new MemberAuthVO();
		
    	params.setAdmAuthId(admId);
    	List<MemberAuthVO> memberAuth = memberService.getAdminMemberAuth(params);
    	model.addAttribute("memberAuth", memberAuth);
    	//System.out.println("================>"+ memberAuth + "====>");
    	return "/member/popup/memberView";
    }
    
    /**
     * 기업 포털 회원 관리 리스트
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/commemList", "/commemList.do"})
    public String showcommemList(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		model.addAttribute("message", "접근 권한이 없습니다.");
    		return ".tiles/common/error";
    	}
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "05");
    	model.addAttribute("subMenuType", "00");

    	ComMemberVO params = new ComMemberVO(); // 리스트 조회 조건 파라메터 생성
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	String cpnStat = request.getParameter("cpnStat");
    	if (!"200".equals(cpnStat) && !"300".equals(cpnStat) && !"400".equals(cpnStat)) {
    		cpnStat = null;
    	}
    	params.setCpnStat(cpnStat);
    	
    	List<ComMemberVO> memberList = memberService.getCompany(params);
//
    	model.addAttribute("memberList", memberList);
    	model.addAttribute("tabList", memberService.getMemberTabList());
    	model.addAttribute("paging", memberService.getPaging());

    	return "/member/commemList";
    }
    
    /**
     * 업무 포털 회원 관리 상세 보기
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/comMemberInfo", "/comMemberInfo.do"})
    public String showcommemberviewPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String cpnId = request.getParameter("cpnId");
    	
    	ComMemberVO param = new ComMemberVO();
    	param.setCpnId(cpnId);
    	
    	ComMemberVO member = memberService.getComMemberInfo(param);
    	EndFileVO endFile = new EndFileVO();
		System.out.println(user.getCpnId());
    	endFile.setFileRegId(cpnId);
    	EndFileVO endStausFile = memberService.EndFileCheck(endFile);
    	model.addAttribute("endStausFile", endStausFile);
    	
    	model.addAttribute("user", member);
    	
    	return "/member/popup/comMemberView";
    }
    
    
}

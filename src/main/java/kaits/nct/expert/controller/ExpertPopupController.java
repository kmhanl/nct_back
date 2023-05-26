package kaits.nct.expert.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kaits.nct.expert.model.ExpertCommitteeMemberVO;
import kaits.nct.expert.model.ExpertCommitteeVO;
import kaits.nct.expert.model.ExpertFileVO;
import kaits.nct.expert.model.ExpertTechVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptCountryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptHistoryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptTechVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;

@Controller
@RequestMapping(value = "/expert/popup")
public class ExpertPopupController {
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Value("#{prop['file.url']}")
	String filePath;

	@Autowired
	private ExpertService expertService;
	
	@Autowired
	private MemberService memberService;
	
    /**
     * 전문위원회 - 접수현황 신규접수등록 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/receipt/write", "/receipt/write.do"})
    public String showReceiptWritePopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	model.addAttribute("companyList", memberService.getCompany(new ComMemberVO()));
    	model.addAttribute("techList", expertService.getTechList());
    	
//    	ExpertReceiptVO params = new ExpertReceiptVO();
//    	if(request.getParameter("pageNo") == null) {
//    		params.setPageInit();
//    	} else {
//    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
//    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
//    	}
//    	params.setRcptStatus(request.getParameter("rcptStatus"));
//    	
//    	List<ExpertReceiptVO> receiptList = expertService.getReceiptList(params);
//    	
//    	model.addAttribute("receiptList", receiptList);
//    	model.addAttribute("receiptGroupList", expertService.getReceiptGroupList());
//    	model.addAttribute("paging", expertService.getPaging());
    	
    	return "/expert/popup/recreiptwritelayer";
    }
    
    /**
     * 전문위원회 - 접수현황 상세보기 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/receipt/detail", "/receipt/detail.do"})
    public String showReceiptDetailPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);

    	String rcptIdx = request.getParameter("rcptIdx");
    	String viewerType = request.getParameter("viewerType");
    	ExpertReceiptVO params = new ExpertReceiptVO(rcptIdx);
    	params.setAdmGroup(user.getAdmGroup());
    	params.setAdmId(user.getAdmId());
    	System.out.println("팝업타입"+ viewerType);
    	List<ExpertReceiptVO> receiptList = expertService.getReceiptList(params);
    	if (receiptList.size() == 0) {
    		return null;
    	}
    	List<ExpertFileVO> fileList = expertService.getReceiptFileList(new ExpertFileVO(rcptIdx));
		model.addAttribute("receipt", receiptList.get(0));
		model.addAttribute("agendaCnt", receiptList.get(0).getRcptAgendaCnt());
		model.addAttribute("receiptTechList", expertService.getReceiptTechList(new ExpertReceiptTechVO(rcptIdx)));
		model.addAttribute("receiptCountryList", expertService.getReceiptCountryList(new ExpertReceiptCountryVO(rcptIdx)));
		model.addAttribute("receiptFileList", fileList);
		model.addAttribute("receiptHistoryList", expertService.getReceiptHistoryList(new ExpertReceiptHistoryVO(rcptIdx)));
		model.addAttribute("techList", expertService.getTechListWithCompetence(rcptIdx));
		model.addAttribute("viewerPath", viewerPath);
		model.addAttribute("filePath", filePath);
		model.addAttribute("rcptIdx", rcptIdx);
		model.addAttribute("viewerType", viewerType);
    	
    	return "/expert/popup/recreiptviewlayer";
    }
    
    /**
     * 전문위원회 - 안건현황 검토요청 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agenda/write", "/agenda/write.do"})
    public String showAgendaWritePopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	model.addAttribute("rcpts", rcptInfo.get("rcpts"));
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);

    	List<ExpertTechVO> techList = expertService.getTechList();
    	model.addAttribute("techList", techList);
    	
    	return "/expert/popup/sendagendalayer";
    }
    
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agenda/modify", "/agenda/modify.do"})
    public String showAgendaModifyPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = request.getParameter("committeeIdx");
    	String committeeTechId = request.getParameter("committeeTechId");
    	
    	System.out.println("================>"+ committeeIdx + "===" +committeeTechId);
    	
    	
    	
    	model.addAttribute("agdExIdx", request.getParameter("committeeIdx"));
    	return "/expert/popup/agdmodifylayer";
    }
    
    /**
     * 전문위원회 - 안건현황 상세보기 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agenda/detail", "/agenda/detail.do"})
    public String showAgendaDetailPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	String agdCode = request.getParameter("agdCode");
		ExpertAgendaStatVO param = new ExpertAgendaStatVO();
		param.setAgdCode(agdCode);
		List<ExpertAgendaStatVO> resultList = expertService.getAgendaStatList(param);
		
		model.addAttribute("agdData", resultList.get(0));
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/agendaviewlayer";
    }
    
    /**
     * 전문위원회 - 검토 결과 확정 팝업
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agenda/completed", "/agenda/completed.do"})
    public String showAgendaCompletedPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	String agdCode = request.getParameter("agdCode");
		ExpertAgendaStatVO param = new ExpertAgendaStatVO();
		param.setAgdCode(agdCode);
		List<ExpertAgendaStatVO> resultList = expertService.getAgendaStatList(param);
		
		model.addAttribute("agdData", resultList.get(0));
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/agenacomlayer";
    }
    
    /**
     * 전문위원회 - 검토 결과 확정 팝업
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agenda/completed02", "/agenda/completed02.do"})
    public String showAgendaCompleted02Popup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	String agdCode = request.getParameter("agdCode");
		ExpertAgendaStatVO param = new ExpertAgendaStatVO();
		param.setAgdCode(agdCode);
		List<ExpertAgendaStatVO> resultList = expertService.getAgendaStatList(param);
		
		model.addAttribute("agdData", resultList.get(0));
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/agenacomlayer02";
    }

    /**
     * 전문위원회 - 안건현황 결과 확정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agenda/final", "/agenda/final.do"})
    public String showAgendaFinalPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	
    	return "/expert/popup/finalagendalayer";
    }
    
    /**
     * 전문위원회 - 검토준비중 위원회 구성 팝업 컨트롤러2
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/committee/write", "/committee/write.do"})
    public String showCommitteeWritepPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/committeewritelayer";
    }
    
    /**
     * 전문위원회 - 참여 인원 수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/member/modify", "/member/modify.do"})
    public String showMemberModifyPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	ExpertCommitteeMemberVO param = new ExpertCommitteeMemberVO();
    	param.setCommitteeIdx(request.getParameter("committeeIdx"));
    	param.setCommitteeTechId(request.getParameter("techId"));
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(param);
    	
    	model.addAttribute("memberList", memberList);
    	return "/expert/popup/memmodifylayer";
    }
    
    /**
     * 전문위원회 - 개최 후보일 수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/date/modify", "/date/modify.do"})
    public String showDateModifyPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = request.getParameter("committeeIdx");
    	String datepick = request.getParameter("datepick");
    	boolean isDatePick = ("Y".equals(datepick) ? true : false);
    	
    	ExpertCommitteeVO param = new ExpertCommitteeVO();
    	param.setAdmGroup(user.getAdmGroup());
    	param.setAdmId(user.getAdmId()); // 사용자 권한
    	param.setCommitteeIdx(committeeIdx);
    	param.setDatepick(isDatePick);
    	
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(param);
    	model.addAttribute("committeeData", committeeData);
    	
    	return "/expert/popup/datemodifylayer";
    }
    
    /**
     * 전문위원회 - 참여일선택 기술안보과 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/datepick01", "/datepick01.do"})
    public String showDatepick01Popup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = request.getParameter("committeeIdx");

    	ExpertCommitteeMemberVO param = new ExpertCommitteeMemberVO();
    	param.setCommitteeIdx(committeeIdx);
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(param);
    	
    	ExpertCommitteeVO param2 = new ExpertCommitteeVO();
    	param2.setAdmGroup(user.getAdmGroup());
    	param2.setCommitteeIdx(committeeIdx);
    	
    	model.addAttribute("memberList", memberList);
    	model.addAttribute("committeeData", expertService.getCommitteeData(param2));
    	
    	return "/expert/popup/datepicklayer01";
    }
    
    /**
     * 전문위원회 - 참여일선택 보호협회 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/datepick02", "/datepick02.do"})
    public String showDatepick02Popup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = request.getParameter("committeeIdx");

    	ExpertCommitteeMemberVO param = new ExpertCommitteeMemberVO();
    	param.setCommitteeIdx(committeeIdx);
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(param);
    	
    	ExpertCommitteeVO param2 = new ExpertCommitteeVO();
    	param2.setAdmGroup(user.getAdmGroup());
    	param2.setCommitteeIdx(committeeIdx);
    	
    	model.addAttribute("memberList", memberList);
    	model.addAttribute("committeeData", expertService.getCommitteeData(param2));
    	
    	return "/expert/popup/datepicklayer02";
    }
    
    /**
     * 전문위원회 - 소관과 기술안보과 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/datepick03", "/datepick03.do"})
    public String showDatepick03Popup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = request.getParameter("committeeIdx");

    	ExpertCommitteeMemberVO param = new ExpertCommitteeMemberVO();
    	param.setCommitteeIdx(committeeIdx);
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(param);
    	
    	ExpertCommitteeVO param2 = new ExpertCommitteeVO();
    	param2.setAdmId(user.getAdmId());
    	param2.setAdmGroup(user.getAdmGroup());
    	param2.setCommitteeIdx(committeeIdx);
    	
    	model.addAttribute("memberList", memberList);
    	model.addAttribute("committeeData", expertService.getCommitteeData(param2));
    	
    	return "/expert/popup/datepicklayer03";
    }
    
    /**
     * 전문위원회 - 전문위원/기술위원 기술안보과 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/datepick04", "/datepick04.do"})
    public String showDatepick04Popup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/datepicklayer04";
    }
    
    /**
     * 전문위원회 - SMS발송 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/sms/send", "/sms/send.do"})
    public String showSendSmsPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	String committeeIdx = request.getParameter("committeeIdx");
    	
    	ExpertCommitteeMemberVO param = new ExpertCommitteeMemberVO();
    	param.setCommitteeIdx(committeeIdx);
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(param);
    	System.out.println(param);
    	System.out.println(memberList);
    	model.addAttribute("memberList", memberList);
    	
    	return "/expert/popup/sendsmslayer";
    }
    
    /**
     * 전문위원회 - E-mail발송 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/email/send", "/email/send.do"})
    public String showSendEmailPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/sendemaillayer";
    }
    
    /**
     * 전문위원회 - 검토 의견 작성 > 비밀유지의무 동의서 팝업
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agree/SecretAgree", "/agree/SecretAgree.do"})
    public String showSecretAgreePopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/secretAgree";
    }
    
    
    /**
     * 전문위원회 - 자료 열람 > 비밀유지의무 동의서 팝업 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agree/secretAgreeViewPopup", "/agree/secretAgreeViewPopup.do"})
    public String showsecretAgreeViewPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = (String) request.getParameter("committeeIdx");
    	ExpertCommitteeVO param = new ExpertCommitteeVO();
    	param.setCommitteeIdx(committeeIdx);
    	
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(param);
    	model.addAttribute("exData", committeeData);
    	
    	return "/expert/popup/secretAgreeViewPopup";
    }
    
    /**
     * 전문위원회 - 자료 열람 > 비밀유지의무 동의서 팝업 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agree/secretAgreeWritePopup", "/agree/secretAgreeWritePopup.do"})
    public String showsecretAgreeWritePopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = (String) request.getParameter("committeeIdx");
    	ExpertCommitteeVO param = new ExpertCommitteeVO();
    	param.setCommitteeIdx(committeeIdx);
    	
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(param);
    	model.addAttribute("exData", committeeData);
    	
    	return "/expert/popup/secretAgreeWritePopup";
    }
    
    @RequestMapping(value = {"/agree/secretAgreeSavePopup", "/agree/secretAgreeSavePopup.do"})
    public String showsecretAgreeSavePopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = (String) request.getParameter("committeeIdx");
    	ExpertCommitteeVO param = new ExpertCommitteeVO();
    	param.setCommitteeIdx(committeeIdx);
    	
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(param);
    	model.addAttribute("exData", committeeData);
    	
    	return "/expert/popup/secretAgreeSavePopup";
    }
    
    @RequestMapping(value = {"/send/CommitteeAdminPopup", "/send/CommitteeAdminPopup.do"})
    public String showCommitteeAdminPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = (String) request.getParameter("committeeIdx");
    	ExpertCommitteeVO param = new ExpertCommitteeVO();
    	param.setCommitteeIdx(committeeIdx);
    	
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(param);
    	model.addAttribute("exData", committeeData);
    	model.addAttribute("committeeIdx", committeeIdx);
    	
    	return "/expert/popup/sendCommitteeAdminPopup";
    }
    
    /**
     * 전문위원회 - 검토 의견 작성 > 비밀유지의무 동의서 팝업
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agree/BankAgree", "/agree/BankAgree.do"})
    public String showBankAgreePopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	return "/expert/popup/bankAgree";
    }
    
    
    
    /** 전문위원회 - 위원회 현황 > 전문위 취소 안내 팝업  컨트롤러 * */
    @RequestMapping(value = {"/cancelEx", "/cancelEx.do"})
    public String cancelExPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	String committeeIdx = request.getParameter("committeeIdx");
    	System.out.println("전문위원회 > 위원회 현황 > 전문위 취소================>"+ committeeIdx);
    	model.addAttribute("committeeIdx", request.getParameter("committeeIdx"));
    	return "/expert/alert/cancleEx";
    }
    
    
    
    
}

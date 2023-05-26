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

import kaits.nct.expert.model.ExpertCommitteeOpinionVO;
import kaits.nct.expert.model.ExpertFileVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.agenda.ExpertAgendaTechVO;
import kaits.nct.expert.model.receipt.ExpertReceiptCountryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptTechVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.member.model.MemberVO;

@Controller
@RequestMapping(value = "/expert/opinion")
public class ExpertOpinionController {
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Value("#{prop['file.url']}")
	String filePath;
	
	@Autowired
	private ExpertService expertService;

		
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinionView", "/opinionView.do"})
    public String showopinionView(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx"); //안건번호
    	String exStat = request.getParameter("exStat"); // 위원회 상태
    	String listIdx = request.getParameter("listIdx"); // 안건 순서
    	String rcptIdx = request.getParameter("rcptIdx"); // 접수 번호
    	String committeeIdx = request.getParameter("committeeIdx"); // 위원회 번호
    	String techId = request.getParameter("techId");
    	model.addAttribute("techId", techId);
    	model.addAttribute("exStat", exStat);
    	model.addAttribute("listIdx", listIdx);
    	model.addAttribute("rcptIdx", rcptIdx);
    	
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N")); 
    	
    	//model.addAttribute("rcptIdx", agdData.getRcptIdx());
    	//param.setRcptIdx(agdData.getRcptIdx());
    	
    	model.addAttribute("receiptTechList", expertService.getReceiptTechList(new ExpertReceiptTechVO(rcptIdx)));
		model.addAttribute("receiptCountryList", expertService.getReceiptCountryList(new ExpertReceiptCountryVO(rcptIdx)));
    	List<ExpertFileVO> fileList = expertService.getReceiptFileList(new ExpertFileVO(rcptIdx));
    	model.addAttribute("receiptFileList", fileList);
    	model.addAttribute("viewerPath", viewerPath);
		model.addAttribute("filePath", filePath);
    	
    	
    	ExpertCommitteeOpinionVO param = new ExpertCommitteeOpinionVO();
    	param.setCommitteeIdx(committeeIdx);
    	param.setAgdCode(agdCode);
    	param.setCommitteeAdmId(user.getAdmId());
    	param.setCommitteeOptType("N");
    	
    	model.addAttribute("opinionData", expertService.getCommitteeOpinionData(param));
    	
    	ExpertAgendaTechVO tec = new ExpertAgendaTechVO();
    	tec.setTechId(techId);
    	List<ExpertAgendaTechVO> techAreaList = expertService.getTechAreaList(tec);
    	model.addAttribute("techAreaList", techAreaList);
    	System.out.println("================>"+ techAreaList);
    	return "/expert/opinion/opinionView";
    }
    
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinionEnd", "/opinionEnd.do"})
    public String showopinionEnd(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx"); //안건번호
    	String exStat = request.getParameter("exStat"); // 위원회 상태
    	String listIdx = request.getParameter("listIdx"); // 안건 순서
    	String rcptIdx = request.getParameter("rcptIdx"); // 접수 번호
    	String committeeIdx = request.getParameter("committeeIdx"); // 위원회 번호
    	model.addAttribute("exStat", exStat);
    	model.addAttribute("listIdx", listIdx);
    	model.addAttribute("rcptIdx", rcptIdx);
    	
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N")); 
    	
    	//model.addAttribute("rcptIdx", agdData.getRcptIdx());
    	//param.setRcptIdx(agdData.getRcptIdx());
    	
    	model.addAttribute("receiptTechList", expertService.getReceiptTechList(new ExpertReceiptTechVO(rcptIdx)));
		model.addAttribute("receiptCountryList", expertService.getReceiptCountryList(new ExpertReceiptCountryVO(rcptIdx)));
    	List<ExpertFileVO> fileList = expertService.getReceiptFileList(new ExpertFileVO(rcptIdx));
    	model.addAttribute("receiptFileList", fileList);
    	model.addAttribute("viewerPath", viewerPath);
		model.addAttribute("filePath", filePath);
    	
    	
    	ExpertCommitteeOpinionVO param = new ExpertCommitteeOpinionVO();
    	param.setCommitteeIdx(committeeIdx);
    	param.setAgdCode(agdCode);
    	param.setCommitteeAdmId(user.getAdmId());
    	param.setCommitteeOptType("N");
    	model.addAttribute("opinionData", expertService.getCommitteeOpinionData(param));
    	
    	return "/expert/opinion/opinionEnd";
    }
    
    
    
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion02", "/opinion02.do"})
    public String showopinion02(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion02";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion03", "/opinion03.do"})
    public String showopinion03(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	String committeeIdx = request.getParameter("committeeIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	ExpertCommitteeOpinionVO param = new ExpertCommitteeOpinionVO();
    	param.setCommitteeIdx(committeeIdx);
    	param.setAgdCode(agdCode);
    	param.setCommitteeAdmId(user.getAdmId());
    	param.setCommitteeOptType("N");
    	
    	model.addAttribute("opinionData", expertService.getCommitteeOpinionData(param));
    	
    	return "/expert/opinion/opinion03";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion04", "/opinion04.do"})
    public String showopinion04(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion04";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion05", "/opinion05.do"})
    public String showopinion05(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion05";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion06", "/opinion06.do"})
    public String showopinion06(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion06";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion07", "/opinion07.do"})
    public String showopinion07(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion07";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion08", "/opinion08.do"})
    public String showopinion08(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion08";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion09", "/opinion09.do"})
    public String showopinion09(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion09";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion10", "/opinion10.do"})
    public String showopinion10(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion10";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinion11", "/opinion11.do"})
    public String showopinion11(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	return "/expert/opinion/opinion11";
    }
    
    /**
     * 전문위원회 - 기술안보과 이관 안건 상세 - 여부 판정
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinionEnd01", "/opinionEnd01.do"})
    public String showopinionend01(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "Y"));
    	
    	return "/expert/opinion/opinionEnd01";
    }
    /**
     * 전문위원회 - 안건현황 안건수정 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinionEnd03", "/opinionEnd03.do"})
    public String showopinionEnd03(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	String committeeIdx = request.getParameter("committeeIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "N"));
    	
    	ExpertCommitteeOpinionVO param = new ExpertCommitteeOpinionVO();
    	param.setCommitteeIdx(committeeIdx);
    	param.setAgdCode(agdCode);
    	param.setCommitteeAdmId(user.getAdmId());
    	param.setCommitteeOptType("N");
    	
    	model.addAttribute("opinionData", expertService.getCommitteeOpinionData(param));
    	
    	return "/expert/opinion/opinionEnd03";
    }
    
    /**
     * 전문위원회 - 기술안보과 이관 안건 상세 -수출 신고
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/opinionEnd07", "/opinionEnd07.do"})
    public String showopinionend07(HttpServletRequest request, HttpServletResponse response
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
    	
    	String agdCode = request.getParameter("agdIdx");
    	model.addAttribute("agdCode", agdCode);
    	model.addAttribute("agdData", this.getAgendaData(agdCode, user.getAdmId(), "Y"));
    	
    	return "/expert/opinion/opinionEnd07";
    }
    
    /**
     * 안건 데이터 가져오기
     * @param agdCode 안건코드 AGD_CODE
     * @return ExpertAgendaStatVO 안건데이터
     */
    private ExpertAgendaStatVO getAgendaData(String agdCode, String admId, String finalOpinionYn) {
    	ExpertAgendaStatVO agdParam = new ExpertAgendaStatVO();
    	agdParam.setAgdCode(agdCode);    	
    	agdParam.setAdmId(admId);
    	agdParam.setFinalOpinionYn(finalOpinionYn);
    	List<ExpertAgendaStatVO> agendaList = expertService.getAgendaStatList(agdParam);
    	return agendaList.get(0);
    }
}

package kaits.nct.ex.controller;

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

import kaits.nct.ex.model.ExInfoDataVO;
import kaits.nct.ex.service.ExService;
import kaits.nct.expert.model.ExDataInfoVO;
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
@RequestMapping(value = "/ex/popup")
public class ExPopupController {
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Value("#{prop['file.url']}")
	String filePath;

	@Autowired
	private ExService exService;
	
	@Autowired
	private MemberService memberService;
	
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
    	String deleteType = request.getParameter("deleteType");
    	
    	ExInfoDataVO exParam = new ExInfoDataVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExInfoDataVO> exInfo = exService.getExInfoData(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	
    	System.out.println("전문위원회 > 위원회 현황 > 전문위 취소================>"+ committeeIdx +":"+ deleteType );
    	model.addAttribute("committeeIdx", request.getParameter("committeeIdx"));
    	model.addAttribute("deleteType", request.getParameter("deleteType"));
    	
    	return "/expert/alert/cancleEx";
    }
    
    /** 전문위원회 - 위원회 현황 > 전문위 개최 안내 팝업  컨트롤러 * */
    @RequestMapping(value = {"/openEx", "/openEx.do"})
    public String openExPopup(HttpServletRequest request, HttpServletResponse response
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
    	String deleteType = request.getParameter("deleteType");
    	
    	ExInfoDataVO exParam = new ExInfoDataVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExInfoDataVO> exInfo = exService.getExInfoData(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	
    	System.out.println("전문위원회 > 위원회 현황 > 전문위 개최 Alert================>"+ committeeIdx);
    	model.addAttribute("committeeIdx", request.getParameter("committeeIdx"));
    	model.addAttribute("deleteType", request.getParameter("deleteType"));
    	
    	return "/expert/alert/openEx";
    }
    
    /** 전문위원회 - 위원회 현황 > 전문위 개최 회수  안내 팝업  컨트롤러 * */
    @RequestMapping(value = {"/backEx", "/backEx.do"})
    public String backExPopup(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExInfoDataVO exParam = new ExInfoDataVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExInfoDataVO> exInfo = exService.getExInfoData(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	
    	
    	System.out.println("전문위원회 > 위원회 현황 > 전문위 개최 회수 ================>"+ committeeIdx);
    	model.addAttribute("committeeIdx", request.getParameter("committeeIdx"));
    	return "/expert/alert/backEx";
    }
    
    /** 전문위원회 - 위원회 현황 > 전문위 종료 안내 팝업  컨트롤러 * */
    @RequestMapping(value = {"/endEx", "/endEx.do"})
    public String endExPopup(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExInfoDataVO exParam = new ExInfoDataVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExInfoDataVO> exInfo = exService.getExInfoData(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	
    	System.out.println("전문위원회 > 위원회 현황 > 전문위 종료 Alert================>"+ committeeIdx);
    	model.addAttribute("committeeIdx", request.getParameter("committeeIdx"));
    	
    	
    	return "/expert/alert/endEx";
    }
    
    /** 전문위원회 - 위원회 현황 > 전문위 종료 회수  안내 팝업  컨트롤러 * */
    @RequestMapping(value = {"/endbackEx", "/endbackEx.do"})
    public String endbackExPopup(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExInfoDataVO exParam = new ExInfoDataVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExInfoDataVO> exInfo = exService.getExInfoData(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	
    	
    	System.out.println("전문위원회 > 위원회 현황 > 전문위 개최 회수 ================>"+ committeeIdx);
    	model.addAttribute("committeeIdx", request.getParameter("committeeIdx"));
    	return "/expert/alert/endbackEx";
    }
    
    /** 전문위원회 - 위원회 현황 > 전문위 종료 회수  안내 팝업  컨트롤러 * */
    @RequestMapping(value = {"/returnEx", "/returnEx.do"})
    public String returnExPopup(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExInfoDataVO exParam = new ExInfoDataVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExInfoDataVO> exInfo = exService.getExInfoData(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	
    	
    	System.out.println("전문위원회 > 위원회 현황 > 전문위 개최 회수 ================>"+ committeeIdx);
    	model.addAttribute("committeeIdx", request.getParameter("committeeIdx"));
    	return "/expert/alert/returnEx";
    }
    
}

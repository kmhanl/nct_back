package kaits.nct.research.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;

import kaits.nct.common.model.SmsSaveDTO;
import kaits.nct.common.model.SmsVO;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.research.model.ResearchMemberVO;
import kaits.nct.research.model.ResearchVO;
import kaits.nct.research.service.ResearchService;
import kaits.nct.saexpert.model.SaExpertAgendaVO;
import kaits.nct.saexpert.service.SaExpertService;

@Controller
@RequestMapping(value = "/research")
public class ResearchController {
	@Autowired
	private ResearchService researchService;
	
	/**
     * 실태조사 > 실태 조사 리스트 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/researchList", "/researchList.do"})
    public String showAgendaList(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "00");
    	
    	ResearchVO params = new ResearchVO(); // 리스트 조회 조건 파라메터 생성
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	
    	List<ResearchVO> researchList = researchService.getResearchList(params);
    	
    	model.addAttribute("researchList", researchList);
    	model.addAttribute("paging", researchService.getPaging());
    	
    	return "/research/researchList";
    }
    
    /**
     * 보호위원회 - 안건현황 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/researchView", "/researchView.do"})
    public String showresearchView(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "00");
    	
    	return "/research/researchView";
    }
    
    /**
     * 보호위원회 - 안건현황 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/targetList", "/targetList.do"})
    public String showtargetList(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "01");
    	
    	return "/research/targetList";
    }
    
    /**
     * 보호위원회 - 안건현황 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/targetInsert", "/targetInsert.do"})
    public String showtargetInsert(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "01");
    	
    	return "/research/targetInsert";
    }
    
    /**
     * 실태조사 메일 발송 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/targetSendList", "/targetSendList.do"})
    public String showtargetSendList(HttpServletRequest request, HttpServletResponse response
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
    	String rscCode = "RSC-2022-0000";
    	ResearchMemberVO params = new ResearchMemberVO(); // 리스트 조회 조건 파라메터 생성
    	params.setRscCode(rscCode);
    	
    	List<ResearchMemberVO> researchList = researchService.getTargetList(params);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "01");
    	model.addAttribute("researchList", researchList);
    	return "/research/targetSendList";
    }
    
    /**
     * 실태조사 메일 발송 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/targetSendList", "/targetSendList02.do"})
    public String targetSendList02(HttpServletRequest request, HttpServletResponse response
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
    	String rscCode = "RSC-2022-0000";
    	ResearchMemberVO params = new ResearchMemberVO(); // 리스트 조회 조건 파라메터 생성
    	params.setRscCode(rscCode);
    	
    	List<ResearchMemberVO> researchList = researchService.getTargetTestList(params);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "01");
    	model.addAttribute("researchList", researchList);
    	return "/research/targetSendList02";
    }
    /**
     * 실태조사 메일 발송 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/targetSendList03", "/targetSendList03.do"})
    public String targetSendList03(HttpServletRequest request, HttpServletResponse response
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
    	String rscCode = "RSC-2022-0000";
    	ResearchMemberVO params = new ResearchMemberVO(); // 리스트 조회 조건 파라메터 생성
    	params.setRscCode(rscCode);
    	
    	List<ResearchMemberVO> researchList = researchService.getTarget01List(params);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "01");
    	model.addAttribute("researchList", researchList);
    	return "/research/targetSendList03";
    }
    
    
    
}

package kaits.nct.exp.controller;

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
import kaits.nct.exp.service.ExpService;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;


@Controller
@RequestMapping(value = "/exp/alert")
public class ExpAlertController {
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Value("#{prop['file.url']}")
	String filePath;

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ExpService expService;
	
	/** 전문위원회 - 공통 기본 Alert 컨트롤러 * */
    @RequestMapping(value = {"/recAlert", "/recAlert.do"})
    public String recAlert(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	model.addAttribute("user", user);
    	model.addAttribute("aComent", request.getParameter("aComent"));
    	model.addAttribute("reAction", request.getParameter("reAction"));
    	model.addAttribute("forAction", request.getParameter("forAction"));
    	model.addAttribute("alType", request.getParameter("alType"));
    	model.addAttribute("recCode", request.getParameter("recCode"));
    	
    	
    	return "/expcom/alert/recAlert";
    }
    
    /** 전문위원회 - 공통 기본 Alert 컨트롤러 * */
    @RequestMapping(value = {"/agdAlert", "/agdAlert.do"})
    public String agdAlert(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	model.addAttribute("user", user);
    	model.addAttribute("aComent", request.getParameter("aComent"));
    	model.addAttribute("reAction", request.getParameter("reAction"));
    	model.addAttribute("forAction", request.getParameter("forAction"));
    	model.addAttribute("alType", request.getParameter("alType"));
    	model.addAttribute("recCode", request.getParameter("recCode"));
    	
    	
    	return "/expcom/alert/agdAlert";
    }
    
    /** 전문위원회 - 공통 기본 Alert 컨트롤러 * */
    @RequestMapping(value = {"/expAlert", "/expAlert.do"})
    public String expAlert(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	model.addAttribute("user", user);
    	model.addAttribute("aComent", request.getParameter("aComent"));
    	model.addAttribute("reAction", request.getParameter("reAction"));
    	model.addAttribute("forAction", request.getParameter("forAction"));
    	model.addAttribute("alType", request.getParameter("alType"));
    	model.addAttribute("recCode", request.getParameter("recCode"));
    	
    	
    	return "/expcom/alert/expAlert";
    }
    
    /** 전문위원회 - 공통 기본 Alert 컨트롤러 * */
    @RequestMapping(value = {"/uploadAlert", "/uploadAlert.do"})
    public String uploadAlert(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인 metaCode, metaType, uploadIdx
    	model.addAttribute("user", user);
    	model.addAttribute("metaCode", request.getParameter("metaCode"));
    	model.addAttribute("metaType", request.getParameter("metaType"));
    	model.addAttribute("fileCnt", request.getParameter("fileCnt"));
    	
    	return "/expcom/alert/uploadAlert";
    }
    
}

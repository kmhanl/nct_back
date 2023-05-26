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

import kaits.nct.exp.service.ExpService;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;


@Controller
@RequestMapping(value = "/expcom/print")
public class ExpPrintController {
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Value("#{prop['file.url']}")
	String filePath;

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ExpService expService;
	
	/**
     * 전문위원회 - 접수현황 신규접수등록 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/expCfmPrint.do", "/expCfmPrint.do"})
    public String expCfmPrint(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	
    	String committeeIdx = request.getParameter("committeeIdx");
    	String admId = request.getParameter("admId");
    	System.out.println("================>expcom pop 프린트" + committeeIdx +" : "+ admId);
    	
    	
    	
    	model.addAttribute("committeeIdx", committeeIdx);
    	model.addAttribute("admId", admId);
    	return "/expcom/print/expCfmPrint";
    }
    
}

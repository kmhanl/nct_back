package kaits.nct.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;


@Controller
@RequestMapping(value = "/common")
public class CommonController {
	@Autowired
	private MemberService memberService;
	
	/**
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping(value = {"/error", "/error.do"})
    public String error(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	String errorCode = request.getParameter("code");
    	model.addAttribute("errorCode", errorCode);
    	model.addAttribute("mainMenuCode", "EXP000");
    	return ".tiles/common/error";
    }
    
    /** 접근 권한 없음 안내**/
    @RequestMapping(value = {"/memAuthInfo", "/memAuthInfo.do"})
    public String memAuthInfo(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 세션이 없으면 로그인 페이지로 이동
        	return "redirect:/member/login.do";
    	}
    	String errorCode = request.getParameter("code");
    	model.addAttribute("errorCode", errorCode);
    	model.addAttribute("mainMenuCode", "EXP000");
    	return ".tiles/common/memAuthInfo";
    }
    
}

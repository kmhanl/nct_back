package kaits.nct.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;
import kaits.nct.policy.model.PolicyVO;
import kaits.nct.rsc.model.RscStatusVO;
import kaits.nct.rsc.service.RscService;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	@Autowired
	private RscService rscService;
	
	@Autowired
	private ExpertService expertService;
	
	
	@Autowired
	private MemberService memberService;
	/**
	 * 메인 컨트롤러
	 * (사용되지 않음)
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/myPage", "/myPage.do"})
    public String policyList(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/member/login.do";
    	}
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "100");
    	model.addAttribute("subMenuType", "01");
    	
    	
		return ".tiles/mypage/myPage";
    	
    }
	
    
   
	
}

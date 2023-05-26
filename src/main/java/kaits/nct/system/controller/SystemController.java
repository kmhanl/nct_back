package kaits.nct.system.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.member.model.MemberVO;
import kaits.nct.system.model.SystemTechVO;
import kaits.nct.system.service.SystemService;

@Controller
@RequestMapping(value = "/system")
public class SystemController {
	
	@Autowired
	private SystemService systemService;

	/**
	 * 전문위원회 - 접수현황 화면 컨트롤러
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping(value = {"/techhisList", "/techhisList.do"})
    public String showReceiptList(HttpServletRequest request, HttpServletResponse response
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
    		model.addAttribute("code", "999");
    		return ".tiles/common/error";
    	}
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "03");
    	
    	SystemTechVO param = new SystemTechVO(); // 새로운 변수 선언
    	if(request.getParameter("pageNo") == null) {
    		param.setPageInit();
    	} else {
    		param.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		param.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	List<SystemTechVO> techList = systemService.getTechList(param); 
    	// 리스트 서비스 호출
    	// List<SystemTechVO> 변수 타입 선언 Service에 선언된 기준 
    	// systemService.getTechList(param); Service에 선언된 걸 사용 하겠다 
    	
    	model.addAttribute("techList", techList); // JSP 사용 가능 하게  techList 선언
    	model.addAttribute("paging", systemService.getPaging());
    	
        return "/system/techhistList";
    }
}

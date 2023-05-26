package kaits.nct.saexpert.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kaits.nct.expert.model.ExpertCommitteeVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.member.model.MemberVO;
import kaits.nct.saexpert.model.SaExpertAgendaVO;
import kaits.nct.saexpert.service.SaExpertService;

@Controller
@RequestMapping(value = "/saexpert")
public class SaExpertController {

	@Autowired
	private SaExpertService saExpertService;
	
	@Autowired
	private ExpertService expertService;
	
    /**
     * 보호위원회 - 안건현황 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/agendaList", "/agendaList.do"})
    public String showAgendaList(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/member/login.do";
    	}
    	
    	
		/*
		 * SaExpertAgendaVO params = new SaExpertAgendaVO();
		 * if(request.getParameter("pageNo") == null) { params.setPageInit(); } else {
		 * params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
		 * params.setPageRows(Integer.parseInt(request.getParameter("pageRows"))); }
		 * String agdStatus = request.getParameter("agdStatus"); // Parameter 값 확인
		 * (rcptStatus) params.setAgdStatus(agdStatus);
		 * 
		 * model.addAttribute("agendaList", saExpertService.getAgendaList(params));
		 * model.addAttribute("tabList", saExpertService.getTabList());
		 * model.addAttribute("paging", saExpertService.getPaging());
		 * model.addAttribute("user", user); model.addAttribute("mainMenuType", "01");
		 * model.addAttribute("subMenuType", "00");
		 */
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "01");
    	model.addAttribute("subMenuType", "00");
    	
    	ExpertReceiptVO params = new ExpertReceiptVO(); // 리스트 조회 조건 파라메터 생성
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	String rcptStatus = request.getParameter("rcptStatus");
    	// Parameter 값 확인 (rcptStatus)
    	// URL에 직접 임의의 값으로 다른 값으로 조회 혹은 다른 업무 수행 못하도록 차단
    	// 4가지 경우 외 임의의 입력값인 경우 조회 시 조건 없이 조회
    	if (!"AP".equals(rcptStatus) && !"RC".equals(rcptStatus) && !"RA".equals(rcptStatus) && !"RJ".equals(rcptStatus) && !"AC".equals(rcptStatus)) {
    		rcptStatus = null;
    	}
    	params.setRcptStatus(rcptStatus);
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
    	List<ExpertReceiptVO> receiptList = expertService.getReceiptList(params);
    	
    	model.addAttribute("receiptList", receiptList);
    	model.addAttribute("tabList", expertService.getExpertTabList());
    	model.addAttribute("paging", expertService.getPaging());
        return "/sa_expert/agendaList";
    }
    
    @RequestMapping(value = {"/readyList", "/readyList.do"})
    public String showReadyList(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExpertAgendaStatVO params = new ExpertAgendaStatVO();
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	// 검토요청완료 데이터만 조회
    	String agdStatus = "AS";
    	// Parameter 값 확인 (rcptStatus)
    	params.setAgdStatus(agdStatus);
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
    	List<ExpertAgendaStatVO> agendaList = expertService.getAgendaStatList(params);
    	
    	model.addAttribute("agendaList", agendaList);
    	model.addAttribute("paging", expertService.getPaging());
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "01");
    	model.addAttribute("subMenuType", "01");
    	
        return "/sa_expert/readyList";
    }
    
    @RequestMapping(value = {"/committeeList", "/committeeList.do"})
    public String committeeList(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExpertCommitteeVO params = new ExpertCommitteeVO();
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	String committeeStatus = request.getParameter("committeeStatus");
    	params.setDatepick(false);
    	params.setCommitteeStatus(committeeStatus);
//    	String agdStatus = request.getParameter("agdStatus");
//    	// Parameter 값 확인 (rcptStatus)
//    	params.setAgdStatus(agdStatus);
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
    	List<ExpertCommitteeVO> datepickList = expertService.getDatepickList(params);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("datepickList", datepickList);
    	model.addAttribute("tabList", expertService.getExpertTabList());
    	model.addAttribute("paging", expertService.getPaging());
    	model.addAttribute("mainMenuType", "01");
    	model.addAttribute("subMenuType", "02");

        return "/sa_expert/committeeList";
    }
    
    
}

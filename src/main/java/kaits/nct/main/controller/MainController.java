package kaits.nct.main.controller;

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
import kaits.nct.rsc.model.RscStatusVO;
import kaits.nct.rsc.service.RscService;

@Controller
public class MainController {
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
    @RequestMapping(value = {"/", "/main", "main.do", "/index", "/index.do"})
    public String main(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {

        return "index";
    }
    
    /**
     * 대쉬보드 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@RequestMapping(value = {"/dash.do"})
    public String dash(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
		// 로그인 여부 확인
    	if (session.getAttribute("user")==null) {
    		// 세션 만료 또는 로그인 없이 접근 시 로그인 화면으로 이동
    		return "redirect:/member/login";
    	}

    	MemberVO user = (MemberVO) session.getAttribute("user");

    	model.addAttribute("user", user);
    	// Type 별 대쉬보드 조회 (A:기술안보과, B:보호협회)
//    	model.addAttribute("loginType", "A")
    	
    	
    	
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/expert/expMemList.do";
    	}else if ("AMG04".equals(user.getAdmGroup())) {
    		return "redirect:/expert/receiptList.do";
    	}else if ("AMG01".equals(user.getAdmGroup())) {
    		return "redirect:/expert/receiptList.do";
    	} else {
    		List<RscStatusVO> inviStatList = rscService.RscInviStatList(null);
        	List<RscStatusVO> comStatList = rscService.RscComStatList(null);
        	List<RscStatusVO> haveStatList = rscService.RscHaveStatList(null);
        	List<RscStatusVO> inqStatList = rscService.RscInqStatList(null);
        	List<RscStatusVO> surStatList = rscService.RscSurStatList(null);
        	model.addAttribute("inviStatList", inviStatList);
        	model.addAttribute("comStatList", comStatList);
        	model.addAttribute("haveStatList", haveStatList);
        	model.addAttribute("inqStatList", inqStatList);
        	model.addAttribute("surStatList", surStatList);
        	
        	
        	ExpertAgendaStatVO statParams = new ExpertAgendaStatVO();
        	if(request.getParameter("pageNo") == null) {
        		statParams.setPageInit();
        	} else {
        		statParams.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
        		statParams.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
        	}
        	String agdStatus = request.getParameter("agdStatus");
        	// Parameter 값 확인 (rcptStatus)
        	statParams.setAgdStatus(agdStatus);
        	statParams.setAdmGroup(user.getAdmGroup()); // 사용자 권한
        	statParams.setAdmId(user.getAdmId()); // 사용자 권한
        	
        	List<ExpertAgendaStatVO> agendaStatList = expertService.getAgendaStatList(statParams);
        	
        	model.addAttribute("agendaList", agendaStatList);
        	model.addAttribute("tabList2", expertService.getExpertTabList());
        	
        	
        	
        	
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
        	
        	
        	List<ComMemberVO> totComMemberList  =  memberService.totComMemberList();
        	model.addAttribute("totComMemberList", totComMemberList);
        	model.addAttribute("tabList", expertService.getExpertTabList());
    		return "dash";
    	}
    }
	
	/**
	 * 대쉬보드 화면 컨트롤러
	 * - 사용중지된 아이디인 경우
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/dash300.do"})
	public String dash300(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, ModelMap model) {
		// 로그인 여부 확인
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("user", user);
		// Type 별 대쉬보드 조회 (A:기술안보과, B:보호협회)
//    	model.addAttribute("loginType", "A");
		
		return "dash300";
	}
	
	
	/**
	 * 대쉬보드 화면 컨트롤러
	 * - 승인중인 아이디인 경우
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/dash400.do"})
	public String dash400(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, ModelMap model) {
		// 로그인 여부 확인
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("user", user);
		// Type 별 대쉬보드 조회 (A:기술안보과, B:보호협회)
//    	model.addAttribute("loginType", "A");
		
		return "dash400";
	}
	
	/**
	 * 접근권한 승인 심사 안내 팝업 컨트롤러
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/popup/memberinfo", "/popup/memberinfo.do"})
	public String memberInfoPopup(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, ModelMap model) {
		// 로그인 여부 확인
		if (session.getAttribute("user")==null) {
			// 세션 만료 또는 로그인 없이 접근 시 로그인 화면으로 이동
			return "redirect:/member/login";
		}
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		model.addAttribute("user", user);
		
		return "/popup/memberinfo";
	}
}

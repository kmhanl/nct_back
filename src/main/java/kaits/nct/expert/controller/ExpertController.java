package kaits.nct.expert.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kaits.nct.ex.model.ExInfoDataVO;
import kaits.nct.ex.model.ExAgdListDataVO;
import kaits.nct.expert.model.ExDataInfoVO;
import kaits.nct.expert.model.ExDatePickStatusVO;
import kaits.nct.expert.model.ExpertCommitteeMemberVO;
import kaits.nct.expert.model.ExpertCommitteeOpinionVO;
import kaits.nct.expert.model.ExpertCommitteeVO;
import kaits.nct.expert.model.ExpertPrintOpinionVO;
import kaits.nct.expert.model.agenda.ExpertAgendaListVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.ex.service.ExService;
import kaits.nct.member.model.MemberVO;

@Controller
@RequestMapping(value = "/expert")
public class ExpertController {

	@Autowired
	private ExpertService expertService;
	
	@Autowired
	private ExService exService;

	/**
	 * 전문위원회 - 접수현황 화면 컨트롤러
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping(value = {"/receiptList", "/receiptList.do"})
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
    	model.addAttribute("mainMenuType", "00");
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
    	
    	System.out.println("변수" + params);
    	System.out.println("=============================================");
    	
    	List<ExpertReceiptVO> receiptList = expertService.getReceiptList(params);
    	
    	System.out.println("접수 리스트" + receiptList);
    	
    	
    	model.addAttribute("receiptList", receiptList);
    	model.addAttribute("tabList", expertService.getExpertTabList());
    	model.addAttribute("paging", expertService.getPaging());
    	
        return "/expert/receiptList";
    }
    
    /**
     * 전문위원회 - 안건현황 화면 컨트롤러
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
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		model.addAttribute("message", "접근 권한이 없습니다.");
    		return ".tiles/common/error";
    	}
    	
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
    	model.addAttribute("tabList", expertService.getExpertTabList());
    	model.addAttribute("paging", expertService.getPaging());
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "00");
    	model.addAttribute("subMenuType", "01");
    	
        return "/expert/agendaList";
    }
    
    /**
     * 전문위원회 - 검토준비중 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
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
    	model.addAttribute("mainMenuType", "00");
    	model.addAttribute("subMenuType", "02");
    	
        return "/expert/readyList";
    }
    /**
     * 전문위원회 - 참석일선택 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/datepickList", "/datepickList.do"})
    public String showDatepickList(HttpServletRequest request, HttpServletResponse response
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
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
		List<ExpertCommitteeVO> datepickList = expertService.getDatePList(params);
    	model.addAttribute("datepickList", datepickList);
    	
    	System.out.println("================>"+ datepickList);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("paging", expertService.getPaging());
    	model.addAttribute("mainMenuType", "00");
    	model.addAttribute("subMenuType", "03");

        return "/expert/datepickList";
    }
    
    /**
     * 전문위원회 - 참석일선택 화면 > 전문위원 뷰 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/committeeView", "/committeeView.do"})
    public String showcommitteeView(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("mainMenuType", "00");
    	model.addAttribute("subMenuType", "03");
    	
    	String committeeIdx = request.getParameter("committeeIdx");
    	
    	//전문위원회 설정 정보 조회
    	
    	ExDataInfoVO exParam = new ExDataInfoVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExDataInfoVO> exInfo = expertService.getExDateInfo(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	System.out.println("================>"+ exInfo.get(0));
    	//참석일 선택 현황 데이터 조회 
    	ExDatePickStatusVO dateParam = new ExDatePickStatusVO();
    	dateParam.setCommitteeIdx(committeeIdx);
    	List<ExDatePickStatusVO> dateStatus = expertService.getDatePickStatus(dateParam);
    	model.addAttribute("dateStatus", dateStatus);
    	
    	ExpertAgendaStatVO asParam = new ExpertAgendaStatVO();
    	asParam.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	asParam.setAdmId(user.getAdmId()); // 사용자 권한
    	List<ExpertAgendaStatVO> agendaList = expertService.getAgendaStatList(asParam);
    	
    	model.addAttribute("agendaList", agendaList);

    	ExpertCommitteeVO cmParam = new ExpertCommitteeVO();
    	cmParam.setAdmGroup(user.getAdmGroup());
    	cmParam.setAdmId(user.getAdmId()); // 사용자 권한
    	cmParam.setCommitteeIdx(committeeIdx);
    	cmParam.setDatepick(true);
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(cmParam);
    	
    	model.addAttribute("committeeData", committeeData);

    	ExpertCommitteeMemberVO cmbParam = new ExpertCommitteeMemberVO();
    	cmbParam.setCommitteeIdx(committeeIdx);
    	cmbParam.setCommitteeTechId(committeeData.getCommitteeTechId());
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(cmbParam);
    	
    	model.addAttribute("memberList", memberList);
    	
        return "/expert/committeeView";
    }
    
    /**
     * 전문위원회 - 위원회현황(전문위원/기술위원) 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
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
    	
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
    	List<ExpertCommitteeVO> exLiveList = expertService.getExLiveList(params);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("exLiveList", exLiveList);
    	model.addAttribute("tabList", expertService.getExpertTabList());
    	model.addAttribute("paging", expertService.getPaging());
    	model.addAttribute("mainMenuType", "00");
    	model.addAttribute("subMenuType", "04");

        return "/expert/committeeList";
    }
    
    /**
     * 전문위원회 - 위원회현황(나머지) 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/committeepList", "/committeepList.do"})
    public String committeepList(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	
    	if (!"AMG05".equals(user.getAdmGroup()) && !"AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/expert/committeeList";
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
    	System.out.println(datepickList);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("datepickList", datepickList);
    	model.addAttribute("paging", expertService.getPaging());
    	model.addAttribute("menuType", "04");
    	
    	return "/expert/committeepList";
    }
    
    /**
     * 전문위원회 - 위원회현황(나머지) 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/expMemList", "/expMemList.do"})
    public String expMemList(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	
    	if (!"AMG05".equals(user.getAdmGroup()) && !"AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/expert/committeeList";
    	}
    	System.out.println("접근 권한 : "+ user.getAdmGroup());
    	
    	ExpertCommitteeVO params = new ExpertCommitteeVO();
    	
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
    	List<ExpertCommitteeVO> datepickList = expertService.getExpMemList(params);
    	System.out.println(datepickList);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("datepickList", datepickList);
    	model.addAttribute("paging", expertService.getPaging());
    	model.addAttribute("menuType", "04");
    	
    	return "/expert/expMemList";
    }
    
    /**
     * 전문위원회 - 위원회현황(나머지) 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/expMemWrite", "/expMemWrite.do"})
    public String expMemWrite(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	
    	if (!"AMG05".equals(user.getAdmGroup()) && !"AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/expert/committeeList";
    	}
    	String committeeIdx = request.getParameter("committeeIdx");
    	System.out.println("접근 권한 : "+ user.getAdmGroup());
    	System.out.println("접근 Id : "+ user.getAdmId());
    	System.out.println("전문위원회 : "+ committeeIdx);
    	
    	ExpertCommitteeVO params = new ExpertCommitteeVO();
    	
    	params.setCommitteeIdx(committeeIdx); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
    	ExpertCommitteeVO exeInfoData = expertService.exeInfoData(params);
    	System.out.println(">>"+exeInfoData);
    	
    	if (exeInfoData == null) {
    		model.addAttribute("message", "잘못된 접근입니다.");
    		return ".tiles/common/error";
    	}
    	
    	ExpertAgendaListVO agendaL = new ExpertAgendaListVO();
    	agendaL.setCommitteeIdx(committeeIdx);
    	agendaL.setCommitteeAdmId(user.getAdmId());
    	List<ExpertAgendaListVO> agendaOpList = expertService.getAgendaList(agendaL);
    	model.addAttribute("agendaOpList", agendaOpList);
    	System.out.println("agendaOpList================>"+ agendaOpList);
    	
    	ExpertAgendaListVO agendaLt = new ExpertAgendaListVO();
    	agendaLt.setCommitteeIdx(committeeIdx);
    	agendaLt.setCommitteeAdmId(user.getAdmId());
    	List<ExpertAgendaListVO> agendaTitList = expertService.getAgendaTList(agendaLt);
    	model.addAttribute("agendaTitList", agendaTitList);
    	System.out.println("agendaTitList================>"+ agendaTitList);
    	
    	ExpertCommitteeOpinionVO opParam = new ExpertCommitteeOpinionVO();
    	opParam.setCommitteeIdx(committeeIdx);
    	opParam.setCommitteeOptType("N");
    	opParam.setCommitteeAdmId(user.getAdmId());
    	List<ExpertCommitteeOpinionVO> opinionGroupList = expertService.getCommitteOpinionGroupList(opParam);
    	System.out.println("================>"+ opinionGroupList);
    	model.addAttribute("opinionTabList", opinionGroupList);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("exeInfoData", exeInfoData);
    	model.addAttribute("menuType", "04");
    	
    	return "/expert/expMemWrite";
    }
    
    /**
     * 전문위원회 - 위원회현황(나머지) 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/expMemView", "/expMemView.do"})
    public String expMemView(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	
    	if (!"AMG05".equals(user.getAdmGroup()) && !"AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/expert/committeeList";
    	}
    	String committeeIdx = request.getParameter("committeeIdx");
    	System.out.println("접근 권한 : "+ user.getAdmGroup());
    	System.out.println("접근 Id : "+ user.getAdmId());
    	System.out.println("전문위원회 : "+ committeeIdx);
    	
    	ExpertCommitteeVO params = new ExpertCommitteeVO();
    	
    	params.setCommitteeIdx(committeeIdx); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	
    	ExpertCommitteeVO exeInfoData = expertService.exeInfoData(params);
    	System.out.println(">>"+exeInfoData);
    	
    	if (exeInfoData == null) {
    		model.addAttribute("message", "잘못된 접근입니다.");
    		return ".tiles/common/error";
    	}
    	
    	ExpertAgendaListVO agendaL = new ExpertAgendaListVO();
    	agendaL.setCommitteeIdx(committeeIdx);
    	agendaL.setCommitteeAdmId(user.getAdmId());
    	List<ExpertAgendaListVO> agendaOpList = expertService.getAgendaList(agendaL);
    	model.addAttribute("agendaOpList", agendaOpList);
    	System.out.println("agendaOpList================>"+ agendaOpList);
    	
    	ExpertAgendaListVO agendaLt = new ExpertAgendaListVO();
    	agendaLt.setCommitteeIdx(committeeIdx);
    	agendaLt.setCommitteeAdmId(user.getAdmId());
    	List<ExpertAgendaListVO> agendaTitList = expertService.getAgendaTList(agendaLt);
    	model.addAttribute("agendaTitList", agendaTitList);
    	System.out.println("agendaTitList================>"+ agendaTitList);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("exeInfoData", exeInfoData);
    	
    	model.addAttribute("menuType", "04");
    	
    	return "/expert/expMemView";
    }
    
    @RequestMapping(value = {"/expCfmPrint.do", "/expCfmPrint.do"})
    public String expCfmPrint(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	
    	String committeeIdx = request.getParameter("committeeIdx");
    	String admId = request.getParameter("admId");
    	System.out.println("================>expcom pop 프린트" + committeeIdx +" : "+ admId);
    	
    	ExpertCommitteeVO params = new ExpertCommitteeVO();
    	
    	params.setCommitteeIdx(committeeIdx); // 사용자 권한
    	
    	ExpertCommitteeVO exeInfoData = expertService.expIdxInfoData(params);
    	System.out.println(">>"+exeInfoData);
    	model.addAttribute("exeInfoData", exeInfoData);
    	
    	ExpertAgendaListVO agendaL = new ExpertAgendaListVO();
    	agendaL.setCommitteeIdx(committeeIdx);
    	
    	List<ExpertAgendaListVO> agendaOpList = expertService.expAgendaList(agendaL);
    	model.addAttribute("agendaOpList", agendaOpList);
    	System.out.println("agendaOpList================>"+ agendaOpList);
    	
    	ExpertAgendaListVO agendaLt = new ExpertAgendaListVO();
    	agendaLt.setCommitteeIdx(committeeIdx);
    	List<ExpertAgendaListVO> agendaTitList = expertService.expAgendaTList(agendaLt);
    	model.addAttribute("agendaTitList", agendaTitList);
    	System.out.println("agendaTitList================>"+ agendaTitList);
    	
    	ExpertCommitteeMemberVO cmbParam = new ExpertCommitteeMemberVO();
    	cmbParam.setCommitteeIdx(committeeIdx);
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(cmbParam);
    	model.addAttribute("memberList", memberList);
    	System.out.println("memberList================>"+ memberList);
    	
    	ExpertCommitteeOpinionVO opParam = new ExpertCommitteeOpinionVO();
    	opParam.setCommitteeIdx(committeeIdx);
    	opParam.setCommitteeAdmId(admId);
    	List<ExpertCommitteeOpinionVO> opiniondata = expertService.expMemOpinionList(opParam);
    	System.out.println("================>"+ opiniondata);
    	model.addAttribute("opiniondata", opiniondata);
    	
    	ExpertPrintOpinionVO prtParam = new ExpertPrintOpinionVO();
    	prtParam.setCommitteeIdx(committeeIdx);
    	prtParam.setCommitteeAdmId(admId);
    	List<ExpertPrintOpinionVO> printdata = expertService.expMemPrintList(prtParam);
    	System.out.println("================>"+ printdata);
    	model.addAttribute("printdata", printdata);
    	
    	
    	
    	
    	
    	model.addAttribute("committeeIdx", committeeIdx);
    	model.addAttribute("printadmId", admId);
    	return "/expert/print/expCfmPrint";
    }
    
    /**
     * 전문위원회 - 의견제출 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/committeeWrite", "/committeeWrite.do"})
    public String committeeWrite(HttpServletRequest request, HttpServletResponse response
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
    	
    	String committeeIdx = request.getParameter("committeeIdx");

    	ExpertAgendaStatVO asParam = new ExpertAgendaStatVO();
    	asParam.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	asParam.setAdmId(user.getAdmId()); // 사용자 권한
    	List<ExpertAgendaStatVO> agendaList = expertService.getAgendaStatList(asParam);
    	
    	model.addAttribute("agendaList", agendaList);

    	ExpertCommitteeVO cmParam = new ExpertCommitteeVO();
    	cmParam.setAdmGroup(user.getAdmGroup());
    	cmParam.setAdmId(user.getAdmId()); // 사용자 권한
    	cmParam.setCommitteeIdx(committeeIdx);
    	cmParam.setDatepick(true);
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(cmParam);
    	
    	model.addAttribute("committeeData", committeeData);

    	ExpertCommitteeMemberVO cmbParam = new ExpertCommitteeMemberVO();
    	cmbParam.setCommitteeIdx(committeeIdx);
    	cmbParam.setCommitteeTechId(committeeData.getCommitteeTechId());
    	List<ExpertCommitteeMemberVO> memberList = expertService.getCommitteeMemberList(cmbParam);
    	
    	model.addAttribute("memberList", memberList);
    	return "/expert/committeeWrite";
    }
    
    /**
     * 전문위원회 - 전문의원 의견제출 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/committeepWrite", "/committeepWrite.do"})
    public String committeepWrite(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = (String) request.getParameter("committeeIdx");
    	System.out.println("위원회 번호=======>"+ committeeIdx);
    	System.out.println("사용자 그룹"+ user.getAdmGroup());
    	System.out.println("사용자=======>"+ user.getAdmId());
    	
    	
    	ExpertCommitteeVO param = new ExpertCommitteeVO();
    	param.setAdmGroup(user.getAdmGroup());
    	param.setAdmId(user.getAdmId()); // 사용자 권한
    	param.setCommitteeIdx(committeeIdx);
    	//param.setDatepick(false);
    	
    	ExpertCommitteeVO committeeData = expertService.getCommitteeData(param);
    	System.out.println("ㅁㄴㅇ============>"+ committeeData);
    	if (committeeData == null) {
    		model.addAttribute("message", "잘못된 접근입니다.");
    		return ".tiles/common/error";
    	}
    	model.addAttribute("exData", committeeData);
    	System.out.println("================>"+ committeeData);
    	
    	
    	//로그인 전문위원 작성 상태 조회 추가 
    	ExpertCommitteeMemberVO cmbParam = new ExpertCommitteeMemberVO();
    	cmbParam.setCommitteeIdx(committeeIdx);
    	cmbParam.setAdmId(user.getAdmId());
    	ExpertCommitteeMemberVO loginMemStat = expertService.getLoginMemberStat(cmbParam);
    	model.addAttribute("loginMemStat", loginMemStat);
    	System.out.println("================>"+ loginMemStat);
    	
    	//로그인 전문위원 작성 상태 조회 추가 
    	
    	ExpertAgendaStatVO agdParam = new ExpertAgendaStatVO();
    	agdParam.setAdmId(user.getAdmId());
    	agdParam.setAdmGroup(user.getAdmGroup());
    	agdParam.setAgdExIdx(committeeIdx);
    	System.out.println("================>"+ agdParam);
    	List<ExpertAgendaStatVO> committeeAgendaList = expertService.getCommitteAgendaList(agdParam);
    	System.out.println("committeeAgendaList================>"+ committeeAgendaList);
    	model.addAttribute("agdList", committeeAgendaList);
    	
    	
    	ExpertAgendaListVO agendaL = new ExpertAgendaListVO();
    	agendaL.setCommitteeIdx(committeeIdx);
    	agendaL.setCommitteeAdmId(user.getAdmId());
    	List<ExpertAgendaListVO> agendaOpList = expertService.getAgendaList(agendaL);
    	model.addAttribute("agendaOpList", agendaOpList);
    	System.out.println("agendaOpList================>"+ agendaOpList);
    	
    	ExpertAgendaListVO agendaLt = new ExpertAgendaListVO();
    	agendaLt.setCommitteeIdx(committeeIdx);
    	agendaLt.setCommitteeAdmId(user.getAdmId());
    	List<ExpertAgendaListVO> agendaTitList = expertService.getAgendaTList(agendaLt);
    	model.addAttribute("agendaTitList", agendaTitList);
    	System.out.println("agendaTitList================>"+ agendaTitList);
    	
    	ExpertCommitteeOpinionVO opParam = new ExpertCommitteeOpinionVO();
    	opParam.setCommitteeIdx(committeeIdx);
    	opParam.setCommitteeOptType("N");
    	opParam.setCommitteeAdmId(user.getAdmId());
    	List<ExpertCommitteeOpinionVO> opinionGroupList = expertService.getCommitteOpinionGroupList(opParam);
    	System.out.println("================>"+ opinionGroupList);
    	model.addAttribute("opinionTabList", opinionGroupList);
    	
    	return "/expert/committeepWrite";
    }
    
    /**
     * 전문위원회 - 기술 안보과 이관
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/sendcommittee", "/sendcommittee.do"})
    public String sendcommittee(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);
    	
    	String committeeIdx = request.getParameter("committeeIdx");
    	
    	System.out.println("전문위원회 > 위원회 현황 > 기술안보과 이관 처리 ================>"+ committeeIdx);
    	
    	ExInfoDataVO exParam = new ExInfoDataVO();
    	exParam.setCommitteeIdx(committeeIdx);
    	List<ExInfoDataVO> exInfo = exService.getExInfoData(exParam);
    	model.addAttribute("exInfo", exInfo.get(0));
    	System.out.println("================>"+ exInfo.get(0));
    	
    	ExAgdListDataVO agendaLt = new ExAgdListDataVO();
    	agendaLt.setCommitteeIdx(committeeIdx);
    	List<ExAgdListDataVO> agendaTitList = exService.loadAgendaList(agendaLt);
    	model.addAttribute("agdList", agendaTitList);
    	System.out.println("agendaTitList================>"+ agendaTitList);
    	
		/* loadAgendaTitList(ExAgdListDataVO */
    	ExAgdListDataVO agendaLtit = new ExAgdListDataVO();
    	agendaLtit.setCommitteeIdx(committeeIdx);
    	List<ExAgdListDataVO> agendaTit = exService.loadAgendaTitList(agendaLtit);
    	model.addAttribute("agendaTitList", agendaTit);
    	System.out.println("agendaTitLis2222t================>"+ agendaTit);
    	
    	model.addAttribute("committeeIdx", committeeIdx);
    	
    	
    	return "/expert/sendcommittee";
    }
    
    /**
     * 전문위원회 - 기술안보과 이전 화면 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/committeeSubmit", "/committeeSubmit.do"})
    public String committeeSubmit(HttpServletRequest request, HttpServletResponse response
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
    	
    	return "/expert/committeeSubmit";
    }
    

    
	/****** Layer Popup Controller ******/
    
    
    
    
}

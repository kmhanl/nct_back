package kaits.nct.exp.controller;

import java.util.HashMap;
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

import kaits.nct.exp.model.ExpAgdListVO;
import kaits.nct.exp.model.ExpNctTechVO;
import kaits.nct.exp.service.ExpService;
import kaits.nct.expert.model.ExpertTechVO;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;


@Controller
@RequestMapping(value = "/expcom/popup")
public class ExpPopupController {
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Value("#{prop['file.url']}")
	String filePath;

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ExpService expService;
	
	/**
     * 전문위원회 > 접수 현황 > 신규 등록  > 기술 분야 명칭 등록
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/techAddPopup", "/techAddPopup.do"})
    public String techAddPopup(HttpServletRequest request, HttpServletResponse response
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

    	//List<ExpertTechVO> techList = expertService.getTechList();
    	//model.addAttribute("techList", techList);
    	ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
    	model.addAttribute("nctTechList", nctTechList);
    	
    	return "/expcom/popup/techAddPopup";
    }
    
    /**
     * 전문위원회 > 접수 현황 > 신규 등록  > 대상국  등록
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/ctyAddPopup", "/ctyAddPopup.do"})
    public String ctyAddPopup(HttpServletRequest request, HttpServletResponse response
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

    	//List<ExpertTechVO> techList = expertService.getTechList();
    	//model.addAttribute("techList", techList);
    	ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
    	model.addAttribute("nctTechList", nctTechList);
    	
    	return "/expcom/popup/ctyAddPopup";
    }
	
	/**
     * 전문위원회 > 안건 현황 > 안건 리스트 > 검토요청 팝업 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/sendRecPopup", "/sendRecPopup.do"})
    public String sendRecPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, @RequestParam Map<Object,Object> rcptInfo
    		, ModelMap model) {
    	model.addAttribute("rcpts", rcptInfo.get("rcpts"));
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
    		return "redirect:/member/login.do";
    	}
    	model.addAttribute("user", user);

    	//List<ExpertTechVO> techList = expertService.getTechList();
    	//model.addAttribute("techList", techList);
    	ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
    	model.addAttribute("nctTechList", nctTechList);
    	
    	return "/expcom/popup/sendRecPopup";
    }
    
	/**
     * 전문위원회 - 위원회 구성 > 안건 추가 팝업 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/expAgdPopup.do", "/expAgdPopup.do"})
    public String expAgdPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	
    	String expTechId = request.getParameter("expTechId");
    	System.out.println("안건 추가  pop " + expTechId );
    	
    	ExpAgdListVO params = new ExpAgdListVO(); // 리스트 조회 조건 파라메터 생성
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	params.setNctAgdTech(expTechId);//기술 분야
    	
    	List<ExpAgdListVO> agdList = expService.loadListAddAgd(params);
    	model.addAttribute("agdList", agdList);
    	System.out.println("안건 리스트" + agdList);
    	
    	model.addAttribute("committeeIdx", expTechId);
    	
    	return "/expcom/popup/expAgdPopup";
    }
    
    /**
     * 전문위원회 - 위원회 구성 > 구성원 추가 팝업 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = {"/expMemPopup.do", "/expMemPopup.do"})
    public String expMemPopup(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	
    	String admAuthTech = request.getParameter("expTechId");
    	System.out.println("구성원 추가  pop " + admAuthTech );
    	
    	MemberVO member = new MemberVO();
    	member.setAdmAuthTech(admAuthTech);
    	List<MemberVO> resultList = memberService.getAdmMemberList(member);
    	model.addAttribute("memList", resultList);
    	System.out.println("구성원 : " + resultList );
    	model.addAttribute("admAuthTech", admAuthTech);
    	
    	return "/expcom/popup/expMemPopup";
    }
	
	/**
     * 전문위원회 - 위원회 구성 > 
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
    	return "/expcom/popup/expCfmPrint";
    }
    
}

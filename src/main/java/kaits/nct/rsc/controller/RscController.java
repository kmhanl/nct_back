package kaits.nct.rsc.controller;

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
import kaits.nct.member.model.MemberVO;
import kaits.nct.research.model.ResearchMemberVO;
import kaits.nct.rsc.model.RscAnswerVO;
import kaits.nct.rsc.model.RscDataVO;
import kaits.nct.rsc.model.RscForDataVO;
import kaits.nct.rsc.model.RscMemberVO;
import kaits.nct.rsc.model.RscStatusVO;
import kaits.nct.rsc.service.RscService;


@Controller
@RequestMapping(value = "/rsc")
public class RscController {
	@Autowired
	private RscService rscService;
	
	/** 2022년 실태조사 > 인덱스 **/
    @RequestMapping(value = {"/main", "/main.do"})
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
    	model.addAttribute("subMenuType", "0A");
    	
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
    	
    	return "/rsc/main";
    }
    
    /** 2022년 실태조사 > 대상 기업 리스트 **/
    @RequestMapping(value = {"/targetList", "/targetList.do"})
    public String targetList(HttpServletRequest request, HttpServletResponse response
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
    	
    	RscMemberVO params = new RscMemberVO();
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
    	}
    	List<RscMemberVO> targetMemList = rscService.RscMemberList(params);
    	
    	
    	model.addAttribute("targetMemList", targetMemList);
    	model.addAttribute("paging", rscService.getPaging());
    	
    	return "/rsc/targetList";
    }
    @RequestMapping(value = {"/comList", "/comList.do"})
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
    	String rscIntoFlag = "Y";
    	RscMemberVO params = new RscMemberVO(); // 리스트 조회 조건 파라메터 생성
    	params.setRscCode(rscCode);
    	params.setRscIntoFlag(rscIntoFlag);
    	List<RscMemberVO> rscComList = rscService.getCompanyList(params);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "01");
    	model.addAttribute("rscComList", rscComList);
    	model.addAttribute("rscIntoFlag", rscIntoFlag);
    	return "/rsc/comList";
    }
    
    @RequestMapping(value = {"/comEndList", "/comEndList.do"})
    public String comEndList(HttpServletRequest request, HttpServletResponse response
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
    	String rscIntoFlag = "Y";
    	RscMemberVO params = new RscMemberVO(); // 리스트 조회 조건 파라메터 생성
    	params.setRscCode(rscCode);
    	params.setRscIntoFlag(rscIntoFlag);
    	List<RscMemberVO> rscComList = rscService.getCompanyList(params);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "05");
    	model.addAttribute("rscComList", rscComList);
    	model.addAttribute("rscIntoFlag", rscIntoFlag);
    	return "/rsc/comEndList";
    }
    
    @RequestMapping(value = {"/comView", "/comView.do"})
    public String comView(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	String rscMemCode = request.getParameter("rscMemCode");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
		/*
		 * if (rscMemCode == null) { model.addAttribute("message", "잘못괸 접근 입니다.");
		 * return ".tiles/common/error"; }
		 */
    	
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		model.addAttribute("message", "접근 권한이 없습니다.");
    		return ".tiles/common/error";
    	}
    	
    	
    	String rscCode = "RSC-2022-0000";
    	String rscIntoFlag = "X rscMemCode";
    	
    	RscMemberVO params = new RscMemberVO(); // 리스트 조회 조건 파라메터 생성
    	params.setRscMemCode(rscMemCode);
    	RscMemberVO loadCompany = rscService.loadCompany(params);
    	
    	
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuType", "03");
    	model.addAttribute("subMenuType", "01");
    	model.addAttribute("loadCompany", loadCompany);
    	return "/rsc/comView";
    }
    
    @RequestMapping(value = {"/ansDataList", "/ansDataList.do"})
    public String ansDataList(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
    	RscDataVO params = new RscDataVO();
    	List<RscDataVO> ansDataList = rscService.RscDataList(params);
    	model.addAttribute("ansDataList", ansDataList);
    	
    	RscAnswerVO ansdata = new RscAnswerVO();
    	List<RscAnswerVO> queDataList = rscService.RscAnsDataList(ansdata);
    	model.addAttribute("queDataList", queDataList);
    	
    	return "/rsc/ansDataList";
    }
    
    @RequestMapping(value = {"/ansDataList01", "/ansDataList01.do"})
    public String ansDataList01(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
    	String rscForType = "J";
    	RscForDataVO params = new RscForDataVO();
    	params.setRscForType(rscForType);
    	List<RscForDataVO> ansDataForList = rscService.RscDataForList(params);
    	model.addAttribute("ansDataForList", ansDataForList);
    	
    	RscForDataVO memparams = new RscForDataVO();
    	memparams.setRscForType(rscForType);
    	List<RscForDataVO> ansDataForMemList = rscService.RscDataForMemList(memparams);
    	model.addAttribute("ansDataForMemList", ansDataForMemList);
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	return "/rsc/ansDataList01";
    }
    @RequestMapping(value = {"/ansDataList02", "/ansDataList02.do"})
    public String ansDataList02(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
    	String rscForType = "T";
    	RscForDataVO params = new RscForDataVO();
    	params.setRscForType(rscForType);
    	List<RscForDataVO> ansDataForList = rscService.RscDataForList(params);
    	model.addAttribute("ansDataForList", ansDataForList);
    	
    	RscForDataVO memparams = new RscForDataVO();
    	memparams.setRscForType(rscForType);
    	List<RscForDataVO> ansDataForMemList = rscService.RscDataForMemList(memparams);
    	model.addAttribute("ansDataForMemList", ansDataForMemList);
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	return "/rsc/ansDataList02";
    }
    
    @RequestMapping(value = {"/ansDataListS01", "/ansDataListS01.do"})
    public String ansDataListS01(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		
    	RscAnswerVO ansdata = new RscAnswerVO();
    	List<RscAnswerVO> queDataList = rscService.RscAnsDataList(ansdata); 
    	model.addAttribute("queDataList",queDataList);
		
    	
		/*
		 * RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> dataComList =
		 * rscService.RscAnsComList(anscomdata); model.addAttribute("dataComList",
		 * dataComList);
		 */
    	
    	return "/rsc/ansDataListS01";
    }
    @RequestMapping(value = {"/ansDataListSec01", "/ansDataListSec01.do"})
    public String ansDataListSec01(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-001";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-002";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-003";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-004";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-005";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-006";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-007";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-008";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	RscAnswerVO ansqus09data = new RscAnswerVO();
    	String rscQuesIdx9 = "RSC-2022-0000-01-009";
    	ansqus09data.setRscQuesIdx(rscQuesIdx9);
    	List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
    	model.addAttribute("dataqus09List", dataqus09List);
    	
    	RscAnswerVO ansqus10data = new RscAnswerVO();
    	String rscQuesIdx10 = "RSC-2022-0000-01-010";
    	ansqus10data.setRscQuesIdx(rscQuesIdx10);
    	List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
    	model.addAttribute("dataqus10List", dataqus10List);
    	
    	RscAnswerVO ansqus11data = new RscAnswerVO();
    	String rscQuesIdx11 = "RSC-2022-0000-01-011";
    	ansqus11data.setRscQuesIdx(rscQuesIdx11);
    	List<RscAnswerVO> dataqus11List = rscService.RscAnsqus01List(ansqus11data);
    	model.addAttribute("dataqus11List", dataqus11List);
    	
    	RscAnswerVO ansqus12data = new RscAnswerVO();
    	String rscQuesIdx12 = "RSC-2022-0000-01-012";
    	ansqus12data.setRscQuesIdx(rscQuesIdx12);
    	List<RscAnswerVO> dataqus12List = rscService.RscAnsqus01List(ansqus12data);
    	model.addAttribute("dataqus12List", dataqus12List);
    	
    	return "/rsc/ansDataListSec01";
    }
    
    @RequestMapping(value = {"/ansDataListSec02", "/ansDataListSec02.do"})
    public String ansDataListSec02(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-013";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-014";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-015";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-016";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-017";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-018";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-019";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-020";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	RscAnswerVO ansqus09data = new RscAnswerVO();
    	String rscQuesIdx9 = "RSC-2022-0000-01-021";
    	ansqus09data.setRscQuesIdx(rscQuesIdx9);
    	List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
    	model.addAttribute("dataqus09List", dataqus09List);
    	
    	RscAnswerVO ansqus10data = new RscAnswerVO();
    	String rscQuesIdx10 = "RSC-2022-0000-01-022";
    	ansqus10data.setRscQuesIdx(rscQuesIdx10);
    	List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
    	model.addAttribute("dataqus10List", dataqus10List);
    	
    	RscAnswerVO ansqus11data = new RscAnswerVO();
    	String rscQuesIdx11 = "RSC-2022-0000-01-023";
    	ansqus11data.setRscQuesIdx(rscQuesIdx11);
    	List<RscAnswerVO> dataqus11List = rscService.RscAnsqus01List(ansqus11data);
    	model.addAttribute("dataqus11List", dataqus11List);
    	
    	return "/rsc/ansDataListSec02";
    }
    
    @RequestMapping(value = {"/ansDataListSec03", "/ansDataListSec03.do"})
    public String ansDataListSec03(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-024";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-025";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-026";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-027";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-028";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-029";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-030";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-031";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	RscAnswerVO ansqus09data = new RscAnswerVO();
    	String rscQuesIdx9 = "RSC-2022-0000-01-032";
    	ansqus09data.setRscQuesIdx(rscQuesIdx9);
    	List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
    	model.addAttribute("dataqus09List", dataqus09List);
    	
    	RscAnswerVO ansqus10data = new RscAnswerVO();
    	String rscQuesIdx10 = "RSC-2022-0000-01-033";
    	ansqus10data.setRscQuesIdx(rscQuesIdx10);
    	List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
    	model.addAttribute("dataqus10List", dataqus10List);
    	
    	RscAnswerVO ansqus11data = new RscAnswerVO();
    	String rscQuesIdx11 = "RSC-2022-0000-01-034";
    	ansqus11data.setRscQuesIdx(rscQuesIdx11);
    	List<RscAnswerVO> dataqus11List = rscService.RscAnsqus01List(ansqus11data);
    	model.addAttribute("dataqus11List", dataqus11List);
    	
    	RscAnswerVO ansqus12data = new RscAnswerVO();
    	String rscQuesIdx12 = "RSC-2022-0000-01-035";
    	ansqus12data.setRscQuesIdx(rscQuesIdx12);
    	List<RscAnswerVO> dataqus12List = rscService.RscAnsqus01List(ansqus12data);
    	model.addAttribute("dataqus12List", dataqus12List);
    	
    	RscAnswerVO ansqus13data = new RscAnswerVO();
    	String rscQuesIdx13 = "RSC-2022-0000-01-036";
    	ansqus13data.setRscQuesIdx(rscQuesIdx13);
    	List<RscAnswerVO> dataqus13List = rscService.RscAnsqus01List(ansqus13data);
    	model.addAttribute("dataqus13List", dataqus13List);
    	
    	RscAnswerVO ansqus14data = new RscAnswerVO();
    	String rscQuesIdx14 = "RSC-2022-0000-01-037";
    	ansqus14data.setRscQuesIdx(rscQuesIdx14);
    	List<RscAnswerVO> dataqus14List = rscService.RscAnsqus01List(ansqus14data);
    	model.addAttribute("dataqus14List", dataqus14List);
    	
    	RscAnswerVO ansqus15data = new RscAnswerVO();
    	String rscQuesIdx15 = "RSC-2022-0000-01-038";
    	ansqus15data.setRscQuesIdx(rscQuesIdx15);
    	List<RscAnswerVO> dataqus15List = rscService.RscAnsqus01List(ansqus15data);
    	model.addAttribute("dataqus15List", dataqus15List);
    	
    	RscAnswerVO ansqus16data = new RscAnswerVO();
    	String rscQuesIdx16 = "RSC-2022-0000-01-039";
    	ansqus16data.setRscQuesIdx(rscQuesIdx16);
    	List<RscAnswerVO> dataqus16List = rscService.RscAnsqus01List(ansqus16data);
    	model.addAttribute("dataqus16List", dataqus16List);
    	
    	RscAnswerVO ansqus17data = new RscAnswerVO();
    	String rscQuesIdx17 = "RSC-2022-0000-01-040";
    	ansqus17data.setRscQuesIdx(rscQuesIdx17);
    	List<RscAnswerVO> dataqus17List = rscService.RscAnsqus01List(ansqus17data);
    	model.addAttribute("dataqus17List", dataqus17List);
    	
    	RscAnswerVO ansqus18data = new RscAnswerVO();
    	String rscQuesIdx18 = "RSC-2022-0000-01-041";
    	ansqus18data.setRscQuesIdx(rscQuesIdx18);
    	List<RscAnswerVO> dataqus18List = rscService.RscAnsqus01List(ansqus18data);
    	model.addAttribute("dataqus18List", dataqus18List);
    	
    	
    	return "/rsc/ansDataListSec03";
    }
    
    @RequestMapping(value = {"/ansDataListSec04", "/ansDataListSec04.do"})
    public String ansDataListSec04(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-042";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-043";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-044";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-045";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-046";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-047";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-048";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-049";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	return "/rsc/ansDataListSec04";
    }
    
    @RequestMapping(value = {"/ansDataListSec05", "/ansDataListSec05.do"})
    public String ansDataListSec05(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-050";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-051";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-052";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-053";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-054";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-055";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-056";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-057";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	RscAnswerVO ansqus09data = new RscAnswerVO();
    	String rscQuesIdx9 = "RSC-2022-0000-01-058";
    	ansqus09data.setRscQuesIdx(rscQuesIdx9);
    	List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
    	model.addAttribute("dataqus09List", dataqus09List);
    	
    	RscAnswerVO ansqus10data = new RscAnswerVO();
    	String rscQuesIdx10 = "RSC-2022-0000-01-059";
    	ansqus10data.setRscQuesIdx(rscQuesIdx10);
    	List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
    	model.addAttribute("dataqus10List", dataqus10List);
    	
    	return "/rsc/ansDataListSec05";
    }
    
    @RequestMapping(value = {"/ansDataListSec06", "/ansDataListSec06.do"})
    public String ansDataListSec06(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-060";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-061";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-062";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-063";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-064";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-065";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-066";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-067";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	RscAnswerVO ansqus09data = new RscAnswerVO();
    	String rscQuesIdx9 = "RSC-2022-0000-01-068";
    	ansqus09data.setRscQuesIdx(rscQuesIdx9);
    	List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
    	model.addAttribute("dataqus09List", dataqus09List);
    	
    	RscAnswerVO ansqus10data = new RscAnswerVO();
    	String rscQuesIdx10 = "RSC-2022-0000-01-069";
    	ansqus10data.setRscQuesIdx(rscQuesIdx10);
    	List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
    	model.addAttribute("dataqus10List", dataqus10List);
    	
    	RscAnswerVO ansqus11data = new RscAnswerVO();
    	String rscQuesIdx11 = "RSC-2022-0000-01-070";
    	ansqus11data.setRscQuesIdx(rscQuesIdx11);
    	List<RscAnswerVO> dataqus11List = rscService.RscAnsqus01List(ansqus11data);
    	model.addAttribute("dataqus11List", dataqus11List);
    	
    	RscAnswerVO ansqus12data = new RscAnswerVO();
    	String rscQuesIdx12 = "RSC-2022-0000-01-071";
    	ansqus12data.setRscQuesIdx(rscQuesIdx12);
    	List<RscAnswerVO> dataqus12List = rscService.RscAnsqus01List(ansqus12data);
    	model.addAttribute("dataqus12List", dataqus12List);
    	
    	RscAnswerVO ansqus13data = new RscAnswerVO();
    	String rscQuesIdx13 = "RSC-2022-0000-01-072";
    	ansqus13data.setRscQuesIdx(rscQuesIdx13);
    	List<RscAnswerVO> dataqus13List = rscService.RscAnsqus01List(ansqus13data);
    	model.addAttribute("dataqus13List", dataqus13List);
    	
    	RscAnswerVO ansqus14data = new RscAnswerVO();
    	String rscQuesIdx14 = "RSC-2022-0000-01-073";
    	ansqus14data.setRscQuesIdx(rscQuesIdx14);
    	List<RscAnswerVO> dataqus14List = rscService.RscAnsqus01List(ansqus14data);
    	model.addAttribute("dataqus14List", dataqus14List);
    	
    	RscAnswerVO ansqus15data = new RscAnswerVO();
    	String rscQuesIdx15 = "RSC-2022-0000-01-074";
    	ansqus15data.setRscQuesIdx(rscQuesIdx15);
    	List<RscAnswerVO> dataqus15List = rscService.RscAnsqus01List(ansqus15data);
    	model.addAttribute("dataqus15List", dataqus15List);
    	
    	RscAnswerVO ansqus16data = new RscAnswerVO();
    	String rscQuesIdx16 = "RSC-2022-0000-01-075";
    	ansqus16data.setRscQuesIdx(rscQuesIdx16);
    	List<RscAnswerVO> dataqus16List = rscService.RscAnsqus01List(ansqus16data);
    	model.addAttribute("dataqus16List", dataqus16List);
    	
    	RscAnswerVO ansqus17data = new RscAnswerVO();
    	String rscQuesIdx17 = "RSC-2022-0000-01-076";
    	ansqus17data.setRscQuesIdx(rscQuesIdx17);
    	List<RscAnswerVO> dataqus17List = rscService.RscAnsqus01List(ansqus17data);
    	model.addAttribute("dataqus17List", dataqus17List);
    	
    	RscAnswerVO ansqus18data = new RscAnswerVO();
    	String rscQuesIdx18 = "RSC-2022-0000-01-077";
    	ansqus18data.setRscQuesIdx(rscQuesIdx18);
    	List<RscAnswerVO> dataqus18List = rscService.RscAnsqus01List(ansqus18data);
    	model.addAttribute("dataqus18List", dataqus18List);
    	
    	RscAnswerVO ansqus19data = new RscAnswerVO();
    	String rscQuesIdx19 = "RSC-2022-0000-01-078";
    	ansqus19data.setRscQuesIdx(rscQuesIdx19);
    	List<RscAnswerVO> dataqus19List = rscService.RscAnsqus01List(ansqus19data);
    	model.addAttribute("dataqus19List", dataqus19List);
    	
    	RscAnswerVO ansqus20data = new RscAnswerVO();
    	String rscQuesIdx20 = "RSC-2022-0000-01-079";
    	ansqus20data.setRscQuesIdx(rscQuesIdx20);
    	List<RscAnswerVO> dataqus20List = rscService.RscAnsqus01List(ansqus20data);
    	model.addAttribute("dataqus20List", dataqus20List);
    	
    	RscAnswerVO ansqus21data = new RscAnswerVO();
    	String rscQuesIdx21 = "RSC-2022-0000-01-080";
    	ansqus21data.setRscQuesIdx(rscQuesIdx21);
    	List<RscAnswerVO> dataqus21List = rscService.RscAnsqus01List(ansqus21data);
    	model.addAttribute("dataqus21List", dataqus21List);
    	
    	RscAnswerVO ansqus22data = new RscAnswerVO();
    	String rscQuesIdx22 = "RSC-2022-0000-01-081";
    	ansqus22data.setRscQuesIdx(rscQuesIdx22);
    	List<RscAnswerVO> dataqus22List = rscService.RscAnsqus01List(ansqus22data);
    	model.addAttribute("dataqus22List", dataqus22List);
    	
    	RscAnswerVO ansqus23data = new RscAnswerVO();
    	String rscQuesIdx23 = "RSC-2022-0000-01-082";
    	ansqus23data.setRscQuesIdx(rscQuesIdx23);
    	List<RscAnswerVO> dataqus23List = rscService.RscAnsqus01List(ansqus23data);
    	model.addAttribute("dataqus23List", dataqus23List);
    	
    	RscAnswerVO ansqus24data = new RscAnswerVO();
    	String rscQuesIdx24 = "RSC-2022-0000-01-083";
    	ansqus24data.setRscQuesIdx(rscQuesIdx24);
    	List<RscAnswerVO> dataqus24List = rscService.RscAnsqus01List(ansqus24data);
    	model.addAttribute("dataqus24List", dataqus24List);
    	
    	RscAnswerVO ansqus25data = new RscAnswerVO();
    	String rscQuesIdx25 = "RSC-2022-0000-01-084";
    	ansqus25data.setRscQuesIdx(rscQuesIdx25);
    	List<RscAnswerVO> dataqus25List = rscService.RscAnsqus01List(ansqus25data);
    	model.addAttribute("dataqus25List", dataqus25List);
    	
    	return "/rsc/ansDataListSec06";
    }
    @RequestMapping(value = {"/ansDataListSec07", "/ansDataListSec07.do"})
    public String ansDataListSec07(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-085";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-086";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-087";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-088";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-089";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-090";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-091";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-092";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	RscAnswerVO ansqus09data = new RscAnswerVO();
    	String rscQuesIdx9 = "RSC-2022-0000-01-093";
    	ansqus09data.setRscQuesIdx(rscQuesIdx9);
    	List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
    	model.addAttribute("dataqus09List", dataqus09List);
    	
    	RscAnswerVO ansqus10data = new RscAnswerVO();
    	String rscQuesIdx10 = "RSC-2022-0000-01-094";
    	ansqus10data.setRscQuesIdx(rscQuesIdx10);
    	List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
    	model.addAttribute("dataqus10List", dataqus10List);
    	
    	RscAnswerVO ansqus11data = new RscAnswerVO();
    	String rscQuesIdx11 = "RSC-2022-0000-01-095";
    	ansqus11data.setRscQuesIdx(rscQuesIdx11);
    	List<RscAnswerVO> dataqus11List = rscService.RscAnsqus01List(ansqus11data);
    	model.addAttribute("dataqus11List", dataqus11List);
    	
    	RscAnswerVO ansqus12data = new RscAnswerVO();
    	String rscQuesIdx12 = "RSC-2022-0000-01-096";
    	ansqus12data.setRscQuesIdx(rscQuesIdx12);
    	List<RscAnswerVO> dataqus12List = rscService.RscAnsqus01List(ansqus12data);
    	model.addAttribute("dataqus12List", dataqus12List);
    	
    	return "/rsc/ansDataListSec07";
    }
    
    @RequestMapping(value = {"/ansDataListSec08", "/ansDataListSec08.do"})
    public String ansDataListSec08(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsComList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	RscAnswerVO ansqus01data = new RscAnswerVO();
    	String rscQuesIdx1 = "RSC-2022-0000-01-097";
    	ansqus01data.setRscQuesIdx(rscQuesIdx1);
    	List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
    	model.addAttribute("dataqus01List", dataqus01List);
    	
    	RscAnswerVO ansqus02data = new RscAnswerVO();
    	String rscQuesIdx2 = "RSC-2022-0000-01-098";
    	ansqus02data.setRscQuesIdx(rscQuesIdx2);
    	List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
    	model.addAttribute("dataqus02List", dataqus02List);
    	
    	RscAnswerVO ansqus03data = new RscAnswerVO();
    	String rscQuesIdx3 = "RSC-2022-0000-01-099";
    	ansqus03data.setRscQuesIdx(rscQuesIdx3);
    	List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
    	model.addAttribute("dataqus03List", dataqus03List);
    	
    	RscAnswerVO ansqus04data = new RscAnswerVO();
    	String rscQuesIdx4 = "RSC-2022-0000-01-100";
    	ansqus04data.setRscQuesIdx(rscQuesIdx4);
    	List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
    	model.addAttribute("dataqus04List", dataqus04List);
    	
    	RscAnswerVO ansqus05data = new RscAnswerVO();
    	String rscQuesIdx5 = "RSC-2022-0000-01-101";
    	ansqus05data.setRscQuesIdx(rscQuesIdx5);
    	List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
    	model.addAttribute("dataqus05List", dataqus05List);
    	
    	RscAnswerVO ansqus06data = new RscAnswerVO();
    	String rscQuesIdx6 = "RSC-2022-0000-01-102";
    	ansqus06data.setRscQuesIdx(rscQuesIdx6);
    	List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
    	model.addAttribute("dataqus06List", dataqus06List);
    	
    	RscAnswerVO ansqus07data = new RscAnswerVO();
    	String rscQuesIdx7 = "RSC-2022-0000-01-103";
    	ansqus07data.setRscQuesIdx(rscQuesIdx7);
    	List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
    	model.addAttribute("dataqus07List", dataqus07List);
    	
    	RscAnswerVO ansqus08data = new RscAnswerVO();
    	String rscQuesIdx8 = "RSC-2022-0000-01-104";
    	ansqus08data.setRscQuesIdx(rscQuesIdx8);
    	List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
    	model.addAttribute("dataqus08List", dataqus08List);
    	
    	RscAnswerVO ansqus09data = new RscAnswerVO();
    	String rscQuesIdx9 = "RSC-2022-0000-01-105";
    	ansqus09data.setRscQuesIdx(rscQuesIdx9);
    	List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
    	model.addAttribute("dataqus09List", dataqus09List);
    	
    	RscAnswerVO ansqus10data = new RscAnswerVO();
    	String rscQuesIdx10 = "RSC-2022-0000-01-106";
    	ansqus10data.setRscQuesIdx(rscQuesIdx10);
    	List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
    	model.addAttribute("dataqus10List", dataqus10List);
    	
    	RscAnswerVO ansqus11data = new RscAnswerVO();
    	String rscQuesIdx11 = "RSC-2022-0000-01-107";
    	ansqus11data.setRscQuesIdx(rscQuesIdx11);
    	List<RscAnswerVO> dataqus11List = rscService.RscAnsqus01List(ansqus11data);
    	model.addAttribute("dataqus11List", dataqus11List);
    	
    	RscAnswerVO ansqus12data = new RscAnswerVO();
    	String rscQuesIdx12 = "RSC-2022-0000-01-108";
    	ansqus12data.setRscQuesIdx(rscQuesIdx12);
    	List<RscAnswerVO> dataqus12List = rscService.RscAnsqus01List(ansqus12data);
    	model.addAttribute("dataqus12List", dataqus12List);
    	
    	RscAnswerVO ansqus13data = new RscAnswerVO();
    	String rscQuesIdx13 = "RSC-2022-0000-01-109";
    	ansqus12data.setRscQuesIdx(rscQuesIdx13);
    	List<RscAnswerVO> dataqus13List = rscService.RscAnsqus01List(ansqus13data);
    	model.addAttribute("dataqus13List", dataqus13List);
    	
    	
    	
    	return "/rsc/ansDataListSec08";
    }
    
    @RequestMapping(value = {"/ansDataListSec09", "/ansDataListSec09.do"})
    public String ansDataListSec09(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "02");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
    	RscAnswerVO anscomdata = new RscAnswerVO();
    	List<RscAnswerVO> dataComList = rscService.RscAnsContentList(anscomdata);
    	model.addAttribute("dataComList", dataComList);
    	
    	
    	
    	
    	
    	return "/rsc/ansDataListSec09";
    }
    
    @RequestMapping(value = {"/eveDataListSec01", "/eveDataListSec01.do"})
    public String eveDataListSec01(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "03");
    	
		/*
		 * RscAnswerVO ansdata = new RscAnswerVO(); List<RscAnswerVO> queDataList =
		 * rscService.RscAnsDataList(ansdata); model.addAttribute("queDataList",
		 * queDataList);
		 */
    	
		
		 RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		 dataComList = rscService.RscAnsContentList(anscomdata); 
		 model.addAttribute("dataComList",dataComList);
		 
		 /*
		 * RscAnswerVO ansqus01data = new RscAnswerVO(); String rscQuesIdx1 =
		 * "RSC-2022-0000-01-001"; ansqus01data.setRscQuesIdx(rscQuesIdx1);
		 * List<RscAnswerVO> dataqus01List = rscService.RscAnsqus01List(ansqus01data);
		 * model.addAttribute("dataqus01List", dataqus01List);
		 * 
		 * RscAnswerVO ansqus02data = new RscAnswerVO(); String rscQuesIdx2 =
		 * "RSC-2022-0000-01-002"; ansqus02data.setRscQuesIdx(rscQuesIdx2);
		 * List<RscAnswerVO> dataqus02List = rscService.RscAnsqus01List(ansqus02data);
		 * model.addAttribute("dataqus02List", dataqus02List);
		 * 
		 * RscAnswerVO ansqus03data = new RscAnswerVO(); String rscQuesIdx3 =
		 * "RSC-2022-0000-01-003"; ansqus03data.setRscQuesIdx(rscQuesIdx3);
		 * List<RscAnswerVO> dataqus03List = rscService.RscAnsqus01List(ansqus03data);
		 * model.addAttribute("dataqus03List", dataqus03List);
		 * 
		 * RscAnswerVO ansqus04data = new RscAnswerVO(); String rscQuesIdx4 =
		 * "RSC-2022-0000-01-004"; ansqus04data.setRscQuesIdx(rscQuesIdx4);
		 * List<RscAnswerVO> dataqus04List = rscService.RscAnsqus01List(ansqus04data);
		 * model.addAttribute("dataqus04List", dataqus04List);
		 * 
		 * RscAnswerVO ansqus05data = new RscAnswerVO(); String rscQuesIdx5 =
		 * "RSC-2022-0000-01-005"; ansqus05data.setRscQuesIdx(rscQuesIdx5);
		 * List<RscAnswerVO> dataqus05List = rscService.RscAnsqus01List(ansqus05data);
		 * model.addAttribute("dataqus05List", dataqus05List);
		 * 
		 * RscAnswerVO ansqus06data = new RscAnswerVO(); String rscQuesIdx6 =
		 * "RSC-2022-0000-01-006"; ansqus06data.setRscQuesIdx(rscQuesIdx6);
		 * List<RscAnswerVO> dataqus06List = rscService.RscAnsqus01List(ansqus06data);
		 * model.addAttribute("dataqus06List", dataqus06List);
		 * 
		 * RscAnswerVO ansqus07data = new RscAnswerVO(); String rscQuesIdx7 =
		 * "RSC-2022-0000-01-007"; ansqus07data.setRscQuesIdx(rscQuesIdx7);
		 * List<RscAnswerVO> dataqus07List = rscService.RscAnsqus01List(ansqus07data);
		 * model.addAttribute("dataqus07List", dataqus07List);
		 * 
		 * RscAnswerVO ansqus08data = new RscAnswerVO(); String rscQuesIdx8 =
		 * "RSC-2022-0000-01-008"; ansqus08data.setRscQuesIdx(rscQuesIdx8);
		 * List<RscAnswerVO> dataqus08List = rscService.RscAnsqus01List(ansqus08data);
		 * model.addAttribute("dataqus08List", dataqus08List);
		 * 
		 * RscAnswerVO ansqus09data = new RscAnswerVO(); String rscQuesIdx9 =
		 * "RSC-2022-0000-01-009"; ansqus09data.setRscQuesIdx(rscQuesIdx9);
		 * List<RscAnswerVO> dataqus09List = rscService.RscAnsqus01List(ansqus09data);
		 * model.addAttribute("dataqus09List", dataqus09List);
		 * 
		 * RscAnswerVO ansqus10data = new RscAnswerVO(); String rscQuesIdx10 =
		 * "RSC-2022-0000-01-010"; ansqus10data.setRscQuesIdx(rscQuesIdx10);
		 * List<RscAnswerVO> dataqus10List = rscService.RscAnsqus01List(ansqus10data);
		 * model.addAttribute("dataqus10List", dataqus10List);
		 * 
		 * RscAnswerVO ansqus11data = new RscAnswerVO(); String rscQuesIdx11 =
		 * "RSC-2022-0000-01-011"; ansqus11data.setRscQuesIdx(rscQuesIdx11);
		 * List<RscAnswerVO> dataqus11List = rscService.RscAnsqus01List(ansqus11data);
		 * model.addAttribute("dataqus11List", dataqus11List);
		 * 
		 * RscAnswerVO ansqus12data = new RscAnswerVO(); String rscQuesIdx12 =
		 * "RSC-2022-0000-01-012"; ansqus12data.setRscQuesIdx(rscQuesIdx12);
		 * List<RscAnswerVO> dataqus12List = rscService.RscAnsqus01List(ansqus12data);
		 * model.addAttribute("dataqus12List", dataqus12List);
		 */
    	
    	return "/rsc/eveDataListSec01";
    }
    @RequestMapping(value = {"/eveDataListSec02", "/eveDataListSec02.do"})
    public String eveDataListSec02(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "03");
    	
    	RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		dataComList = rscService.RscAnsComList(anscomdata); 
		model.addAttribute("dataComList",dataComList);
		
    	return "/rsc/eveDataListSec02";
    }
    @RequestMapping(value = {"/eveDataListSec03", "/eveDataListSec03.do"})
    public String eveDataListSec03(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "03");
    	
    	RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		dataComList = rscService.RscAnsComList(anscomdata); 
		model.addAttribute("dataComList",dataComList);
		
    	return "/rsc/eveDataListSec03";
    }
    @RequestMapping(value = {"/eveDataListSec04", "/eveDataListSec04.do"})
    public String eveDataListSec04(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "03");
    	
    	RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		dataComList = rscService.RscAnsComList(anscomdata); 
		model.addAttribute("dataComList",dataComList);
		
    	return "/rsc/eveDataListSec04";
    }
    @RequestMapping(value = {"/eveDataListSec05", "/eveDataListSec05.do"})
    public String eveDataListSec05(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "03");
    	
    	RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		dataComList = rscService.RscAnsComList(anscomdata); 
		model.addAttribute("dataComList",dataComList);
		
    	return "/rsc/eveDataListSec05";
    }
    
    @RequestMapping(value = {"/eveDataListSec06", "/eveDataListSec06.do"})
    public String eveDataListSec06(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "03");
    	
    	RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		dataComList = rscService.RscAnsComList(anscomdata); 
		model.addAttribute("dataComList",dataComList);
		
    	return "/rsc/eveDataListSec06";
    }
    
    @RequestMapping(value = {"/eveDataListSec07", "/eveDataListSec07.do"})
    public String eveDataListSec07(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "03");
    	
    	RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		dataComList = rscService.RscAnsComList(anscomdata); 
		model.addAttribute("dataComList",dataComList);
		
    	return "/rsc/eveDataListSec07";
    }
    
    @RequestMapping(value = {"/numDataListSec01", "/numDataListSec01.do"})
    public String numDataListSec01(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("subMenuType", "04");
    	
    	RscAnswerVO anscomdata = new RscAnswerVO(); List<RscAnswerVO> 
		dataComList = rscService.RscAnsComList(anscomdata); 
		model.addAttribute("dataComList",dataComList);
		
    	return "/rsc/numDataListSec01";
    }
    
    
}

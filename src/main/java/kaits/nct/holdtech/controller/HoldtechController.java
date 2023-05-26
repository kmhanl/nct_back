package kaits.nct.holdtech.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kaits.nct.member.model.MemberInvitationSaveDTO;
import kaits.nct.member.model.MemberInvitationVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;
import kaits.nct.policy.model.PolicyVO;

import kaits.nct.policy.service.PolicyService;
import kaits.nct.research.model.EndFileVO;

@Controller
@RequestMapping(value = "/holdtech")
public class HoldtechController {
	
	@Autowired
	private MemberService memberService;
	
	
		
	 	@SuppressWarnings({ "unchecked", "rawtypes" })
	    @RequestMapping(value = {"/holdtechCallList", "/holdtechCallList.do"})
	    public String holdtechCallList(HttpServletRequest request, HttpServletResponse response
	            , HttpSession session
	            , ModelMap model) {
	    	
	    	System.out.println("====================");
	    	MemberVO user = (MemberVO)session.getAttribute("user");
	    	// 세션 확인
	    	if (user == null) {
	    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
	        	return "redirect:/member/login.do";
	    	}
	    	
	    	model.addAttribute("user", user);
	    	model.addAttribute("mainMenuType", "04");
	    	model.addAttribute("subMenuType", "00");
	    	
	    	
	    	MemberInvitationVO params = new MemberInvitationVO(); // 리스트 조회 조건 파라메터 생성
	    	if(request.getParameter("pageNo") == null) {
	    		params.setPageInit();
	    	} else {
	    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
	    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
	    	}
	    	String admInviStat = request.getParameter("admInviStat");
	    	if (!"200".equals(admInviStat) && !"400".equals(admInviStat)) {
	    		admInviStat = null;
	    	}
	    	params.setAdmInviStat(admInviStat);
	    	
	    	List<MemberInvitationVO> invitationList = memberService.getComInvitationList(params);
	//
	    	model.addAttribute("invitationList", invitationList);
	    	model.addAttribute("tabList", memberService.getMemberTabList());
	    	model.addAttribute("paging", memberService.getPaging());
	    	
	    	return  "/holdtech/holdtechCallList";
	    	
	    }
	 	
	 	@SuppressWarnings({ "unchecked", "rawtypes" })
	    @RequestMapping(value = {"/holdtechData", "/holdtechData.do"})
	    public String holdtechData(HttpServletRequest request, HttpServletResponse response
	            , HttpSession session
	            , ModelMap model) {
	    	
	    	System.out.println("====================");
	    	MemberVO user = (MemberVO)session.getAttribute("user");
	    	// 세션 확인
	    	if (user == null) {
	    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
	        	return "redirect:/member/login.do";
	    	}
	    	
	    	model.addAttribute("user", user);
	    	model.addAttribute("mainMenuType", "04");
	    	model.addAttribute("subMenuType", "01");
	    	
	    	return  "/holdtech/holdtechData";
	    	
	    }
	 	
	 	
	 	@SuppressWarnings({ "unchecked", "rawtypes" })
	    @RequestMapping(value = {"/statistics", "/statistics.do"})
	    public String statistics(HttpServletRequest request, HttpServletResponse response
	            , HttpSession session
	            , ModelMap model) {
	    	
	    	System.out.println("====================");
	    	MemberVO user = (MemberVO)session.getAttribute("user");
	    	// 세션 확인
	    	if (user == null) {
	    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
	        	return "redirect:/member/login.do";
	    	}
	    	
	    	model.addAttribute("user", user);
	    	model.addAttribute("mainMenuType", "04");
	    	model.addAttribute("subMenuType", "01");
	    	
	    	return  "/holdtech/statistics";
	    	
	    }
	 	
	 	
	 	
	 	 /**
	     * 업무 포털 회원 대상기업  신규 등록
	     * @param request
	     * @param response
	     * @param session
	     * @param model
	     * @return
	     */
	    @RequestMapping(value = {"/invitationWrite", "/invitationWrite.do"})
	    public String showholdtechinvitationWritePopup(HttpServletRequest request, HttpServletResponse response
	    		, HttpSession session
	    		, ModelMap model) {
	    	MemberVO user = (MemberVO)session.getAttribute("user");
	    	// 세션 확인
	    	if (user == null) {
	    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
	    		return "redirect:/member/login.do";
	    	}
	    	model.addAttribute("user", user);
	    	
	    	return "/holdtech/popup/invitationWrite";
	    }
	 	
	    /** 초대정보 저장
		 * @param request
		 * @param session
		 * @return
		 * @throws Exception
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		@RequestMapping(value="/inviteSave.do", method=RequestMethod.POST)
		public ResponseEntity setAdminInvitation(
				@RequestBody MemberInvitationSaveDTO param,
				HttpServletRequest request,
				HttpSession session) throws Exception {
//			MemberVO user = (MemberVO)session.getAttribute("user");
			// 접수 등록 서비스 호출
			
			String admId = memberService.setComInvitation(param);
			
			Map<Object,Object> resultMap = new HashMap<Object, Object>();
			resultMap.put("resultCode", "S");
			resultMap.put("resultSeq", admId);
			
			// 한글 깨짐 방지
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "application/json; charset=utf-8");
			return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
		}
	 	
	
}

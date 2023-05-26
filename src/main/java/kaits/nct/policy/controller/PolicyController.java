package kaits.nct.policy.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kaits.nct.member.model.MemberVO;
import kaits.nct.policy.model.PolicyVO;

import kaits.nct.policy.service.PolicyService;
import kaits.nct.research.model.EndFileVO;

@Controller
@RequestMapping(value = "/policy")
public class PolicyController {
	
		@Autowired
		private PolicyService policyService;

	
	    @RequestMapping(value = {"/policyList", "/policyList.do"})
	    public String policyList(HttpServletRequest request, HttpServletResponse response
	            , HttpSession session
	            , ModelMap model) {
	    	
	    	System.out.println("====================");
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
	    	model.addAttribute("mainMenuType", "07");
	    	model.addAttribute("subMenuType", "01");
	    	
	    	

	    	PolicyVO params = new PolicyVO();
	    	if(request.getParameter("pageNo") == null) {
	    		params.setPageInit();
	    	} else {
	    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
	    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
	    	}
	    	List<PolicyVO> policyList = policyService.getPolicyList(params);
	    	
	    	model.addAttribute("policyList", policyList);
	    	model.addAttribute("paging", policyService.getPaging());
	    	
	    	
	    	return  "/policy/policyList";
	    	
	    }
	
	    // 산업기술유출·침해신고 > 기술 유출 상담 > 뷰 페이지
	    @RequestMapping(value = {"/policyView", "/policyView.do"})
	    public String policyView(HttpServletRequest request, HttpServletResponse response
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
	    	model.addAttribute("mainMenuType", "07");
	    	model.addAttribute("subMenuType", "01");
	    	
	    	String policyCode = request.getParameter("code");
	    	PolicyVO params = new PolicyVO();
	    	params.setPolicyCode(policyCode);
	    	List<PolicyVO> policyView = policyService.getPolicyView(params);
	    	
	    	
	    	EndFileVO endFile = new EndFileVO();
	    	endFile.setFileRegId(policyCode);
	    	List<EndFileVO> policyFileList = policyService.policyFileList(endFile);
	    	
	    	String pageNom = request.getParameter("pageNo");
	    	model.addAttribute("pageNo", pageNom);
	    	model.addAttribute("policyFileList", policyFileList);
	    	model.addAttribute("policyView", policyView.get(0));
	    	
	    	
	    	return "/policy/policyView";
	    }
	    
	    @SuppressWarnings({ "unchecked", "rawtypes" })
		@RequestMapping(method = RequestMethod.POST, value = "/setUpData.do")
		public ResponseEntity setUpData(HttpServletRequest request, HttpServletResponse response, HttpSession session,
				@RequestParam Map<Object, Object> rscMemInfo, ModelMap model) {
	    	MemberVO user = (MemberVO)session.getAttribute("user");
	    	
	    	Map<Object, Object> resultMap = new HashMap<Object, Object>();
	    	
			String policyViewYn = request.getParameter("policyViewYn");
			String policyCode = request.getParameter("policyCode");
			String policyAnswer = request.getParameter("policyAnswer");
			
			System.out.println("policyViewYn===" + policyViewYn); 
			PolicyVO policyintoData = new PolicyVO();
			policyintoData.setPolicyCode(policyCode);
			policyintoData.setPolicyViewYn(policyViewYn);
			policyintoData.setPolicyAnswer(policyAnswer);
			policyintoData.setPolicySignId(user.getCpnId());
			
			
			policyCode = policyService.setUpData(policyintoData);	
	    	
	    	// 한글 깨짐 방지
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "application/json; charset=utf-8");
			return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED);
	    }
	    
	 	
}

package kaits.nct.exp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kaits.nct.exp.model.ExpAgdListVO;
import kaits.nct.exp.model.ExpLoadFileVO;
import kaits.nct.exp.model.ExpMetaVO;
import kaits.nct.exp.model.ExpNctTechVO;
import kaits.nct.exp.model.ExpRecCompeVO;
import kaits.nct.exp.model.ExpRecConturyVO;
import kaits.nct.exp.model.ExpRecHistoryVO;
import kaits.nct.exp.model.ExpRecListVO;
import kaits.nct.exp.model.ExpRecTechVO;
import kaits.nct.exp.service.ExpService;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;

@Controller
@RequestMapping(value = "/expcom")
public class ExpController {
	@Value("#{prop['list.pagerow50']}")
	String pageRows50;
	
	@Value("#{prop['list.pagerow40']}")
	String pageRows40;
	
	@Value("#{prop['list.pagerow30']}")
	String pageRows30;
	
	@Value("#{prop['list.pagerow20']}")
	String pageRows20;
	
	@Value("#{prop['list.pagerow10']}")
	String pageRows10;
	
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ExpService expService;

	/** 전문위원회 > 접수 현황 > 접수 현황 리스트   **/
	@RequestMapping(value = {"/expRecList", "/expRecList.do"})
    public String expRecList(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 세션이 없으면 로그인 페이지로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/common/memAuthInfo.do";
    	}
    	model.addAttribute("user", user);
    	
    	ExpRecListVO params = new ExpRecListVO(); // 리스트 조회 조건 파라메터 생성
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    		params.setStartNo(0);
    		params.setPageRows(Integer.parseInt(pageRows10));
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(pageRows10));
    		int startNo = (Integer.parseInt(request.getParameter("pageNo")) - 1) * Integer.parseInt(pageRows10); 
    		params.setStartNo(startNo);
    	}
    	
    	String nctRecStatus = request.getParameter("status");
    	// Parameter 값 확인 (rcptStatus)
    	// URL에 직접 임의의 값으로 다른 값으로 조회 혹은 다른 업무 수행 못하도록 차단
    	// 4가지 경우 외 임의의 입력값인 경우 조회 시 조건 없이 조회
    	if (!"REC100".equals(nctRecStatus) && !"REC200".equals(nctRecStatus) && !"REC300".equals(nctRecStatus) && !"REC400".equals(nctRecStatus) && !"REC500".equals(nctRecStatus) && !"REC600".equals(nctRecStatus)&& !"REC700".equals(nctRecStatus)) {
    		nctRecStatus = null;
    	}
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	params.setNctRecStatus(nctRecStatus);
    	System.out.println("변수" + params);
    	//System.out.println("=============================================");
    	
    	List<ExpRecListVO> recList = expService.loadListRec(params);
    	model.addAttribute("recList", recList);
    	System.out.println("접수 리스트" + recList);
    	
    	model.addAttribute("listTechCnt", expService.expListTechCnt()); 
    	System.out.println("기술 분야 카운트" + expService.expListTechCnt());
    	
    	model.addAttribute("listTechList", expService.expListTechList());
    	System.out.println("기술 분야 리스트" + expService.expListTechList());
    	
    	model.addAttribute("topTap", expService.recListTap());
    	System.out.println("topTap" + expService.recListTap());
    	model.addAttribute("paging", expService.getPaging());
    	System.out.println("paging" + expService.getPaging());
    	model.addAttribute("pageRowsT", pageRows10);
    	
    	
    	model.addAttribute("mainMenuCode", "EXP001");
    	return ".tiles/expcom/expRecList";
    }
	
	/** 전문위원회 > 접수 현황 > 신규 접수 등록   **/
	@RequestMapping(value = {"/expRecSetup", "/expRecSetup.do"})
    public String expRepSetup(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 세션이 없으면 로그인 페이지로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG03".equals(user.getAdmGroup()) || "AMG04".equals(user.getAdmGroup()) || "AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/common/memAuthInfo.do";
    	}
    	model.addAttribute("user", user);
    	model.addAttribute("mainMenuCode", "EXP001");
    	return ".tiles/expcom/expRecSetup";
    }
	
	/** 전문위원회 > 접수 현황 > 접수 신청 상세   **/
	@RequestMapping(value = {"/expRecView", "/expRecView.do"})
    public String expRecView(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 세션이 없으면 로그인 페이지로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/common/memAuthInfo.do";
    	}
    	model.addAttribute("user", user);
    	
    	
    	String code = request.getParameter("code");
    	System.out.println("접수번호" + code);
    	
    	ExpMetaVO nctRec = new ExpMetaVO(); // 신청서 + 메타 상세 조회 
    	nctRec.setNctRecCode(code);
    	List<ExpMetaVO> loadRec = expService.loadViewRecMeta(nctRec);
    	System.out.println("신청메타" + loadRec.get(0));
    	model.addAttribute("nctRec", loadRec.get(0));
    	System.out.println("신청메타코드" + loadRec.get(0).getNctMetaCode());
    	String metaCode = loadRec.get(0).getNctMetaCode();
    	if (loadRec.size() == 0) {
    		return null;
    	}
    	
    	ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
    	model.addAttribute("nctTechList", nctTechList);
    	
    	ExpRecTechVO params = new ExpRecTechVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecTechVO> recTechList = expService.expRecViewTech(params);
    	System.out.println("기술명칭" + recTechList);
    	model.addAttribute("recTechList", recTechList);
    	
    	ExpRecConturyVO countury = new ExpRecConturyVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecConturyVO> recCtyList = expService.expRecViewCountury(countury);
    	System.out.println("대상국명" + recCtyList);
    	model.addAttribute("recCtyList", recCtyList);
    	
    	ExpRecHistoryVO history = new ExpRecHistoryVO(); // 히스토리 리스트 조회
    	history.setNctRecCode(code);
    	List<ExpRecHistoryVO> recHisList = expService.expRecViewHistory(history);
    	System.out.println("히스토리" + recHisList);
    	model.addAttribute("recHisList", recHisList);
    	
    	ExpRecCompeVO compe = new ExpRecCompeVO(); // 검토 권한 리스트 조회
    	compe.setNctRecCode(code);
    	List<ExpRecCompeVO> recCompeList = expService.expRecViewCompe(compe);
    	System.out.println("검토권한" + recCompeList);
    	model.addAttribute("recCompeList", recCompeList);
    	
    	ExpLoadFileVO nctFile = new ExpLoadFileVO();
    	nctFile.setNctUseCode(code);
    	nctFile.setNctRecCode(code);
    	List<ExpLoadFileVO> fileList = expService.expViewFile(nctFile);
    	
    	model.addAttribute("recFileList", fileList);
    	System.out.println("파일리슨트" + fileList);
    	
    	model.addAttribute("viewerPath", viewerPath);
		
    	
    	// 소과 계정 AMG04 인 경우 검토 의견 권한 체크 후 뷰 페이지 로드 
    	
    	
    	
    	model.addAttribute("mainMenuCode", "EXP001");
    	return ".tiles/expcom/expRecView";
    }
	
	/** 전문위원회 > 안건 현황 > 안건현황 리스트   **/
	@RequestMapping(value = {"/expAgdList", "/expAgdList.do"})
    public String expAgdList(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExpAgdListVO params = new ExpAgdListVO(); // 리스트 조회 조건 파라메터 생성
    	
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    		params.setStartNo(0);
    		params.setPageRows(Integer.parseInt(pageRows10));
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(pageRows10));
    		int startNo = (Integer.parseInt(request.getParameter("pageNo")) - 1) * Integer.parseInt(pageRows10); 
    		params.setStartNo(startNo);
    	}
    	String nctRecStatus = request.getParameter("status");
    	if(nctRecStatus != null) {
    		if("REC500".equals(nctRecStatus)) {
	    		params.setNctRecStatus(nctRecStatus);
	    		params.setNctAgdStatus("AGD000");
	    	}else {
	    		params.setNctRecStatus("REC000");
	    		params.setNctAgdStatus(nctRecStatus);
	    	}
		}
    	
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	System.out.println("변수" + params);
    	System.out.println("===" + user.getAdmId());
    	
    	List<ExpAgdListVO> agdList = expService.loadListAgd(params);
    	model.addAttribute("agdList", agdList);
    	System.out.println("안건 리스트" + agdList);
    	
    	model.addAttribute("listTechCnt", expService.expListTechCnt()); 
    	System.out.println("기술 분야 카운트" + expService.expListTechCnt());
    	
    	model.addAttribute("listTechList", expService.expListTechList());
    	System.out.println("기술 분야 리스트" + expService.expListTechList());
    	
    	model.addAttribute("agdlistTap", expService.agdListTap());
    	model.addAttribute("paging", expService.getPaging());
    	System.out.println("===" + expService.getPaging());
    	model.addAttribute("mainMenuCode", "EXP002");
    	System.out.println("===" + expService.agdListTap());
    	
    	
    		ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
        	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
        	model.addAttribute("nctTechList", nctTechList);
    	
        return ".tiles/expcom/expAgdList";
    }
	
	/** 전문위원회 > 안건 현황 > 안건현황 상세 > 접수 완료 인 경우    **/
	@RequestMapping(value = {"/expAgdRView", "/expAgdRView.do"})
    public String expAgdRView(HttpServletRequest request, HttpServletResponse response
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
    	
    	
    	String code = request.getParameter("code");
    	System.out.println("접수번호" + code);
    	
    	ExpMetaVO nctRec = new ExpMetaVO(); // 신청서 + 메타 상세 조회 
    	nctRec.setNctRecCode(code);
    	List<ExpMetaVO> loadRec = expService.loadViewRecMeta(nctRec);
    	System.out.println("신청메타" + loadRec.get(0));
    	model.addAttribute("nctRec", loadRec.get(0));
    	System.out.println("신청메타코드" + loadRec.get(0).getNctMetaCode());
    	String metaCode = loadRec.get(0).getNctMetaCode();
    	if (loadRec.size() == 0) {
    		return null;
    	}
    	
    	ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
    	model.addAttribute("nctTechList", nctTechList);
    	
    	ExpRecTechVO params = new ExpRecTechVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecTechVO> recTechList = expService.expRecViewTech(params);
    	System.out.println("기술명칭" + recTechList);
    	model.addAttribute("recTechList", recTechList);
    	
    	ExpRecConturyVO countury = new ExpRecConturyVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecConturyVO> recCtyList = expService.expRecViewCountury(countury);
    	System.out.println("대상국명" + recCtyList);
    	model.addAttribute("recCtyList", recCtyList);
    	
    	ExpRecHistoryVO history = new ExpRecHistoryVO(); // 히스토리 리스트 조회
    	history.setNctRecCode(code);
    	List<ExpRecHistoryVO> recHisList = expService.expRecViewHistory(history);
    	System.out.println("히스토리" + recHisList);
    	model.addAttribute("recHisList", recHisList);
    	
    	ExpRecCompeVO compe = new ExpRecCompeVO(); // 검토 권한 리스트 조회
    	compe.setNctRecCode(code);
    	List<ExpRecCompeVO> recCompeList = expService.expRecViewCompe(compe);
    	System.out.println("검토권한" + recCompeList);
    	model.addAttribute("recCompeList", recCompeList);
    	
    	// 소과 계정 AMG04 인 경우 검토 의견 권한 체크 후 뷰 페이지 로드 
    	
    	
    	
    	model.addAttribute("mainMenuCode", "EXP002");
    	return ".tiles/expcom/expRecView";
    }
	
	/** 전문위원회 > 안건 현황 > 안건현황 상세 > 검토준비중 이상 인 경우    **/
	@RequestMapping(value = {"/expAgdView", "/expAgdView.do"})
    public String expAgdView(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 세션이 없으면 로그인 페이지로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/common/memAuthInfo.do";
    	}
    	model.addAttribute("user", user);
    	
    	
    	String code = request.getParameter("code");
    	System.out.println("안건번호" + code);
    	
    	ExpMetaVO nctAgd = new ExpMetaVO(); // 신청서 + 메타 상세 조회 
    	nctAgd.setNctAgdCode(code);
    	List<ExpMetaVO> loagAgdMeta = expService.loadViewAgdMeta(nctAgd);
    	model.addAttribute("nctAgd", loagAgdMeta.get(0));
    	System.out.println("안건메타코드" + loagAgdMeta.get(0).getNctMetaCode());
    	String metaCode = loagAgdMeta.get(0).getNctMetaCode();
    	if (loagAgdMeta.size() == 0) {
    		return null;
    	}
    	
    	ExpRecTechVO params = new ExpRecTechVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecTechVO> recTechList = expService.expRecViewTech(params);
    	System.out.println("기술명칭" + recTechList);
    	model.addAttribute("recTechList", recTechList);
    	
    	ExpRecConturyVO countury = new ExpRecConturyVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecConturyVO> recCtyList = expService.expRecViewCountury(countury);
    	System.out.println("대상국명" + recCtyList);
    	model.addAttribute("recCtyList", recCtyList);
    	
    	ExpLoadFileVO nctFile = new ExpLoadFileVO();
    	nctFile.setNctUseCode(code);
    	nctFile.setNctAgdCode(code);
    	List<ExpLoadFileVO> fileList = expService.expViewFile(nctFile);
    	
    	model.addAttribute("recFileList", fileList);
    	System.out.println("파일리슨트" + fileList);
    	
    	model.addAttribute("viewerPath", viewerPath);
    	
    	model.addAttribute("mainMenuCode", "EXP002");
    	return ".tiles/expcom/expAgdView";
    }
	
	/** 전문위원회 > 안건 현황 > 안건현황 상세 > 검토준비중 이상 인 경우    **/
	@RequestMapping(value = {"/expRdyView", "/expRdyView.do"})
    public String expRdyView(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 세션이 없으면 로그인 페이지로 이동
        	return "redirect:/member/login.do";
    	}
    	// 접근권한이 없으면
    	if ("AMG05".equals(user.getAdmGroup()) || "AMG06".equals(user.getAdmGroup())) {
    		return "redirect:/common/memAuthInfo.do";
    	}
    	model.addAttribute("user", user);
    	
    	
    	String code = request.getParameter("code");
    	System.out.println("안건번호" + code);
    	
    	ExpMetaVO nctAgd = new ExpMetaVO(); // 신청서 + 메타 상세 조회 
    	nctAgd.setNctAgdCode(code);
    	List<ExpMetaVO> loagAgdMeta = expService.loadViewAgdMeta(nctAgd);
    	model.addAttribute("nctAgd", loagAgdMeta.get(0));
    	System.out.println("안건메타코드" + loagAgdMeta.get(0).getNctMetaCode());
    	String metaCode = loagAgdMeta.get(0).getNctMetaCode();
    	if (loagAgdMeta.size() == 0) {
    		return null;
    	}
    	
    	ExpRecTechVO params = new ExpRecTechVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecTechVO> recTechList = expService.expRecViewTech(params);
    	System.out.println("기술명칭" + recTechList);
    	model.addAttribute("recTechList", recTechList);
    	
    	ExpRecConturyVO countury = new ExpRecConturyVO(); // 기술 명칭 리스트 조회
    	params.setNctMetaCode(metaCode);
    	List<ExpRecConturyVO> recCtyList = expService.expRecViewCountury(countury);
    	System.out.println("대상국명" + recCtyList);
    	model.addAttribute("recCtyList", recCtyList);
    	
    	ExpLoadFileVO nctFile = new ExpLoadFileVO();
    	nctFile.setNctUseCode(code);
    	nctFile.setNctAgdCode(code);
    	List<ExpLoadFileVO> fileList = expService.expViewFile(nctFile);
    	
    	model.addAttribute("recFileList", fileList);
    	System.out.println("파일리슨트" + fileList);
    	
    	model.addAttribute("viewerPath", viewerPath);
    	
    	model.addAttribute("mainMenuCode", "EXP003");
    	return ".tiles/expcom/expAgdView";
    }
	
	/** 전문위원회 > 검토준비중 > 검토준비중 리스트    **/
	@RequestMapping(value = {"/expRdyList", "/expRdyList.do"})
    public String expRdyList(HttpServletRequest request, HttpServletResponse response
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
    	
    	ExpAgdListVO params = new ExpAgdListVO(); // 리스트 조회 조건 파라메터 생성
    	if(request.getParameter("pageNo") == null) {
    		params.setPageInit();
    		params.setStartNo(0);
    		params.setPageRows(Integer.parseInt(pageRows10));
    	} else {
    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
    		params.setPageRows(Integer.parseInt(pageRows10));
    		int startNo = (Integer.parseInt(request.getParameter("pageNo")) - 1) * Integer.parseInt(pageRows10); 
    		params.setStartNo(startNo);
    	}
    	
    	
    	params.setAdmGroup(user.getAdmGroup()); // 사용자 권한
    	params.setAdmId(user.getAdmId()); // 사용자 권한
    	System.out.println("변수" + user.getAdmGroup());
    	System.out.println("===" + user.getAdmId());
    	
    	List<ExpAgdListVO> agdList = expService.loadListRdy(params);
    	model.addAttribute("agdList", agdList);
    	System.out.println("안건 리스트" + agdList);
    	
    	model.addAttribute("listTechCnt", expService.expListTechCnt()); 
    	System.out.println("기술 분야 카운트" + expService.expListTechCnt());
    	
    	model.addAttribute("listTechList", expService.expListTechList());
    	System.out.println("기술 분야 리스트" + expService.expListTechList());
    	model.addAttribute("agdlistTap", expService.agdListTap());
    	model.addAttribute("paging", expService.getPaging());
    	System.out.println("===" + expService.getPaging());
    	model.addAttribute("mainMenuCode", "EXP003");
        return ".tiles/expcom/expRdyList";
    }
	
	/** 전문위원회 > 참석일 선택 > 참석일 선택  리스트    **/
	@RequestMapping(value = {"/expDpkList", "/expDpkList.do"})
    public String expDpkList(HttpServletRequest request, HttpServletResponse response
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
    	
    	
    	model.addAttribute("mainMenuCode", "EXP004");
        return ".tiles/expcom/expDpkList";
    }
	
	/** 전문위원회 > 위원회 현황 > 위원회 현황 선택  리스트    **/
	@RequestMapping(value = {"/expComList", "/expComList.do"})
    public String expComList(HttpServletRequest request, HttpServletResponse response
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
    	model.addAttribute("mainMenuCode", "EXP005");
        return ".tiles/expcom/expComList";
    }
	
	/** 전문위원회 > 검토 준비중 > 위원회 구성   **/
	@RequestMapping(value = {"/expComSetup", "/expComSetup.do"})
    public String expComSetup(HttpServletRequest request, HttpServletResponse response
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
    	
    	//아이디 기술 분야 권한 가져 오기 
    	ExpNctTechVO haveTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	haveTech.setAdmId(user.getAdmId());
    	List<ExpNctTechVO> haveTechList = expService.haveTech(haveTech);
    	model.addAttribute("haveTechList", haveTechList);
    	
    	ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
    	model.addAttribute("nctTechList", nctTechList);
    	
    	model.addAttribute("mainMenuCode", "EXP003");
        return ".tiles/expcom/expComSetup";
    }
	
	@RequestMapping(value = {"/expComView", "/expComView.do"})
    public String expComView(HttpServletRequest request, HttpServletResponse response
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
    	
    	
    	ExpNctTechVO haveTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	haveTech.setAdmId(user.getAdmId());
    	List<ExpNctTechVO> haveTechList = expService.haveTech(haveTech);
    	model.addAttribute("haveTechList", haveTechList);
    	
    	ExpNctTechVO nctTech = new ExpNctTechVO(); // 국가 핵심기술 기술 분야 명칭 
    	List<ExpNctTechVO> nctTechList = expService.nctTech(nctTech);
    	model.addAttribute("nctTechList", nctTechList);
    	
    	model.addAttribute("mainMenuCode", "EXP005");
        return ".tiles/expcom/expComView";
    }
	
	@RequestMapping(value = {"/expComOpt", "/expComOpt.do"})
    public String expComOpt(HttpServletRequest request, HttpServletResponse response
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
    	
    	
        return ".tiles/expcom/expComOpt";
    }
	
	@RequestMapping(value = {"/expComCfm", "/expComCfm.do"})
    public String expComCfm(HttpServletRequest request, HttpServletResponse response
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
    	
    	
        return ".tiles/expcom/expComCfm";
    }
	
	@RequestMapping(value = {"/expCfmPrint", "/expCfmPrint.do"})
    public String expCfmPrint(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	if (user == null) {
    		// 사용자가 로그인되어 있으면 메인 화면으로 이동
        	return "redirect:/member/login.do";
    	}
    	
    	model.addAttribute("user", user);
    	
    	
    	System.out.println("================>expcom 프린트");
        return ".tiles/expcom/expCfmPrint";
    }
	
	
}

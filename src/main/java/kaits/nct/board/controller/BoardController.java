package kaits.nct.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import kaits.nct.member.model.MemberVO;
import kaits.nct.policy.model.PolicyVO;
import kaits.nct.receipt.model.ReceiptSaveDTO;
import kaits.nct.board.model.BoardVO;
import kaits.nct.research.model.EndFileVO;
import kaits.nct.board.service.BoardService;
import kaits.nct.common.model.FileIdxVO;
import kaits.nct.common.service.FileService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kaits.nct.common.model.FileIdxVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@Controller
@RequestMapping("/board")
public class BoardController {
	@Value("#{prop['file.url']}")  
	String filePath;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	FileService fileService;
	
	 @RequestMapping(value = "/informationList")
	    public String boardList(HttpServletRequest request, HttpServletResponse response
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
	    	model.addAttribute("subMenuType", "00");
	    	
	    	BoardVO params = new BoardVO();
	    	if(request.getParameter("pageNo") == null) {
	    		params.setPageInit();
	    	} else {
	    		params.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
	    		params.setPageRows(Integer.parseInt(request.getParameter("pageRows")));
	    	}
	    	List<BoardVO> boardList = boardService.getBoardList(params);
	    	
	    	model.addAttribute("boardList", boardList);
	    	model.addAttribute("paging", boardService.getPaging());

	        return "/board/informationList";
	    }
	 
	 // 산업기술유출·침해신고 > 기술 유출 상담 > 뷰 페이지
	    @RequestMapping(value = {"/boardView", "/boardView.do"})
	    public String boardView(HttpServletRequest request, HttpServletResponse response
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
	    	model.addAttribute("subMenuType", "00");
	    	
	    	String infoBoardCode = request.getParameter("code");
	    	BoardVO params = new BoardVO();
	    	params.setInfoBoardCode(infoBoardCode);
	    	List<BoardVO> BoardView = boardService.getBoardView(params);
	    	
	    	
	    	EndFileVO endFile = new EndFileVO();
	    	endFile.setFileRegId(infoBoardCode);
	    	List<EndFileVO> BoardFileList = boardService.BoardFileList(endFile);
	    	
	    	String pageNom = request.getParameter("pageNo");
	    	model.addAttribute("code", infoBoardCode);
	    	model.addAttribute("pageNo", pageNom);
	    	model.addAttribute("BoardFileList", BoardFileList);
	    	model.addAttribute("BoardView", BoardView.get(0));
	    	
	    	
	    	return "/board/boardView";
	    }
	    
	    @RequestMapping(value = {"/boardWrite", "/boardWrite.do"})
	    public String policyWrite(HttpServletRequest request, HttpServletResponse response
	            , HttpSession session
	            , ModelMap model) {
	    	
	    	MemberVO user = (MemberVO)session.getAttribute("user"); // 세션 확인
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
	    	model.addAttribute("subMenuType", "00");
	    	return "/board/boardWrite";
	    }
	    
	 // 산업기술유출·침해신고 > 기술 유출 상담 > 뷰 페이지
	    @RequestMapping(value = {"/boardModify", "/boardModify.do"})
	    public String BoardModify(HttpServletRequest request, HttpServletResponse response
	            , HttpSession session
	            , ModelMap model) {
	    	
	    	
	    	
	    	MemberVO user = (MemberVO)session.getAttribute("user"); // 세션 확인
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
	    	model.addAttribute("subMenuType", "00");
	    	
	    	String BoardCode = request.getParameter("code");
	    	BoardVO params = new BoardVO();
	    	params.setInfoBoardCode(BoardCode);
	    	List<BoardVO> BoardView = boardService.getBoardView(params);
	    	
	    	
	    	EndFileVO endFile = new EndFileVO();
	    	endFile.setFileRegId(BoardCode);
	    	List<EndFileVO> BoardFileList = boardService.BoardFileList(endFile);
	    	String pageNom = request.getParameter("pageNo");
	    	model.addAttribute("pageNo", pageNom);
	    	model.addAttribute("BoardFileList", BoardFileList);
	    	model.addAttribute("BoardView", BoardView.get(0));
	    	
	    	
	    	return "/board/boardModify";
	    }
	    
	    @SuppressWarnings({ "unchecked", "rawtypes" })
		@RequestMapping(method = RequestMethod.POST, value = "/saveData.do")
		public ResponseEntity saveData(HttpServletRequest request, HttpServletResponse response, HttpSession session,
				@RequestParam Map<Object, Object> rscMemInfo, ModelMap model) {

			System.out.println("save");
			String infoBoardTitle = request.getParameter("infoBoardTitle");
			String infoBoardContent = request.getParameter("infoBoardContent");
			String infoBoardId = request.getParameter("infoBoardId");
			String infoBoardCode = request.getParameter("infoBoardCode");
			String infoBoardViewYn = request.getParameter("infoBoardViewYn");
			//System.out.println(policyDepth);
			
			BoardVO policyintoData = new BoardVO();
			policyintoData.setInfoBoardTitle(infoBoardTitle);
			policyintoData.setInfoBoardContent(infoBoardContent);
			policyintoData.setInfoBoardViewYn(infoBoardViewYn);
			policyintoData.setInfoBoardId(infoBoardId);
			if(infoBoardCode != "") {
			 policyintoData.setInfoBoardCode(infoBoardCode);
			}
			System.out.println("policyCode=====>" + infoBoardCode);
			if(infoBoardCode == null || infoBoardCode.isEmpty()) {
				infoBoardCode = boardService.InsertBoardData(policyintoData);
			}else {
				infoBoardCode = boardService.UpdataBoardData(policyintoData);	
			}
			Map<Object, Object> resultMap = new HashMap<Object, Object>();
			resultMap.put("resultData", infoBoardCode);

			if (infoBoardCode  != null) {
				// 성공
				resultMap.put("resultCode", "S");
				
			} else {
				// 실패
				resultMap.put("resultCode", "F");
			}

			// 한글 깨짐 방지
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "application/json; charset=utf-8");
			return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED);
		}
	    
	    @SuppressWarnings({ "rawtypes", "unchecked" })
		@ResponseBody
		@PostMapping(value="/uploadFile.do")
		@ResponseStatus(HttpStatus.NO_CONTENT)
		public ResponseEntity saveReceiptFileFinal(ReceiptSaveDTO receiptSaveDTO, HttpSession session, HttpServletRequest request) throws Exception {
			request.setCharacterEncoding("UTF-8");
			
			ArrayList<FileIdxVO> fileIdxList = new ArrayList<FileIdxVO>();
			String policyCode = request.getParameter("policyCode");
			//System.out.println(policyCode);
			FileIdxVO fileIdxVO = new FileIdxVO();
			fileIdxVO.setFileAgdIdx(policyCode);
			fileIdxVO.setFileRegId(policyCode);
			fileIdxList.add(fileIdxVO);
			
			String fileUploadPath = "";
			if("LOCAL".equals(filePath)) {
				// Local에서 파일 업로드 시 tomcat webapps 내에  저장
				fileUploadPath = request.getSession().getServletContext().getRealPath("/upload/file/");
			} else {
				// 지정된 서버 경로에 저장
				fileUploadPath = filePath;
			}
			fileService.saveFile(fileUploadPath, receiptSaveDTO.getFileList(), fileIdxList);
			
			Map<Object,Object> resultMap = new HashMap<Object, Object>();
			resultMap.put("resultCode", "S");
			resultMap.put("resultData", null);
			
			// 한글 깨짐 방지
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "application/json; charset=utf-8");
			return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
		}
		
	    
	    
	    

}

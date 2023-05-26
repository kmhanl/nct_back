package kaits.nct.exp.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import kaits.nct.common.model.EmailSaveDTO;
import kaits.nct.common.model.FileIdxVO;
import kaits.nct.common.model.NctFileVO;
import kaits.nct.common.model.NctUploadFileVO;
import kaits.nct.common.model.SmsSaveDTO;

import kaits.nct.common.service.FileService;
import kaits.nct.common.service.UploadService;

import kaits.nct.common.service.SendService;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;
import kaits.nct.exp.model.ExpNctTechVO;
import kaits.nct.exp.model.ExpRecHistoryVO;
import kaits.nct.exp.model.ExpMetaVO;
import kaits.nct.exp.model.ExpRecSaveDTO;
import kaits.nct.exp.model.ExpRecUpdateVO;
import kaits.nct.exp.model.ExpSchComVO;
import kaits.nct.exp.model.ExpSendAgdDTO;
import kaits.nct.exp.model.ExtRecCompeDTO;
import kaits.nct.exp.service.ExpService;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptSaveDTO;



@RestController
@RequestMapping(value = "/exp/proc")
public class ExpProcController {
	@Value("#{prop['file.url']}")
	String filePath;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ExpService expService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	UploadService uploadService;
	
	/**
     * 전문위원회 - 접수현황  >> 신규 접수 등록 > 대상 기업 조회 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/findCom.do")
	public ResponseEntity findCom(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> param
			, ModelMap model) {
//		MemberVO user = (MemberVO) session.getAttribute("user");
		String cpnNm = request.getParameter("cpnNm");
		String comCode = request.getParameter("comCode");
		
		ExpSchComVO svParam = new ExpSchComVO();
		svParam.setCpnId(comCode);
		svParam.setCpnNm(cpnNm);
		List<ExpSchComVO> resultList = expService.schCompany(svParam);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		if(cpnNm == null) {
			resultMap.put("resultList", resultList.get(0));
		}else {
			resultMap.put("resultList", resultList);
		}
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황  >> 신규 접수 등록 > 기술 분야 > 기술 범위 조회
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/findTechArea.do")
	public ResponseEntity findTechArea(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> param
			, ModelMap model) {
		//		MemberVO user = (MemberVO) session.getAttribute("user");
		String techId = param.get("techId").toString();
		System.out.println("뉴 메타 코드 : "+techId);
		ExpNctTechVO expertTechItemVO = new ExpNctTechVO();
		expertTechItemVO.setTechId(techId);
		
		// 접수상태 변경
		List<ExpNctTechVO> resultList = expService.loadTechAreaList(expertTechItemVO);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultList", resultList);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	/**
     * 전문위원회 - 접수현황 >> 신규 접수 등록 > 메타 코드 생성
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "makeKey.do")
	public ResponseEntity makeKey(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		ExpMetaVO Param = new ExpMetaVO();
		String metaCode = expService.makeNewCode(Param);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("metaCode", metaCode);
		
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황 >> 신규 접수 등록 > 파일 저장
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	@PostMapping(value="/saveFileData.do")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity saveFileData(ExpRecSaveDTO expRecSaveDTO, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 파일 업로드 체크 
		ArrayList<NctFileVO> fileIdxList = new ArrayList<NctFileVO>();
		
		NctFileVO fileIdxVO = new NctFileVO();
		fileIdxVO.setNctUseCode(expRecSaveDTO.getMetaCode());
		fileIdxVO.setNctFileRegId(user.getAdmId());
		fileIdxList.add(fileIdxVO);
		
		String fileUploadPath = "";
		if("LOCAL".equals(filePath)) {
			fileUploadPath = "LOCAL";
		} else {
			// 지정된 서버 경로에 저장
			fileUploadPath = filePath;
		}
		System.out.println("fileUploadPath: "+fileUploadPath);
		uploadService.uploadFile(fileUploadPath, expRecSaveDTO.getFileList(), fileIdxList);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", null);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	
	/**
     * 전문위원회 - 접수현황 >> 신규 접수 등록 > 데이터 저장
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/saveMetaData.do", method=RequestMethod.POST)
	public ResponseEntity saveMetaData(
			@RequestBody ExpRecSaveDTO expRecSaveDTO
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
		
		// 접수 등록 서비스 호출 
    	try {
    		expRecSaveDTO.setAdmIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
		expRecSaveDTO.setUserId(user.getAdmId());
		expRecSaveDTO.setAdmGroup(user.getAdmGroup());
		expRecSaveDTO.setMetaDateTime(nowTime);
		String nctRecCode = expService.saveMetaData(expRecSaveDTO);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		
		resultMap.put("resultCode", "S");
		resultMap.put("nctRecCode", nctRecCode);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 안건 현황 >> 리스트 > 검토 요청  > 검토 요청 파일 저장
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	@PostMapping(value="/saveSendFileData.do")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity saveSendFileData(ExpSendAgdDTO expSendAgdDTO, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 파일 업로드 체크 
		ArrayList<NctFileVO> fileIdxList = new ArrayList<NctFileVO>();
		for (String agdCode: expSendAgdDTO.getAgdCodeList()){
			NctFileVO fileIdxVO = new NctFileVO();
			fileIdxVO.setNctUseCode(agdCode);
			fileIdxVO.setNctFileRegId(user.getAdmId());
			fileIdxList.add(fileIdxVO);
		}
		System.out.println("con: "+expSendAgdDTO);
		String fileUploadPath = "";
		if("LOCAL".equals(filePath)) {
			fileUploadPath = "LOCAL";
		} else {
			// 지정된 서버 경로에 저장
			fileUploadPath = filePath;
		}
		System.out.println("fileUploadPath: "+fileUploadPath);
		uploadService.uploadFile(fileUploadPath, expSendAgdDTO.getFileList(), fileIdxList);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", null);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 안건 현황 >> 리스트 > 검토 요청  > 검토 요청 파일 저장
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/saveSendData.do", method=RequestMethod.POST)
	public ResponseEntity saveSendData(
			@RequestBody ExpSendAgdDTO expSendAgdDTO
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
    	System.out.println("안건 데이터 저장 : "+expSendAgdDTO);
    	// 접수 등록 서비스 호출 
    	try {
    		expSendAgdDTO.setAdmIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	expSendAgdDTO.setUserId(user.getAdmId());
    	expSendAgdDTO.setAdmGroup(user.getAdmGroup());
    	expSendAgdDTO.setMetaDateTime(nowTime);
		String nctRecCode = expService.saveSendData(expSendAgdDTO);
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", null);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황 상세  >> 의견 첨부 권한 저장 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "recComentSave.do")
	public ResponseEntity recComentSave(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
    	
		String recCode = request.getParameter("recCode");
		String recComent = request.getParameter("recComent");
		
		ExpRecHistoryVO param = new ExpRecHistoryVO();
		param.setNctRecCode(recCode);
		param.setNctRecHisCode("H200");
		param.setHisAmgGruop(user.getAdmGroup());
		param.setHisComment(recComent);
		param.setHisRegId(user.getAdmId());
		param.setHisRegDt(nowTime);
		
		try {
			param.setHisRegIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("검토의견 저장 : "+param);
		// 접수상태 변경
		expService.insertRecHistory(param);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황 상세  >> 신청서 승인 처리 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "saveRecConfirm.do")
	public ResponseEntity saveRecConfirm(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
    	
		String recCode = request.getParameter("recCode");
		
		ExpRecHistoryVO param = new ExpRecHistoryVO();
		param.setNctRecCode(recCode);
		param.setNctRecHisCode("H100");
		param.setNctRecStatus("REC500");
		param.setHisAmgGruop(user.getAdmGroup());
		param.setHisRegId(user.getAdmId());
		param.setHisRegDt(nowTime);
		
		try {
			param.setHisRegIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		expService.insertRecHistory(param);
		
		ExpRecUpdateVO recUp = new ExpRecUpdateVO();
		recUp.setNctRecCode(recCode);
		recUp.setNctRecStatus("REC500");
		recUp.setNctRecStatusLast(nowTime);
		recUp.setNctRecStatusLastId(user.getAdmId());
		
		expService.updateRecStat(recUp);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황 상세  >> 신청서 승인 회수 처리 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "saveRecBaCon.do")
	public ResponseEntity saveRecBaCon(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
    	
		String recCode = request.getParameter("recCode");
		
		ExpRecHistoryVO param = new ExpRecHistoryVO();
		param.setNctRecCode(recCode);
		param.setNctRecHisCode("H100");
		param.setNctRecStatus("REC200");
		param.setHisAmgGruop(user.getAdmGroup());
		param.setHisRegId(user.getAdmId());
		param.setHisRegDt(nowTime);
		
		try {
			param.setHisRegIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		expService.insertRecHistory(param);
		
		ExpRecUpdateVO recUp = new ExpRecUpdateVO();
		recUp.setNctRecCode(recCode);
		recUp.setNctRecStatus("REC200");
		recUp.setNctRecStatusLast(nowTime);
		recUp.setNctRecStatusLastId(user.getAdmId());
		
		expService.updateRecStat(recUp);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황 상세  >> 신청서 반려 처리 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "saveRecReCon.do")
	public ResponseEntity saveRecReCon(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
    	
		String recCode = request.getParameter("recCode");
		
		ExpRecHistoryVO param = new ExpRecHistoryVO();
		param.setNctRecCode(recCode);
		param.setNctRecHisCode("H100");
		param.setNctRecStatus("REC300");
		param.setHisAmgGruop(user.getAdmGroup());
		param.setHisRegId(user.getAdmId());
		param.setHisRegDt(nowTime);
		
		try {
			param.setHisRegIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		expService.insertRecHistory(param);
		
		ExpRecUpdateVO recUp = new ExpRecUpdateVO();
		recUp.setNctRecCode(recCode);
		recUp.setNctRecStatus("REC300");
		recUp.setNctRecStatusLast(nowTime);
		recUp.setNctRecStatusLastId(user.getAdmId());
		
		expService.updateRecStat(recUp);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황 상세  >> 신청서 반려 회수 처리 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "saveRecBaRe.do")
	public ResponseEntity saveRecBaRe(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
    	
		String recCode = request.getParameter("recCode");
		
		ExpRecHistoryVO param = new ExpRecHistoryVO();
		param.setNctRecCode(recCode);
		param.setNctRecHisCode("H100");
		param.setNctRecStatus("REC200");
		param.setHisAmgGruop(user.getAdmGroup());
		param.setHisRegId(user.getAdmId());
		param.setHisRegDt(nowTime);
		
		try {
			param.setHisRegIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		expService.insertRecHistory(param);
		
		ExpRecUpdateVO recUp = new ExpRecUpdateVO();
		recUp.setNctRecCode(recCode);
		recUp.setNctRecStatus("REC200");
		recUp.setNctRecStatusLast(nowTime);
		recUp.setNctRecStatusLastId(user.getAdmId());
		
		expService.updateRecStat(recUp);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/**
     * 전문위원회 - 접수현황 상세  >> 의견 첨부 권한 저장 컨트롤러
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody
	@PostMapping(value = "/recCompeSave.do")
    @ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity recCompeSave(HttpServletRequest request, ExtRecCompeDTO formData, HttpSession session) 
		throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		formData.setAdmId(user.getAdmId());
		formData.setAdmGroup(user.getAdmGroup()); 
		formData.setNctRecCode(request.getParameter("recCode"));
		//System.out.println("=========>exp : "+formData);
		expService.saveRecCompe(formData);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}

	
	
	
}

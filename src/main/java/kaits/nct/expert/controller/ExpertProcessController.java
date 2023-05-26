package kaits.nct.expert.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
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
import kaits.nct.common.model.SmsSaveDTO;
import kaits.nct.common.service.FileService;
import kaits.nct.common.service.SendService;
import kaits.nct.expert.model.ExDataInfoVO;
import kaits.nct.expert.model.ExpertCommitteeMemberSaveDTO;
import kaits.nct.expert.model.ExpertCommitteeMemberVO;
import kaits.nct.expert.model.ExpertCommitteeOpinionVO;
import kaits.nct.expert.model.ExpertCommitteeSaveDTO;
import kaits.nct.expert.model.ExpertCommitteeVO;
import kaits.nct.expert.model.ExpertCountryVO;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.agenda.ExpertAgendaDTO;
import kaits.nct.expert.model.agenda.ExpertAgendaModifyDTO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptDTO;
import kaits.nct.expert.model.receipt.ExpertReceiptHistoryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptSaveDTO;
import kaits.nct.expert.model.receipt.ExpertReceiptStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;

@RestController
@RequestMapping(value = "/expert/proc")
public class ExpertProcessController {
	@Value("#{prop['file.url']}")
	String filePath;
	
	@Autowired
	ExpertService expertService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	SendService sendService;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/agenda/list.do", method=RequestMethod.GET)
	public ResponseEntity getAgendaList(HttpServletRequest request, HttpSession session) throws Exception {
		// 접수 등록 서비스 호출
		String techId = request.getParameter("techId");
		
		ExpertAgendaStatVO param = new ExpertAgendaStatVO();
		param.setAgdTechId(techId);
		param.setAgdStatus("AS");
		
		List<ExpertAgendaStatVO> resultList = expertService.getAgendaStatList(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultList", resultList);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/receipt/save", method=RequestMethod.POST)
	public ResponseEntity saveReceipt(
			@RequestBody ExpertReceiptSaveDTO expertReceiptSaveDTO
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출 dd
		expertReceiptSaveDTO.setUserId(user.getAdmId());
		String metaCode = expertService.saveReceipt(expertReceiptSaveDTO);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("metaCode", metaCode);
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	@PostMapping(value="/receipt/save/file.do")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity saveReceiptFile(ExpertReceiptSaveDTO expertReceiptSaveDTO, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출
		ArrayList<FileIdxVO> fileIdxList = new ArrayList<FileIdxVO>();
		
		FileIdxVO fileIdxVO = new FileIdxVO();
		fileIdxVO.setFileAgdIdx(expertReceiptSaveDTO.getMetaCode());
		fileIdxVO.setFileRegId(user.getAdmId());
		fileIdxList.add(fileIdxVO);

		String fileUploadPath = "";
		if("LOCAL".equals(filePath)) {
			// Local에서 파일 업로드 시 tomcat webapps 내에  저장
			fileUploadPath = request.getSession().getServletContext().getRealPath("/upload/file/");
		} else {
			// 지정된 서버 경로에 저장
			fileUploadPath = filePath;
		}
		fileService.saveFile(fileUploadPath, expertReceiptSaveDTO.getFileList(), fileIdxList);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", null);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody
	@PostMapping(value = "/agenda/save.do")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity agendaSaveWithfileUpload2(ExpertAgendaDTO expertAgendaDTO, HttpSession session, HttpServletRequest request) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		int receiptCnt = 0;
		int agendaCnt = 0;
		
		// Agenda Save Logic
		ArrayList<FileIdxVO> fileIdxList = new ArrayList<FileIdxVO>();
		for (String receipt: expertAgendaDTO.getReceiptIdxList()){
			for (String tech: expertAgendaDTO.getTechList()){
				ExpertAgendaStatVO param = new ExpertAgendaStatVO();
				param.setRcptMetaCode(receipt);
				param.setAgdType("E");
				param.setAgdTechId(tech);
				param.setAgdCode(expertService.getAgdCode(param));
				param.setAdmId(user.getAdmId());
				
				FileIdxVO fileIdxVO = new FileIdxVO();
				fileIdxVO.setFileAgdIdx(param.getRcptMetaCode());
				fileIdxVO.setFileRegId(user.getAdmId());
				fileIdxList.add(fileIdxVO);
				// 안건 데이터 생성
				expertService.saveAgendaStat(param);
				
			}
			receiptCnt++;
		}
		String fileUploadPath = "";
		if("LOCAL".equals(filePath)) {
			fileUploadPath = request.getSession().getServletContext().getRealPath("/upload/file/");
		} else {
			fileUploadPath = filePath;
		}
		fileService.saveFile(fileUploadPath, expertAgendaDTO.getFileList(), fileIdxList);
		
		Map<Object,Object> resultDataMap = new HashMap<Object, Object>();
		resultDataMap.put("receiptSaveCnt", receiptCnt);
		resultDataMap.put("agendaSaveCnt", agendaCnt);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultDataMap);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	public String getNewUUID() {
		return UUID.randomUUID().toString().toUpperCase();
	}

	/*접수내역삭제 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/setDelete.do")
    public ResponseEntity setDelete(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , @RequestParam Map<Object,Object> rcptInfo
            , ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
    	String rcptIdx = rcptInfo.get("rcptIdx").toString();
    	//String nextStatus = rcptInfo.get("nextStatus").toString();
    	
    	ExpertReceiptVO param = new ExpertReceiptVO(rcptIdx);
    	//param.setRcptStatus(nextStatus);
    	param.setAdmId(user.getAdmId());
    	try {
			param.setAdmIpAddress(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	int receiptCnt = expertService.setReceiptCnt(param);
    	// 접수상태 변경
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();
    	if(receiptCnt > 0) {
    		expertService.setDelete(param);	
    		resultMap.put("resultCode", "S");
    	} else {
    		//expertService.setDelete(param);	
    		resultMap.put("resultCode", "F");
    	}
    	
    	

    	// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
    }
	
	
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/status/change.do")
    public ResponseEntity changeReceiptStatus(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , @RequestParam Map<Object,Object> rcptInfo
            , ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
    	String rcptIdx = rcptInfo.get("rcptIdx").toString();
    	String nextStatus = rcptInfo.get("nextStatus").toString();
    	
    	ExpertReceiptVO param = new ExpertReceiptVO(rcptIdx);
    	param.setRcptStatus(nextStatus);
    	param.setAdmId(user.getAdmId());
    	try {
			param.setAdmIpAddress(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	// 접수상태 변경
    	expertService.changeReceiptStatus(param);
    	
		// 성공
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();
    	resultMap.put("resultCode", "S");

    	// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
    }
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/comment/write.do")
	public ResponseEntity writeReceiptComment(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String rcptIdx = rcptInfo.get("rcptIdx").toString();
		String comment = rcptInfo.get("comment").toString();
		
		ExpertReceiptHistoryVO param = new ExpertReceiptHistoryVO(rcptIdx);
		param.setHisCode("B");
		param.setHisComment(comment);
		param.setHisRegId(user.getAdmId());
		try {
			param.setHisRegIp(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		// 접수상태 변경
		expertService.saveReceiptHistory(param);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/delete.do")
	public ResponseEntity deleteReceiptStat(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> rcptInfo
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String metaCode = rcptInfo.get("metaCode").toString();
		
		ExpertReceiptStatVO param = new ExpertReceiptStatVO();
		param.setRcptMetaCode(metaCode);
		
		expertService.deleteMetaData(param);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody
	@PostMapping(value = "/receipt/competence/save.do")
    @ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity saveReceiptCompetence(ExpertReceiptDTO formData, HttpSession session) 
		throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("user");
		formData.setUserId(user.getAdmId());
		expertService.saveReceiptCompetence(formData);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/company.do")
    public ResponseEntity getCompanyData(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , @RequestParam Map<Object,Object> param
            , ModelMap model) {
//		MemberVO user = (MemberVO) session.getAttribute("user");
    	String cpnId = param.get("cpnId").toString();
    	
    	ComMemberVO comMemberVO = new ComMemberVO();
    	comMemberVO.setCpnId(cpnId);
    	
    	// 접수상태 변경
    	List<ComMemberVO> resultList = memberService.getCompany(comMemberVO);
    	
		// 성공
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();
    	resultMap.put("resultCode", "S");
    	resultMap.put("resultData", resultList.get(0));

    	// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
    }
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/techitem.do")
	public ResponseEntity getTechItem(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> param
			, ModelMap model) {
//		MemberVO user = (MemberVO) session.getAttribute("user");
		String techId = param.get("techId").toString();
		
		ExpertTechItemVO expertTechItemVO = new ExpertTechItemVO();
		expertTechItemVO.setTechId(techId);
		
		// 접수상태 변경
		List<ExpertTechItemVO> resultList = expertService.getTechItemList(expertTechItemVO);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultList", resultList);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/company/list.do")
	public ResponseEntity getCompanyList(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> param
			, ModelMap model) {
//		MemberVO user = (MemberVO) session.getAttribute("user");
		String cpnNm = param.get("cpnNm").toString();
		
		ComMemberVO svParam = new ComMemberVO();
		svParam.setCpnNm(cpnNm);;
		// 접수상태 변경
		List<ComMemberVO> resultList = memberService.getCompany(svParam);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultList", resultList);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/country/list.do")
	public ResponseEntity getCountryList(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> param
			, ModelMap model) {
//		MemberVO user = (MemberVO) session.getAttribute("user");
		String conName = param.get("conName").toString();
		
		ExpertCountryVO svParam = new ExpertCountryVO();
		svParam.setConName(conName);
		// 접수상태 변경
		List<ExpertCountryVO> resultList = expertService.getCountryList(svParam);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultList", resultList);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/receipt/agenda/code/list.do")
	public ResponseEntity getAgendaCodeList(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestParam Map<Object,Object> param
			, ModelMap model) {
//		MemberVO user = (MemberVO) session.getAttribute("user");
		String agdViewCode = param.get("agdViewCode").toString();
		
		ExpertAgendaStatVO asParam = new ExpertAgendaStatVO();
		asParam.setAgdViewCode(agdViewCode);
		// 접수상태 변경
		List<ExpertAgendaStatVO> resultList = expertService.getSearchAgendaCode(asParam);
		
		// 성공
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultList", resultList);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/committee/save", method=RequestMethod.POST)
	public ResponseEntity saveCommitteePOST(@RequestBody ExpertCommitteeSaveDTO expertCommitteeSaveDTO, HttpSession session) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출
		expertCommitteeSaveDTO.setUserId(user.getAdmId());
		expertService.saveCommittee(expertCommitteeSaveDTO);
		System.out.println(expertCommitteeSaveDTO);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", null);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/agenda/modify", method=RequestMethod.POST)
	public ResponseEntity modifyAgenda(@RequestBody ExpertAgendaModifyDTO expertAgendaModifyDTO, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출 dd
		expertAgendaModifyDTO.setUserId(user.getAdmId());
		String committeeIdx = expertService.modifyAgenda(expertAgendaModifyDTO);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("committeeIdx", committeeIdx);
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/member/modify", method=RequestMethod.POST)
	public ResponseEntity modifyMember(@RequestBody ExpertCommitteeMemberSaveDTO expertCommitteeMemberSaveDTO, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출 dd
		expertCommitteeMemberSaveDTO.setUserId(user.getAdmId());
		String committeeIdx = expertService.modifyMember(expertCommitteeMemberSaveDTO);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("committeeIdx", committeeIdx);
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commitdate/modify", method=RequestMethod.POST)
	public ResponseEntity modifyCommitteeDate(@RequestBody ExpertCommitteeSaveDTO expertCommitteeSaveDTO, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출 dd
		expertCommitteeSaveDTO.setUserId(user.getAdmId());
		String committeeIdx = expertService.modifyCommitteeDate(expertCommitteeSaveDTO);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("committeeIdx", committeeIdx);
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/send/sms.do")
	public ResponseEntity sendSMS(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestBody SmsSaveDTO smsSaveDTO
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		JSONObject jsonObj = null;
		String resultData = "";
		try {
			resultData = sendService.sendSMS(smsSaveDTO);
//			JsonParser parser = new JsonParser();
//			Object obj = parser.parse( jsonStr );
			jsonObj = new JSONObject(resultData);
//
//			String code = (String) jsonObj.get("code");
//			String name = (String) jsonObj.get("name");
		} catch (IOException e) {
			System.out.println(e);
		}

		String resultCode = "S";
		String resultStatus = "";
		String resultMessage = "";
		String status = "";
		Map<Object,Object> resultObj = new HashMap<Object, Object>();
		if (jsonObj == null) {
			resultCode = "F";
			resultObj.put("status", "9999");
			resultMessage = "발송하는 중 오류가 발생하였습니다.";
			resultStatus = "00";
		} else {
			status = (String) jsonObj.get("status");
			resultObj.put("status", status);
			if (!"0".equals(status)) {
				resultCode = "F";
				resultMessage = (String) jsonObj.get("msg");
				resultStatus = "00";
			} else {
				resultCode = "S";
				resultMessage = "발송이 완료되었습니다.";
				resultStatus = "01";
			}
		}
		resultObj.put("message", resultMessage);
		
		// SMS 히스토리 저장
		smsSaveDTO.getSmsInfo().setSmsHisStatusMsg(resultMessage);
		smsSaveDTO.getSmsInfo().setSmsHisStatus(resultStatus);
		smsSaveDTO.getSmsInfo().setSmsHisDirectSendStatus(status);
		smsSaveDTO.getSmsInfo().setSmsRegId(user.getAdmId());
		
		sendService.saveSmsHistory(smsSaveDTO);
		
		// 결과 전송
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", resultCode);
		resultMap.put("resultData", resultObj);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/send/email.do")
	public ResponseEntity sendEmail(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestBody EmailSaveDTO emailSaveDTO
			, ModelMap model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		JSONObject jsonObj = null;
		String resultData = "";
		
		try {
			resultData = sendService.sendEmail(emailSaveDTO);
//			JsonParser parser = new JsonParser();
//			Object obj = parser.parse( jsonStr );
			
//
//			String code = (String) jsonObj.get("code");
//			String name = (String) jsonObj.get("name");
		} catch (IOException e) {
			//System.out.println(e);
		}
		
		String resultCode = "S";
		String resultStatus = "";
		String resultMessage = "";
		String status = "";
		Map<Object,Object> resultObj = new HashMap<Object, Object>();
		if (jsonObj == null) {
			resultCode = "F";
			resultObj.put("status", "9999");
			resultMessage = "발송하는 중 오류가 발생하였습니다.";
			resultStatus = "00";
		} else {
			status = (String) jsonObj.get("status");
			resultObj.put("status", status);
			if (!"0".equals(status)) {
				resultCode = "F";
				resultMessage = (String) jsonObj.get("msg");
				resultStatus = "00";
			} else {
				resultCode = "S";
				resultMessage = "발송이 완료되었습니다.";
				resultStatus = "01";
			}
		}
		resultObj.put("message", resultMessage);
		
//		// SMS 히스토리 저장
//		smsSaveDTO.getSmsInfo().setSmsHisStatusMsg(resultMessage);
//		smsSaveDTO.getSmsInfo().setSmsHisStatus(resultStatus);
//		smsSaveDTO.getSmsInfo().setSmsHisDirectSendStatus(status);
//		smsSaveDTO.getSmsInfo().setSmsRegId(user.getAdmId());
//		
//		sendService.saveSmsHistory(smsSaveDTO);
		
		// 결과 전송
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", resultCode);
		resultMap.put("resultData", resultObj);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/member/save.do", method=RequestMethod.POST)
	public ResponseEntity setCommitteeMember(
			@RequestBody ExpertCommitteeMemberVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		expertService.saveCommitteeMember(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/info/confirm.do", method=RequestMethod.POST)
	public ResponseEntity confirmCommitteeInfo(
			@RequestBody ExpertCommitteeVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.confirmCommitteeInfo(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/info/cancel.do", method=RequestMethod.POST)
	public ResponseEntity cancelCommitteeInfo(
			@RequestBody ExpertCommitteeVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.cancelCommitteeInfo(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/info/start.do", method=RequestMethod.POST)
	public ResponseEntity startCommitteeInfo(
			@RequestBody ExpertCommitteeVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.startCommitteeInfo(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/info/stop.do", method=RequestMethod.POST)
	public ResponseEntity stopCommitteeInfo(
			@RequestBody ExpertCommitteeVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.stopCommitteeInfo(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/** 전문위원회 - 자료 열람 > 비밀유지의무 동의 저장 **/
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/opinion/agreeViewSave.do", method=RequestMethod.POST)
	public ResponseEntity updateCommitteeAgreeView(
			@RequestBody ExpertCommitteeMemberVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		String committeeIdx = (String) request.getParameter("committeeIdx");
		String committeeSignView = (String) request.getParameter("committeeSignView");
		String committeeSignViewYn = (String) request.getParameter("committeeSignViewYn");
		param.setAdmId(user.getAdmId());
    	
		expertService.updateCommitteeAgreeView(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/** 전문위원회 - 의견 작성 열람 > 비밀유지의무 동의 저장 **/
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/opinion/agreeWriteSave.do", method=RequestMethod.POST)
	public ResponseEntity agreeWriteSave(
			@RequestBody ExpertCommitteeMemberVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		String committeeIdx = (String) request.getParameter("committeeIdx");
		String committeeSignWrite = (String) request.getParameter("committeeSignWrite");
		String committeeSignWriteYn = (String) request.getParameter("committeeSignWriteYn");
		param.setAdmId(user.getAdmId());
    	
		expertService.updateCommitteeAgreeView(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/opinion/save.do", method=RequestMethod.POST)
	public ResponseEntity saveCommitteeOpinion(
			@RequestBody ExpertCommitteeOpinionVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setCommitteeAdmId(user.getAdmId());
		expertService.saveCommitteeOpinion(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getCommitteeAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/opinion/finish.do", method=RequestMethod.POST)
	public ResponseEntity saveCommitteeOpinionStat(
			@RequestBody ExpertCommitteeMemberVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.saveCommitteeOpinionStat(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultData.put("commmitteeIdx", param.getCommitteeIdx());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/agenda/complete.do", method=RequestMethod.POST)
	public ResponseEntity setAgendaComplete(
			@RequestBody ExpertAgendaStatVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.setAgendaComplete(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/agenda/delete.do", method=RequestMethod.POST)
	public ResponseEntity deleteAgenda(
			@RequestBody ExpertAgendaStatVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.deleteAgenda(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/commit/status/change.do", method=RequestMethod.POST)
	public ResponseEntity setCommitteeStatusChange(
			@RequestBody ExpertCommitteeVO param
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// 위원회 구성원 참석일 선택 서비스 호출
		param.setAdmId(user.getAdmId());
		expertService.setCommitteeStatusCS(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		resultData.put("admId", param.getAdmId());
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/cancelEx.do", method=RequestMethod.POST)
	public ResponseEntity cancelEx(
			@RequestBody ExDataInfoVO param
			, HttpSession session
			, HttpServletRequest request
			, ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		Map<Object,Object> resultData = new HashMap<Object, Object>();
		
		if (user == null) {
			model.addAttribute("message", "잘못된 접근 입니다.");
    	}
    	// 접근권한이 없으면
    	if ("AMG04".equals(user.getAdmGroup())) {
    		model.addAttribute("message", "처리 권한이 없습니다");
    	}
    	//System.out.println("================>"+ param.getCommitteeIdx());
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	
	
}

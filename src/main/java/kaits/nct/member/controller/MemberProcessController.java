package kaits.nct.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;

import kaits.nct.common.model.EmailSaveDTO;
import kaits.nct.common.model.NiceApiVO;
import kaits.nct.common.model.SmsSaveDTO;
import kaits.nct.common.model.SmsVO;
import kaits.nct.common.service.NiceService;
import kaits.nct.common.service.SendService;
import kaits.nct.exp.model.ExpSchComVO;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemHistoryVO;
import kaits.nct.member.model.MemberChkVO;
import kaits.nct.member.model.MemberInvitationSaveDTO;
import kaits.nct.member.model.MemberSaveDTO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.model.OtpMemVO;
import kaits.nct.member.service.MemberService;

@RestController
@RequestMapping(value = "/member/proc")
public class MemberProcessController {

	@Value("#{global['active']}")
	String serverType;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SendService sendService;
	
	@Autowired
	NiceService niceService;
	
    /** 로그인 처리 **/
    @SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/login")
    public ResponseEntity loginProc(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , @RequestParam Map<Object,Object> userInfo
            , ModelMap model) {
    	String id = userInfo.get("userid").toString();
    	String password = userInfo.get("userpw").toString();
    	
    	MemberVO member = new MemberVO(id,password);
    	MemberVO loginMember = memberService.UserCheck(member);
    	
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();
    	resultMap.put("resultData", loginMember);
    	if(loginMember != null){
    		String resultCode = "S";
    		String admStat = loginMember.getAdmStat();
    		if("200".equals(admStat)) {
    			// 성공
        		if ("local".equals(serverType)) {
            		session.setAttribute("user", loginMember);
            		resultCode = "SL";
            		
            		String admHisCode = "MEM001";
                	String admHisMenu = "BASIC";
                	String admHisComment = "업무 포털 로그인";
                	MemHistoryVO memHistory = new MemHistoryVO();
                	memHistory.setAdmId(loginMember.getAdmId());
                	memHistory.setAdmHisMenu(admHisMenu);
                	memHistory.setAdmHisCode(admHisCode);
                	memHistory.setAdmHisComment(admHisComment);
                	
                	///** 업무 포털 계정 히스토리 insert **///
                	memberService.insertMemHistory(memHistory);
        		} else {
        			session.setAttribute("member", loginMember);
            		// Otp 저장
            		loginMember.setAdmOtpNumber(this.setadmOtpNumber());
            		memberService.otpSave(loginMember);
        		
    	    		SmsSaveDTO sendDTO = new SmsSaveDTO();
    	    		// SMS 기본 정보
    	    		sendDTO.setSmsInfo(new SmsVO());
    	    		sendDTO.getSmsInfo().setSmsHisMode("S");
    	    		sendDTO.getSmsInfo().setSmsHisType("N");
    	    		sendDTO.getSmsInfo().setSmsHisTit("");
    	    		sendDTO.getSmsInfo().setSmsHisMsg("[국가핵심기술 종합관리시스템] 본인 확인 OTP 인증번호 [" + loginMember.getAdmOtpNumber() + "]를 화면에 입력해주세요.");
    	    		
    	    		SmsVO receiver = new SmsVO();
    	    		receiver.setSmsHisName(loginMember.getAdmName());
    	    		receiver.setSmsHisCom(loginMember.getAdmCom());
    	    		receiver.setSmsHisPhone(loginMember.getAdmMobile1() + loginMember.getAdmMobile2() + loginMember.getAdmMobile3());
    	    		sendDTO.setSmsList(new ArrayList<SmsVO>());
    	    		sendDTO.getSmsList().add(receiver);
    	    		
    	    		try {
    	    			sendService.sendSMS(sendDTO);
    	    		} catch (Exception e) {
    	    			resultCode = "F";
    	    		}
        		}
    		}else {
    			session.setAttribute("user", loginMember);
        		resultCode = "S";
        		
        		String admHisCode = "MEM001";
            	String admHisMenu = "BASIC";
            	String admHisComment = "업무 포털 로그인";
            	MemHistoryVO memHistory = new MemHistoryVO();
            	memHistory.setAdmId(loginMember.getAdmId());
            	memHistory.setAdmHisMenu(admHisMenu);
            	memHistory.setAdmHisCode(admHisCode);
            	memHistory.setAdmHisComment(admHisComment);
    			
    		}
    		

        	resultMap.put("resultCode", resultCode);
        	resultMap.put("resultData", loginMember);
        	resultMap.put("resultStat", loginMember.getAdmStat());
    	}else{
    		// 실패
        	resultMap.put("resultCode", "F");
    	}
    	
    	// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
    }

    /**
     * OTP 인증번호 발행
     * @param request
     * @param response
     * @param session
     * @param otpInfo
     * @param model
     * @return
     * @throws JsonProcessingException
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(method=RequestMethod.POST, value = "/otp/send")
    public ResponseEntity otpSendProc(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , @RequestParam Map<Object,Object> otpInfo
            , ModelMap model) {
    	MemberVO member = (MemberVO) session.getAttribute("member");
    	String resultCode = "S";
		// Otp 저장
    	member.setAdmOtpNumber(this.setadmOtpNumber());
		memberService.otpSave(member);
		// 성공
		
		SmsSaveDTO sendDTO = new SmsSaveDTO();
		// SMS 기본 정보
		sendDTO.setSmsInfo(new SmsVO());
		sendDTO.getSmsInfo().setSmsHisMode("S");
		sendDTO.getSmsInfo().setSmsHisType("N");
		sendDTO.getSmsInfo().setSmsHisTit("");
		sendDTO.getSmsInfo().setSmsHisMsg("[국가핵심기술 종합관리시스템] 본인 확인 OTP 인증번호 [" + member.getAdmOtpNumber() + "]를 화면에 입력해주세요.");
		
		SmsVO receiver = new SmsVO();
		receiver.setSmsHisName(member.getAdmName());
		receiver.setSmsHisCom(member.getAdmCom());
		receiver.setSmsHisPhone(member.getAdmMobile1() + member.getAdmMobile2() + member.getAdmMobile3());
		sendDTO.setSmsList(new ArrayList<SmsVO>());
		sendDTO.getSmsList().add(receiver);
		
		try {
			sendService.sendSMS(sendDTO);
		} catch (Exception e) {
			resultCode = "F";
		}
    	// 추가로 otp 번호 요청 시 필요정보 등록
//    	
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();

    	resultMap.put("resultCode", resultCode);

    	// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
    }

    /**
     * OTP 인증
     * @param request
     * @param response
     * @param session
     * @param otpInfo
     * @param model
     * @return
     * @throws JsonProcessingException
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(method=RequestMethod.POST, value = "/otp/check")
    public ResponseEntity otpCheckProc(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , @RequestParam Map<Object,Object> otpInfo
            , ModelMap model) {
    	// otpInfo 내의 otpNumber
    	String otpNumber = (String)otpInfo.get("otpNumber");

    	MemberVO member = (MemberVO) session.getAttribute("member");
    	member.setAdmOtpNumber(otpNumber);
    	// 추가로 otp 번호 요청 시 필요정보 등록
    	
    	Map<Object,Object> resultMap = memberService.otpCheck(member);
    	
    	if ("S".equals(resultMap.get("resultCode"))) {
    		session.setAttribute("user", member);
    		session.removeAttribute("member");
    	}
    	
    	String admHisCode = "MEM001";
    	String admHisMenu = "BASIC";
    	String admHisComment = "업무 포털 로그인";
    	MemHistoryVO memHistory = new MemHistoryVO();
    	memHistory.setAdmId(member.getAdmId());
    	memHistory.setAdmHisMenu(admHisMenu);
    	memHistory.setAdmHisCode(admHisCode);
    	memHistory.setAdmHisComment(admHisComment);
    	
    	///** 업무 포털 계정 히스토리 insert **///
    	memberService.insertMemHistory(memHistory);
    	

    	// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED);  
    }

    /**
     * 유저 정보 조회
     * @param request
     * @param session
     * @return
     * @throws Exception
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/adm/list.do", method=RequestMethod.GET)
	public ResponseEntity getAdmMemberList(HttpServletRequest request, HttpSession session) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출
		String admAuthTech = request.getParameter("techId");

    	MemberVO member = new MemberVO();
    	member.setAdmAuthTech(admAuthTech);
    	List<MemberVO> resultList = memberService.getAdmMemberList(member);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultList", resultList);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}

    /** 회원가입
     * @param request
     * @param session
     * @return
     * @throws Exception
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/adm/save.do", method=RequestMethod.POST)
	public ResponseEntity setAdmMember(
			HttpServletRequest request,
			@RequestBody MemberVO param,
			HttpSession session) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// 가입 여부 체크
		String admInviYn = param.getAdmInviYn();
		String admInviKey = param.getAdmInviKey();
		String admId = param.getAdmId();
		System.out.println("================>"+ admInviYn);
		
		/*
		 * if("Y".equals(admInviYn)) { System.out.println("초대 키 업데이트  업데이트"+admInviKey);
		 * //memberService.inviFlagUpdate(param); }
		 */
		
		// 접수 등록 서비스 호출
    	String returnMsg = memberService.setAdmMember(param);
    	
		/*
		 * if (returnMsg != null) { System.out.println("권한 업데이트"+admId); }
		 */
    	
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", returnMsg);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/** 회원가입 아이디 중복체크
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/adm/checkid.do", method=RequestMethod.POST)
	public ResponseEntity chechAdmId(
			HttpServletRequest request,
			@RequestBody MemberVO param,
			HttpSession session) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출
		boolean isExists = memberService.isExistsUser(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		if (!isExists) {
			resultMap.put("resultCode", "S");
			resultMap.put("resultData", "사용 가능한 아이디입니다.");
		} else {
			resultMap.put("resultCode", "F");
			resultMap.put("resultData", "이미 사용중인 아이디입니다.");
		}
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/** 초대정보 저장
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/invite/save.do", method=RequestMethod.POST)
	public ResponseEntity setAdminInvitation(
			@RequestBody MemberInvitationSaveDTO param,
			HttpServletRequest request,
			HttpSession session) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출
		String admId = memberService.setAdmInvitation(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultSeq", admId);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	
	//공통 NICE 본인인증 = 휴대폰 리턴 
	@RequestMapping(value = {"/nice/apiResult"})
    public String showApiresult(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) throws Exception {
		NiceApiVO param = new NiceApiVO();
		param.setNiceAuthTokenVersionId(request.getParameter("token_version_id"));
		param.setNiceEncData(request.getParameter("enc_data"));
		System.out.println("NICE RESULTaaa");
		Map<String, Object> resultData = niceService.getNiceApiReturn(param);
		
		model.addAttribute("name", resultData.get("name"));
		model.addAttribute("resultData", resultData);
        return ".tiles/member/apireturn";
    }
	
	
	/** 업무 포털 회원 사용 승인
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/admin/apply.do", method=RequestMethod.POST)
	public ResponseEntity applyAdminMember(
			@RequestBody MemberSaveDTO param,
			HttpServletRequest request,
			HttpSession session) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// 접수 등록 서비스 호출
		System.out.println("================>"+ param );
		String admId = memberService.applyAdminMember(param);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultSeq", admId);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	/**
     * 6자리 인증키 생성, int 반환
     * @return
     */
    public String setadmOtpNumber() {
        return String.valueOf(ThreadLocalRandom.current().nextInt(100000, 1000000));
    }
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value = "/send/email.do")
	public ResponseEntity sendEmail(HttpServletRequest request, HttpServletResponse response
			, HttpSession session
			, @RequestBody EmailSaveDTO emailSaveDTO
			, ModelMap model) throws IOException {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		JSONObject jsonObj = null;
		String resultData = "";
		
		System.out.println("이메일 센드 호출 =======>멤버 컨트롤러 > sendCallEmal impl");
		resultData = sendService.sendCallEmail(emailSaveDTO);
		System.out.println(resultData);
		
		String resultCode = "S";
		String resultStatus = "";
		String resultMessage = "";
		String status = "";
		Map<Object,Object> resultObj = new HashMap<Object, Object>();
		
		if (resultData == null) {
			resultCode = "F";
			resultObj.put("status", "9999");
			resultMessage = "발송하는 중 오류가 발생하였습니다.";
			resultStatus = "00";
			
		} else {
			
		}
		resultObj.put("message", resultMessage);
		
		// 결과 전송
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", resultCode);
		resultMap.put("resultData", resultData);
		
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
    @RequestMapping(value = {"/comapply", "/comapply.do"})
    public ResponseEntity comapply(HttpServletRequest request, HttpServletResponse response
    		, HttpSession session
    		, ModelMap model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	// 세션 확인
    	
    	
    	String cpnId = request.getParameter("cpnId");
    	String cpnStat = request.getParameter("cpnStat");
    	String resultCode ="F";
    	String resultData="";
    	
    	ComMemberVO comMemberVo = new ComMemberVO();
    	comMemberVo.setCpnId(cpnId);
    	comMemberVo.setCpnStat(cpnStat);
    	resultCode = memberService.comapply(comMemberVo);
    	
    	
    	
    	// 결과 전송
    	Map<Object,Object> resultMap = new HashMap<Object, Object>();
    	resultMap.put("resultCode", resultCode);
    	resultMap.put("resultData", resultData);
    	
    	// 한글 깨짐 방지
    	HttpHeaders responseHeaders = new HttpHeaders();
    	responseHeaders.add("Content-Type", "application/json; charset=utf-8");
    	return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
    	
    }
    
    /** OTP User Send
     * @param request
     * @param session
     * @return
     * @throws Exception
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	
	@RequestMapping(value = {"/otpUserSend", "/otpUserSend.do"})
	    public ResponseEntity otpUserSend(HttpServletRequest request, HttpServletResponse response
	    		, HttpSession session
	    		, ModelMap model) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
		// 가입 여부 체크
		System.out.println("================>진입");
		String comCode = request.getParameter("comCode");
		
		String userId = "test01";
		String userName = "김연식";
		String mobile = "01028040565";
		
		OtpMemVO otpParam = new OtpMemVO();
		otpParam.setUserId(userId);
		otpParam.setUserName(userName);
		otpParam.setMobile(mobile);
		System.out.println("================>"+ otpParam);
		String returnMsg = memberService.otpUserSend2();
		
		
		// 접수 등록 서비스 호출
    	/*String returnMsg = memberService.setAdmMember(param);*/
    	
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", returnMsg);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
    
}

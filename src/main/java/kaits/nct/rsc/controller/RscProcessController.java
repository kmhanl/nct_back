package kaits.nct.rsc.controller;

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

import com.fasterxml.jackson.core.JsonProcessingException;

import kaits.nct.common.utility.DataScrty;
import kaits.nct.expert.service.ExpertService;
import kaits.nct.common.model.EmailSaveDTO;
import kaits.nct.common.model.FileIdxVO;
import kaits.nct.common.model.SmsSaveDTO;
import kaits.nct.common.service.FileService;
import kaits.nct.common.service.SendService;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;
import kaits.nct.research.model.IntoMemDTO;
import kaits.nct.research.model.ResearchKeyVO;
import kaits.nct.research.service.ResearchMemberService;
import kaits.nct.research.service.ResearchService;
import kaits.nct.rsc.service.RscService;
import kaits.nct.rsc.model.RscMemberVO;
import kaits.nct.rsc.model.RscAnswerVO;
import kaits.nct.rsc.model.RscDataVO;
import kaits.nct.rsc.model.RscStatusVO;
import kaits.nct.common.service.FileService;
import kaits.nct.common.service.SendService;


@RestController
@RequestMapping(value = "/rsc/proc")
public class RscProcessController<RreceiptService> {
	@Value("#{global.viewerpath}")
	String viewerPath;
	
	@Value("#{prop['file.url']}")
	String filePath;

	@Autowired
	private ExpertService expertService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RscService rscService;
	
	@Autowired
	SendService sendService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST, value = "/modiCom.do")
	public ResponseEntity modiCom(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam Map<Object, Object> rscMemInfo, ModelMap model) {

		String rscMemCompany = rscMemInfo.get("rscMemCompany").toString();
		String rscMemComCode = rscMemInfo.get("rscMemComCode").toString();
		String rscMemName = rscMemInfo.get("rscMemName").toString();
		String rscMemEmail = rscMemInfo.get("rscMemEmail").toString();
		String rscInviKey = rscMemInfo.get("rscInviKey").toString();
		String rscMemCode = rscMemInfo.get("rscMemCode").toString();
		
		
		RscMemberVO member = new RscMemberVO();
		member.setRscMemCompany(rscMemCompany);
		member.setRscMemComCode(rscMemComCode);
		member.setRscMemName(rscMemName);
		member.setRscMemEmail(rscMemEmail);
		member.setRscInviKey(rscInviKey);
		member.setRscMemCode(rscMemCode);
		
		
		int updateMember = rscService.saveCompany(member);

		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultData", updateMember);

		if (updateMember  > 0) {
			// 성공
			resultMap.put("resultCode", "S");
			
		} else {
			// 실패
			resultMap.put("resultCode", "F");
		}
		resultMap.put("rscMemCode", rscMemCode);
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
			, ModelMap model) throws IOException {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		JSONObject jsonObj = null;
		String resultData = "";
		
//		try {
//			resultData = sendService.sendCommonEmail(emailSaveDTO);
//			System.out.println("aasdaa");
//		} catch (IOException e) {
//			System.out.println("aaaa");
//			e.printStackTrace();
//            return null;
//		}
		
		resultData = sendService.sendCommonEmail(emailSaveDTO);
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
			System.out.println("aasdaannnnnn");
		} else {
			System.out.println("aasdaa");
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
	
}

package kaits.nct.research.controller;

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


@RestController
@RequestMapping(value = "/research/proc")
public class ResearchProcessController<RreceiptService> {
	@Value("#{prop['file.url']}")
	String filePath;

	@Autowired
	ResearchMemberService researchMemberService;

	@Autowired
	ResearchService researchService;

	@Autowired
	FileService fileService;

	@Autowired
	SendService sendService;

	

	/**
	 * 로그인 처리
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param userInfo
	 * @param model
	 * @return
	 * @throws JsonProcessingException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST, value = "/rscMakeKey.do")
	public ResponseEntity rscMakeKey(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam Map<Object, Object> rscMemInfo, ModelMap model) {

		String rscMakekey= rscMemInfo.get("rscMakekey").toString();
		
		ResearchKeyVO makekeyin = new ResearchKeyVO();
		makekeyin.setRscMakekey(rscMakekey);
		String makekey = researchService.MakeKey(makekeyin);
//		
//    	
//		try {
//			String encPw = DataScrty.encryptPassword(rscMakekey);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace(); 
//		}
		
		
		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		
		resultMap.put("resultCode", "S");
		resultMap.put("makekey", makekey);
		
		

		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED);
	}
	
	// 현황 실태조사 임시 저장 컨트롤러
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/intoMember.do", method=RequestMethod.POST)
	public ResponseEntity intoMember(
			@RequestBody IntoMemDTO intoMemDTO
			, HttpSession session
			, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		
		// 답변 저장 
		String rscCode = researchService.InsertRscMember(intoMemDTO);
		
		// 히든 처리 저장 ResearchQuestionVO
		//answerDTO.setRscCode(rscUser.getRscCode());
		//answerDTO.setRscMemCode(rscUser.getRscMemCode());
		//String rscMemCodeHide = researchService.saveHideExtra(answerDTO);
		
		Map<Object,Object> resultMap = new HashMap<Object, Object>();
		resultMap.put("resultCode", "S");
		resultMap.put("rscCode", rscCode);
		//resultMap.put("rscMemCodeHide", rscMemCodeHide);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	
	

}

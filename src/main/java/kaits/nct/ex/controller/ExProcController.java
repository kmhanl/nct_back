package kaits.nct.ex.controller;

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

import kaits.nct.ex.model.ExInfoDataVO;
import kaits.nct.ex.service.ExService;

import kaits.nct.member.model.ComMemberVO;
import kaits.nct.member.model.MemberVO;
import kaits.nct.member.service.MemberService;

@RestController
@RequestMapping(value = "/ex/proc")
public class ExProcController {
	@Value("#{prop['file.url']}")
	String filePath;
	
	@Autowired
	ExService exService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	SendService sendService;

	/*전문위원회 > 위원회 현황  > 전문위원회 취소 처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/cancelEx.do", method=RequestMethod.POST)
	public ResponseEntity cancelEx(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("================>"+ param.getCommitteeIdx());
    	
    	exService.cancelProcEx(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/*전문위원회 > 위원회 현황  > 전문위원회 개최 처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/openEx.do", method=RequestMethod.POST)
	public ResponseEntity openEx(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("================>"+ param.getCommitteeIdx());
    	
    	exService.openProcEx(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/*전문위원회 > 위원회 현황  > 전문위원회 삭제 처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/deleteEx.do", method=RequestMethod.POST)
	public ResponseEntity deleteEx(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("================>"+ param.getCommitteeIdx());
    	
    	exService.deleteProcEx(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/*전문위원회 > 위원회 현황  > 전문위원회 개최 회수 처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/backEx.do", method=RequestMethod.POST)
	public ResponseEntity backEx(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("개최 회수================>"+ param.getCommitteeIdx());
    	
    	exService.backProcEx(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/*전문위원회 > 위원회 현황  > 전문위원회 (진행중) > 위원회 종료 처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/endEx.do", method=RequestMethod.POST)
	public ResponseEntity endEx(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("================>"+ param.getCommitteeIdx());
    	
    	exService.endProcEx(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/*전문위원회 > 위원회 현황  > 결과 도출중 > 위원회 종료 회수 처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/endBackEx.do", method=RequestMethod.POST)
	public ResponseEntity endBackEx(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("================>"+ param.getCommitteeIdx());
    	
    	exService.endBackProcEx(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/*전문위원회 > 위원회 현황  > 위원회 종료 > 기술안보과 이관  처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/sendProcExdo.do", method=RequestMethod.POST)
	public ResponseEntity sendProcExdo(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("================>"+ param.getCommitteeIdx());
    	
    	exService.sendProcExdo(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
	
	/*전문위원회 > 위원회 현황  > 결과 도출중 > 위원회 종료 회수 처리 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/returnEx.do", method=RequestMethod.POST)
	public ResponseEntity returnEx(
			@RequestBody ExInfoDataVO param
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
    	System.out.println("================>"+ param.getCommitteeIdx());
    	
    	exService.returnProcEx(param);
    	
    	
		resultData.put("admId", "test");
		resultMap.put("resultCode", "S");
		resultMap.put("resultData", resultData);
		
		// 한글 깨짐 방지
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity(resultMap, responseHeaders, HttpStatus.CREATED); 
	}
}

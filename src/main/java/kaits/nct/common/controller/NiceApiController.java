package kaits.nct.common.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kaits.nct.common.model.NiceApiVO;
import kaits.nct.common.service.NiceService;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.member.model.MemberVO;

@Controller
@RequestMapping(value="/kaits")
public class NiceApiController {
//	@RequestMapping(value="/nice/result", method = RequestMethod.GET)
//	public void getSmsResult(HttpServletRequest request, HttpSession session) throws Exception {
//		System.out.println("NICE RESULT");
//		System.out.println(request.getParameter("token_version_id"));
//		System.out.println(request.getParameter("enc_data"));
//		System.out.println(request.getParameter("integrity_value"));
//	}
	@Autowired
	NiceService niceService;

	@RequestMapping(value = {"/nice/result"})
    public String showReceiptList(HttpServletRequest request, HttpServletResponse response
            , HttpSession session
            , ModelMap model) throws Exception {
		NiceApiVO param = new NiceApiVO();
		param.setNiceAuthTokenVersionId(request.getParameter("token_version_id"));
		param.setNiceEncData(request.getParameter("enc_data"));
		
		Map<String, Object> resultData = niceService.getReturnData(param);
		
		System.out.println("NICE RESULT");
		System.out.println(resultData);
		System.out.println(request.getParameter("enc_data"));
		System.out.println(request.getParameter("integrity_value"));
    	
        return ".tiles/member/joinagreereturn";
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
	
}

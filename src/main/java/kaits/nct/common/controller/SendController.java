package kaits.nct.common.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/directsend")
public class SendController {
	@Value("#{prop['log.url']}")
	String logUrl;
	@RequestMapping(value="/sms/result")
	public void getSmsResult(HttpServletRequest request, HttpSession session) throws Exception {
		// SMS API Return_url 샘플 예제입니다.
	    // return값을 전달받아 기록할 log 위치를 지정합니다. 
	    // ResultCode - 0 : 성공 / 2,5,7 : 네트워크에러 / 4 :잘못된번호 / 6 : 음영지역 / 9 : 번호도용 문자차단 / 20 : 수신거부 / 21 : 90byte초과 / 1,3,8,10,11,12,13,14,15,99 : 기타

		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
		String today = sf.format(now);
		String FilePath = logUrl + "sms.log";  // 절대경로
		  
		File f = new File(FilePath);  

		if (!f.exists()) {
			f.createNewFile();
		}

		// 파일쓰기
		FileWriter fw = new FileWriter(f.getAbsoluteFile(), true); 
		BufferedWriter bw = new BufferedWriter(fw);

		String data = ""; 
		String input = null;

		StringBuilder buffer = new StringBuilder();
		BufferedReader reader = request.getReader();

		String line;
		while((line = reader.readLine()) != null){
			buffer.append(line);
		}

		input = buffer.toString();

		data = "[Time : " + today + "] ";
		fw.write(data);

		data = "[Sending result : {";
		fw.write(data);

		fw.write(input);

		data = "}]\r\n";

		fw.write(data);

		fw.close();
	}
	
	@RequestMapping(value="/otp/userSend")
	public void userSend(HttpServletRequest request, HttpSession session) throws Exception {
		
	}
}

package kaits.nct.ex.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("exSendDataVO")
public class ExSendDataVO {
	private String committeeIdx;
	private String committeeTechId;
	private String committeeTechName;
	private String committeeYear;
	private String committeeNum;
	private String committeeTechNum;
	private String memInYn;
	
	private int committeeAgdCnt;
	private int committeeAmg03Cnt;
	private int committeeAmg04Cnt;
	private int committeeAmg05Cnt;
	private int committeeAmg06Cnt;
	private String committeeType;
	
	private int committeeOptYCnt;
	private int committeeOptNCnt;
	
	private int committeeOptYPw;
	private int committeeOptYIm;
	private int committeeOptYSe;
	
	private int committeeOptNPw;
	private int committeeOptNIm;
	private int committeeOptNSe;
	
}

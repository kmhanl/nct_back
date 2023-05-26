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
@Alias("exInfoDataVO")
public class ExInfoDataVO {
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
	
	private String committeeDatePickS;
	private String committeeDatePickSKo;
	private String committeeDatePickE;
	private String committeeDatePickEKo;
	private String dateCheckYn;
	
	private String committeeDatePick1;
	private String committeeDatePick1Ko;
	private String committeeDateAdd1;
	private String committeeDatePick2;
	private String committeeDatePick2Ko;
	private String committeeDateAdd2;
	private String committeeDatePick3;
	private String committeeDatePick3Ko;
	private String committeeDateAdd3;
	
	private String committeeDatePick;
	private String committeeDatePickKo;
	private String committeeModiS;
	private String committeeModiSKo;
	private String committeeModiE;
	private String committeeModiEKo;
	private String committeeStatus;
	private String committeeConfirmYn;
	
	private String lastUpdt;
	private String lastUpdt8Ko;
	
	private String lastUpdusrId;
	
}

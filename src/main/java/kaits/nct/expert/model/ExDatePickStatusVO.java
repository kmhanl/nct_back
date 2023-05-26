package kaits.nct.expert.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("exDatePickStatusVO")
public class ExDatePickStatusVO {
	private String committeeIdx;
	private String admId;
	private String committeeDatePick;
	private String committeeDatePickCnt;
	private String committeeDatePick1;
	private String committeeDatePick1Cnt;
	private String committeeDatePick2;
	private String committeeDatePick2Cnt;
	private String committeeDatePick3;
	private String committeeDatePick3Cnt;
	private String committeeDatePick4;
	private String committeeDatePick4Cnt;
	private String committeeDatePickEtc;
	private String committeeDatePickEtcDispKo;
	private String admGroup;
	private String admName;
	private String admDept;
	private String admPositon;
	private String admCom;
	private String admMobile;
	private String admMobile1;
	private String admMobile2;
	private String admMobile3;
	private String admEmail;
	
}

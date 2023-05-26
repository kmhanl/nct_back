package kaits.nct.expert.model;

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
@Alias("expertCommitteeOpinionVO")
public class ExpertCommitteeOpinionVO {
	private String committeeIdx;
	private String agdCode;
	private String committeeAdmId;
	private String committeeOptType;
	private String committeeOpt01;
	private String committeeOpt02;
	private String committeeOpt03;
	private String committeeOpt04;
	private String committeeOpt05;
	private String committeeOpt06;
	private String committeeOpt07;
	private String committeeOpt08;
	private String committeeOptGeneral;
	private String committeeOptFlag;
	private String techItemId;
	private String committeeOptStatus;
	private int committeeOptStatusCount;
}

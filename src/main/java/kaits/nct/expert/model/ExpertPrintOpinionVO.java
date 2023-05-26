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
@Alias("expertPrintOpinionVO")
public class ExpertPrintOpinionVO {
	private String committeeIdx;
	private String agdCode;
	private String agdExIdx;
	private String agdExSort;
	private String agdViewCode;
	private String rcptMetaCode;
	private String rcptTypeCode;
	private String rcptCode;
	private String rcptComCode;
	private String cpnNm;
	private String admGroup;
	private String admName;
	private String committeeAdmId;
	private String committeeSignView;
	private String committeeSignWrite;
	private String committeeSignSave;
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

}

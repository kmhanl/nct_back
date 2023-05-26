package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("smsVO")
public class SmsVO {
	private String smsHisId;
	private String committeeIdx;
	private String smsHisMode;
	private String smsHisType;
	private String smsHisTit;
	private String smsHisMsg;
	private String smsHisName;
	private String smsHisCom;
	private String smsHisPhone;
	private String smsHisRdate;
	private String smsHisStatus;
	private String smsHisStatusMsg;
	private String smsHisDirectSendStatus;
	private String smsRegDate;
	private String smsRegId;
	private String smsUpdateDate;
	private String smsUpdateId;
}

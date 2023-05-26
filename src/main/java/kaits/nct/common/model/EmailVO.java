package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("emailVO")
public class EmailVO {
	private String emailHisId;
	private String emailHisCode;
	private String emailcommitteeIdx;
	private String emailHisMode;
	private String emailHisType;
	private String emailHisTemp;
	private String emailHisSender;
	private String emailHisSenderName;
	private String emailHisUserName;
	private String emailHisSubject;
	private String emailHisBody;
	private String emailHisName;
	private String emailHisCom;
	private String emailHisEmail;
	private String emailHisRdate;
	private String emailHisStatus;
	private String emailHisStatusMsg;
	private String emailHisDirectSendStatus;
	
	private String emailSendNote1;
	private String emailSendNote2;
	private String emailSendNote3;
	private String emailSendNote4;
	private String emailSendNote5;
	
	
	private String emailRegDate;
	private String emailRegId;
	private String emailUpdateDate;
	private String emailUpdateId;
	private String emailInviKey;
	
}

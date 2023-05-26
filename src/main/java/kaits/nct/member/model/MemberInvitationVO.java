package kaits.nct.member.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("memberInvitationVO")
public class MemberInvitationVO {
	private String admInviId;
	private String admInviGroup;
	private String admInviName;
	private String admInviMobile1;
	private String admInviMobile2;
	private String admInviMobile3;
	private String admInviEmail;
	private String admInviCarYear;
	private String admInviCarNum;
	private String admInviSamu;
	private String admInviProYn;
	private String admInviSaveYn;
	private String admInviSubYn;
	private String admInviRegDate;
	private String admInviRegDate10;
	private String admInviStat;
	private String admInviStatNm;
	
	
	
	
	
	
	private int pageNo;
	private int startNo;
	private int pageRows;
	private int totalPage;
	private int totalRows;
	
	public void setPageInit() {
		pageNo = 1;
		pageRows = 10;
	}
}

package kaits.nct.member.model;

import org.jetbrains.annotations.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Alias("memberVO")
public class MemberVO {
	@NotNull
	private String admId;
	private String admGroup;
	private String admName;
	@NotNull
	private String admPassword;
	private String admCom;
	private String admDept;
	private String admPositon;
	private String admZip;
	private String admAdd1;
	private String admAdd2;
	private String admPhone1;
	private String admPhone2;
	private String admPhone3;
	private String admFax1;
	private String admFax2;
	private String admFax3;
	private String admMobile1;
	private String admMobile2;
	private String admMobile3;
	private String admEmail;
	private String admDnValue;
	private String admCarYear;
	private String admCarNum;
	private String admSamu;
	private String admProYn;
	private String admSaveYn;
	private String admSubYn;
	private String admInviYn;
	private String admInviKey;
	
	private String admStempFile;
	private String admStempOrigin;
	private String admRegDate;
	private String admRegDate10;
	private String admStat;
	private String admStatNm;
	private String admApproval1;
	private String admApproval2;
	private String admLastAcc;
	private String admOtpNumber;
	
	private String admAuthTech;
	private String cpnId;
	
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

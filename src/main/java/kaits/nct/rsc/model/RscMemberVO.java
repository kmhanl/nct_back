package kaits.nct.rsc.model;

import org.jetbrains.annotations.NotNull;

import kaits.nct.research.model.ResearchVO;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("rscMemberVO")
public class RscMemberVO {
	private String rscMemCode;
	private String rscCode;
	private String rscInviKey;
	private String rscMemCompany;
	private String rscMemComCode;
	private String rscMemName;
	private String rscMemPhone;
	private String rscMemEmail;
	private String rscMemPassword;
	private String rscMemDi;
	private String rscMemo;
	private String rscStrDate;
	private String rscStrDate8Ko;
	private String rscEndDate;
	private String rscEndDate8Ko;
	private String rscStatus;
	private String rscStatusNm;
	
	private String rscStatusCom1;
	private String rscStatusCom2;
	private String rscStatusCom3;
	private String rscStatusCom4;
	private String rscStatusInvestigate1;
	private String rscStatusInvestigate2;
	private String rscStatusInvestigate3;
	private String rscStatusInvestigate4;
	private String rscStatusInvestigate5;
	private String rscStatusInvestigate6;
	private String rscStatusInvestigate7;
	private String rscStatusRegistration1;
	private String rscStatusRegistration2;
	private String rscStatusRegistration3;
	private String rscStatusRegistration4;
	private String rscStatusSurvey;
	private String rscIntoFlag;

	
	// 리스트 페이징 변수 
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

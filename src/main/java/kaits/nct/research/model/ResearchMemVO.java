package kaits.nct.research.model;

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
@Alias("researchMemVO")
public class ResearchMemVO {
	@NotNull
	private String rscInviKey;
	private String rscCode;
	
	private String rscMemPhone;
	private String rscMemPassword;
	private String rscMemCode;
	
	private String rscMemName;
	private String rscMemCompany;
	private String rscMemComCode;
	private String rscMemDi;
	
	private String rscMemPhone1;
	private String rscMemPhone2;
	private String rscMemPhone3;
	private String rscMemEmail;
	private String rscMemText;
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

}



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
@Alias("rscDataVO")
public class RscDataVO {
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
	private String rscStatus_registration1;
	private String rscStatus_registration2;
	private String rscStatus_registration3;
	private String rscStatus_registration4;
	private String rscStatusSurvey;
	private String rscIntoFlag;
	
	private String rscTargetComName;
	private String rscTargetComYear;
	private String rscTargetRegiNum;
	private String rscTargetAddPost;
	private String rscTargetAdd1;
	private String rscTargetAdd2;
	private String rscTargetComType;
	private String rscTargetComVol;
	private String rscTargetPay1;
	private String rscTargetPay2;
	private String rscTargetPay3;
	private String rscTargetTech1;
	private String rscTargetTech2;
	private String rscTargetTech3;
	private String rscTargetTech4;
	private String rscTargetTech5;
	private String rscTargetTech6;
	private String rscTargetTech7;
	private String rscTargetTech8;
	private String rscTargetTech9;
	private String rscTargetTech10;
	private String rscTargetTech11;
	private String rscTargetTech12;
	private String rscTargetTech13;
	private String rscTargetCharacter1;
	private String rscTargetCharacter2;
	private String rscTargetCharacter3;
	private String rscTargetCharacter4;
	private String rscTargetCharacterEtc;
	private String rscCrew01Name;
	private String rscCrew01Depth;
	private String rscCrew01Position;
	private String rscCrew01Phone;
	private String rscCrew01Mobile;
	private String rscCrew01Email;
	private String rscCrew02Name;
	private String rscCrew02Depth;
	private String rscCrew02Position;
	private String rscCrew02Phone;
	private String rscCrew02Mobile;
	private String rscCrew02Email;
	private String rscCrew03Name;
	private String rscCrew03Depth;
	private String rscCrew03Position;
	private String rscCrew03Phone;
	private String rscCrew03Mobile;
	private String rscCrew03Email;
	private String rscComMem1;
	private String rscComMem2;
	private String rscComMem3;
	private String rscComMem4;
	
	
	
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

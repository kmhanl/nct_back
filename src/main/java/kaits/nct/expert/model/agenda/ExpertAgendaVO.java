package kaits.nct.expert.model.agenda;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Alias("expertAgendaVO")
public class ExpertAgendaVO {
	private int index;
	@NotNull
	private String rcptIdx;
	@NotNull
	private String agdIdx;
	private String rcptMetaCode;
	private String techId;
	private String agdTypeCode;
	private String agdTypeCodeNm;
	private String agdCompanyNm;
	private String agdRegiNum;
	private String agdCompanyCeo;
	private String agdCompanyAdd;
	private String agdCompanyPhone;
	private String agdCompanyBAdd;
	private String agdCompanyBPhone;
	private String agdPmName;
	private String agdPmDept;
	private String agdPmPosition;
	private String agdPmPhone1;
	private String agdPmPhone2;
	private String agdPmPhone3;
	private String agdPmMobile1;
	private String agdPmMobile2;
	private String agdPmMobile3;
	private String agdPmEmail;
	private String agdTechForm;
	private String agdExReasonSale;
	private String agdExReasonSCom;
	private String agdExReasonTrans;
	private String agdExReasonTCom;
	private String agdExReasonEtc;
	private String agdExReasonECom;
	private String agdExDate;
	private String agdTechQua;
	private String agdReason;
	private String agdLaw01;
	private String agdLaw02;
	private String agdLaw03;
	private String agdRegId;
	private String agdRegDate;
	private String agdRegDateStr;
	private String agdStatus;
	private String agdStatusNm;
	private String agdStatusCode;
	private String agdStatusLast;
	private String agdStatusLastStr;
	private String agdExIdx;
	private String agdFixDate;
	private String agdAdmYn;
	private String techName;
	private String techItemName;
	private String techRcptTechNm;
	
	private String admGroup;
	private String admId;
	
	private String agdType;
	
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

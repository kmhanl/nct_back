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
@Alias("expertAgendaStatVO")
public class ExpertAgendaStatVO {
	private int index;
	private String sortType;
	@NotNull
	private String rcptCode;
	@NotNull
	private String agdCode;
	private String agdViewCode;
	private String agdTechId;
	private String agdExIdx;
	private String rcptMetaCode;
	private String agdStatus;
	private String agdStatusName;
	private String agdStatusCode;
	private String agdStatusLast;
	private String agdStatusLastStr;
	private String agdRegId;
	private String agdRegDate;
	private String agdRegDateStr;
	private String rcptTypeCode;
	private String rcptTypeCodeName;
	private String rcptComCode;
	private String rctpReYn;
	private String rctpReCode;
	private String rcptTechForm;
	private String rcptExReasonSale;
	private String rcptExReasonSCom;
	private String rcptExReasonTrans;
	private String rcptExReasonTCom;
	private String rcptExReasonEtc;
	private String rcptExReasonECom;
	private String rcptExDate;
	private String rcptTechQua;
	private String rcptReason;
	private String rcptLaw01;
	private String rcptLaw02;
	private String rcptLaw03;
	private String cpnSNo;
	private String cpnBNo;
	private String cpnNm;
	private String cpnCeo;
	private String cpnBZip;
	private String cpnBAdd1;
	private String cpnBAdd2;
	private String cpnBPhone1;
	private String cpnBPhone2;
	private String cpnBPhone3;
	private String cpnBFax1;
	private String cpnBFax2;
	private String cpnBFax3;
	private String cpnDutyCode;
	private String cpnSZip;
	private String cpnSAdd1;
	private String cpnSAdd2;
	private String cpnSPhone1;
	private String cpnSPhone2;
	private String cpnSPhone3;
	private String cpnPNm;
	private String cpnPDept;
	private String cpnPPosition;
	private String cpnPPhone1;
	private String cpnPPhone2;
	private String cpnPPhone3;
	private String cpnPMobile1;
	private String cpnPMobile2;
	private String cpnPMobile3;
	private String cpnPEmail;
	private String techName;
	private String techItemName;
	private String techRcptTechNm;
	
	private String admGroup;
	private String admId;
	
	private String agdType;
	
	private String finalOpinionYn;
	private String agdExStatus;
	
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

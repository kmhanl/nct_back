package kaits.nct.expert.model.receipt;

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
@Alias("expertReceiptVO")
public class ExpertReceiptVO {
	private int index;
	@NotNull
	private String rcptCode;
	private String rcptIdx;
	private String rcptMetaCode;
	private String rcptTypeCode;
	private String rcptTypeCodeNm;
	private String rcptComCode;
	private String rcptComType;
	private String rcptComTypeNm;
	private String rcptCompanyNm;
	private String rcptRegiNum;
	private String rcptCompanyCeo;
	private String rcptCompanyPost;
	private String rcptCompanyAdd;
	private String rcptCompanyAdd2;
	private String rcptCompanyPhone;
	private String rcptCompanyPhone1;
	private String rcptCompanyPhone2;
	private String rcptCompanyPhone3;
	private String rcptCompanyBPost;
	private String rcptCompanyBAdd;
	private String rcptCompanyBAdd2;
	private String rcptCompanyBPhone;
	private String rcptCompanyBPhone1;
	private String rcptCompanyBPhone2;
	private String rcptCompanyBPhone3;
	private String rcptPmName;
	private String rcptPmDept;
	private String rcptPmPosition;
	private String rcptPmPhone1;
	private String rcptPmPhone2;
	private String rcptPmPhone3;
	private String rcptPmMobile1;
	private String rcptPmMobile2;
	private String rcptPmMobile3;
	private String rcptPmEmail;
	private String rcptTechForm;
	private String rcptExReasonSale;
	private String rcptExReasonSCom;
	private String rcptExReasonTrans;
	private String rcptExReasonTCom;
	private String rcptExReasonEtc;
	private String rcptExReasonECom;
	private String rcptExDate;
	private String rcptExDate10;
	private String rcptTechQua;
	private String rcptReason;
	private String rcptLaw01;
	private String rcptLaw02;
	private String rcptLaw03;
	private String rcptRegId;
	private String rcptRegDate;
	private String rcptRegDate10;
	private String rcptRegDateStr;
	private String rcptStatus;
	private String rcptStatusNm;
	private String rcptStatusCode;
	private String rcptView;
	private String rcptAView;
	private String agdAdmYn;
	private String rcptReYn;
	private String rcptReCode;
	private String rcptStatusLast;
	private String rcptStatusLast10;
	private int rcptAgendaCnt;
	private String rcptFixDate;
	private String techName;
	private String techItemName;
	private String techRcptTechNm;
	
	private String admGroup;
	private String admId;
	private String admIpAddress;
	
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

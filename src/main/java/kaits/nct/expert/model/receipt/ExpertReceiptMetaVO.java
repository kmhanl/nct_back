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
@Alias("expertReceiptMetaVO")
public class ExpertReceiptMetaVO {
	private int index;
	@NotNull
	private String rcptMetaCode;
	private String rcptTypeCode;
	private String rcptComCode;
	private String rcptComTypeNm;
	private String rcptReYn;
	private String rcptReCode;
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
	private String rcptStatusLast;
	
	public ExpertReceiptMetaVO(ExpertReceiptVO receipt) {
		this.rcptTypeCode = receipt.getRcptTypeCode();
		this.rcptComCode = receipt.getRcptComCode();
		this.rcptComTypeNm = receipt.getRcptComTypeNm();
		this.rcptReYn = receipt.getRcptReYn();
		this.rcptReCode = receipt.getRcptReCode();
		this.rcptTechForm = receipt.getRcptTechForm();
		this.rcptExReasonSale = receipt.getRcptExReasonSale();
		this.rcptExReasonSCom = receipt.getRcptExReasonSCom();
		this.rcptExReasonTrans = receipt.getRcptExReasonTrans();
		this.rcptExReasonTCom = receipt.getRcptExReasonTCom();
		this.rcptExReasonEtc = receipt.getRcptExReasonEtc();
		this.rcptExReasonECom = receipt.getRcptExReasonECom();
		this.rcptExDate = receipt.getRcptExDate();
		this.rcptTechQua = receipt.getRcptTechQua();
		this.rcptReason = receipt.getRcptReason();
		this.rcptLaw01 = receipt.getRcptLaw01();
		this.rcptLaw02 = receipt.getRcptLaw02();
		this.rcptLaw03 = receipt.getRcptLaw03();
		this.rcptStatusLast = receipt.getRcptStatusLast();
	}
}

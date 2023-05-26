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
@Alias("expertReceiptStatVO")
public class ExpertReceiptStatVO {
	private int index;
	@NotNull
	private String rcptCode;
	private String rcptComType;
	private String rcptComCode;
	private String rcptMetaCode;
	private String rcptStatus;
	private String rcptStatusCode;
	private String rcptView;
	private String rcptAView;
	private String agdAdmYn;
	private String rcptReYn;
	private String rcptReCode;
	private String rcptRegId;
	private String rcptRegDate;
	private String rcptStatusLast;
	private String rcptStatusLastId;
	private int rcptAgendaCnt;
	private String rcptFixDate;
	
	public ExpertReceiptStatVO(ExpertReceiptVO receipt) {
		this.rcptComType = receipt.getRcptComType();
		this.rcptComCode = receipt.getRcptComCode();
		this.rcptStatus = receipt.getRcptStatus();
		this.rcptStatusCode = receipt.getRcptStatusCode();
		this.rcptView = receipt.getRcptView();
		this.rcptAView = receipt.getRcptAView();
		this.agdAdmYn = receipt.getAgdAdmYn();
		this.rcptReYn = receipt.getRcptReYn();
		this.rcptReCode = receipt.getRcptReCode();
		this.rcptRegId = receipt.getRcptRegId();
		this.rcptRegDate = receipt.getRcptRegDate();
		this.rcptStatusLast = receipt.getRcptStatusLast();
		this.rcptStatusLastId = receipt.getAdmId();
	}
}

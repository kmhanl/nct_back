package kaits.nct.expert.model.receipt;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@Alias("expertReceiptHistoryVO")
public class ExpertReceiptHistoryVO {
	@NotNull
	private String rcptIdx;
	private String hisCode;
	private String hisRcptStatus;
	private String hisRcptStatusNm;
	private String hisGid;
	private String hisTechType;
	private String hisComment;
	private String admDept;
	private String admName;
	private String hisRegId;
	private String hisRegIp;
	private String hisRegDt;
	private String hisRegDtStr;
}

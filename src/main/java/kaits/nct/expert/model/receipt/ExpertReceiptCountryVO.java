package kaits.nct.expert.model.receipt;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Alias("expertReceiptCountryVO")
public class ExpertReceiptCountryVO {
	@NotNull
	private String rcptIdx;
	private String rcptMetaCode;
	private int ctyRcptNumSeq;
	private String ctyTargetCountry;
	private String ctyTargetCountryName;
	private String ctyBuyer;
}

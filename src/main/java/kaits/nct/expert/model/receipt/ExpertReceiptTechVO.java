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
@Alias("expertReceiptTechVO")
public class ExpertReceiptTechVO {
	@NotNull
	private String rcptCode;
	private String rcptIdx;
	private String rcptMetaCode;
	private int techRcptNumSeq;
	private String techNtcGid;
	private String techNctCode;
	private String techUniqId;
	private String techRcptTechNm;
	private String techRegId;
	private String techName;
	private String techItemName;
	
	private boolean isCompetence;
}

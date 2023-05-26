package kaits.nct.expert.model.receipt;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expertReceiptGroupVO")
public class ExpertReceiptGroupVO {
	private String rcptStatus;
	private int rcptStatusCount;
}

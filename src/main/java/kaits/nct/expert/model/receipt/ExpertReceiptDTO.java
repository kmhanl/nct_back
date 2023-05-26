package kaits.nct.expert.model.receipt;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ExpertReceiptDTO {
	private String rcptIdx;
	private List<String> techList;
	
	private String userId;
}

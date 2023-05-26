package kaits.nct.expert.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpertCommitteeMemberSaveDTO {
	private String userId;
	private String committeeIdx;
	private String committeeTechId;
	private List<String> checkList;
	private List<String> noCheckList;
}

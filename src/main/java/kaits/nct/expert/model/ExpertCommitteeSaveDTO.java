package kaits.nct.expert.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpertCommitteeSaveDTO {
	private String userId;
	private ExpertCommitteeVO committeeData;
	private List<String> committeeAgendaList;
	private List<ExpertCommitteeMemberVO> committeeMemberList;
	private List<ExpertCommitteeOpinionVO> committeeOpinionList;
}

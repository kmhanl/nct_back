package kaits.nct.expert.model.agenda;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpertAgendaModifyDTO {
	private String userId;
	private String committeeIdx;
	private List<String> exList;
	private List<String> noExList;
}

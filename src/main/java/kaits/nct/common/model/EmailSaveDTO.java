package kaits.nct.common.model;

import java.util.List;

import kaits.nct.expert.model.ExpertCommitteeSaveDTO;
import kaits.nct.expert.model.ExpertCommitteeVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailSaveDTO {
	private EmailVO emailInfo;
	private EmailVO emailTemp;
	private EmailVO emailCode;
	private List<EmailVO> emailList;
}

package kaits.nct.research.model;

import java.util.List;

import kaits.nct.common.model.FileToVO;
//import kaits.nct.receipt.model.ExpertAgendaStatVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IntoMemDTO {
	private String rscCode;
	private String rscMemCode;
	
	private List<IntoMemVO> intoRscMemList;
	
	
}

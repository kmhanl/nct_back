package kaits.nct.expert.model.receipt;

import java.util.List;

import kaits.nct.common.model.FileToVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpertReceiptSaveDTO {
	private String userId;
	private String rcptIdx;
	private String metaCode;
	private ExpertReceiptVO receiptData;
	private List<ExpertReceiptTechVO> receiptTechList;
	private List<ExpertReceiptCountryVO> receiptCountryList;
	private List<ExpertAgendaStatVO> receiptLinkAgdList;
	private List<FileToVO> fileList;
}

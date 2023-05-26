package kaits.nct.receipt.model;

import java.util.List;

import kaits.nct.common.model.FileToVO;
//import kaits.nct.receipt.model.ExpertAgendaStatVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReceiptSaveDTO {
	private String userId;
	private String rcptIdx;
	private String metaCode;
	private ReceiptVO receiptData;
	private List<ReceiptTechVO> receiptTechList;
	private List<ReceiptCountryVO> receiptCountryList;
	//private List<ExpertAgendaStatVO> receiptLinkAgdList;
	private List<FileToVO> fileList;
}

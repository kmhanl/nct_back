package kaits.nct.exp.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import kaits.nct.common.model.FileToVO;
import kaits.nct.common.model.NctUploadFileVO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpRecSaveDTO {
	private String admGroup;
	private String userId;
	private String admIp;
	private String nctIdx;
	private String metaCode;
	private String metaDateTime;
	private ExpMetaVO recMetaData;
	private List<ExpRecTechVO> recTechList;
	private List<ExpRecConturyVO> recCountryList;
	//private List<ExpertAgendaStatVO> receiptLinkAgdList;
	private List<FileToVO> fileList;
}

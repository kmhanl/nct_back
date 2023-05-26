package kaits.nct.research.model;

import java.util.List;

import org.jetbrains.annotations.NotNull;

import kaits.nct.common.model.FileToVO;
//import kaits.nct.receipt.model.ExpertAgendaStatVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EndFileVO {
	private String fileIdx;
	private String fileCode;
	private String fileDepth;
	private String fileType;
	private String fileSort;
	private String fileAgdIdx;
	private String fileView;
	private String fileRegId;
	
	private String fileNm;
	private String fileOriginNm;
	private String filePath;
	private String fileSize;
	private String fileKey;
}

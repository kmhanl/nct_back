package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("fileIdxVO")
public class FileIdxVO {
	private int fileIdx;
	private String fileCode;
	private String fileDepth;
	private String fileType;
	private String fileSort;
	private String fileAgdIdx;
	private String fileView;
	private String fileRegId;
	private String fileRegDate;
}

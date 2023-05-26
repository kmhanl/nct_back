package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("fileMstVO")
public class FileMstVO {
	private String fileCode;
	private String fileNm;
	private String fileOriginNm;
	private String filePath;
	private String fileSize;
	private String fileKey;

}

package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("nctFileMetaVO")
public class NctFileMetaVO {
	private String nctFileMeta;
	private String nctFileName;
	private String nctFileOriginNm;
	private String nctFilePath;
	private String nctFileSize;
	private String nctFileKey;
}

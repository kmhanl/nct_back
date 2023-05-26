package kaits.nct.exp.model;


import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("expLoadFileVO")
public class ExpLoadFileVO {
	@NotNull
	private String nctUseCode;
	private String nctRecCode;
	private String nctAgdCode;
	private String nctFileMeta;
	private String nctFileType;
	private String nctFileSort;
	private String nctFileView;
	private String nctFileRegId;
	private String nctFileRegDate;
	private String nctFileRegDateView;
	private String nctFileName;
	private String nctFileExt;
	private String nctFileOriginNm;
	private String nctFilePath;
	private String nctFileSize;
	private String nctFileKey;
}

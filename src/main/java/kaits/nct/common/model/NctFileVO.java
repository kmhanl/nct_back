package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("nctFileVO")
public class NctFileVO {
	
	private int fileIdx;
	
	private String nctFileIdx;
	private String nctFileMeta;
	private String nctFileType;
	private String nctFileSort;
	private String nctUseCode;
	private String nctFileView;
	private String nctFileRegId;
	private String nctFileRegDate;
	
}

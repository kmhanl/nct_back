package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expRecUpdateVO")
public class ExpRecUpdateVO {
	
	private String nctRecCode;
	private String nctMetaCode;
	
	private String nctRecExCnt;
	private String nctRecEXEnCtn;
	
	private String nctRecStatus;
	private String nctRecStatusLast;
	private String nctRecStatusLastId;
	
}

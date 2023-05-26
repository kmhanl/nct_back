package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expRecConturyVO")
public class ExpRecConturyVO {
	
	private String nctIdx;
	private String nctRecCode;
	private String nctMetaCode;
	private String conName;
	
	private String nctCtySort;
	private String nctCtyCode;
	private String nctCtyBuyer;
	
	
}

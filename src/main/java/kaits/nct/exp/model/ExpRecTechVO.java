package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expRecTechVO")
public class ExpRecTechVO {
	
	private String nctIdx;
	private String nctRecCode;
	
	private String nctMetaCode;
	private String techId ;
	private int techIdCnt;
	private String techName ;
	
	private String nctMetaTechSort;
	private String techNtcGid;
	private String techUniqId;
	private String techNctCode;
	private String nctMetaTechNm ;
	
	private String techItemName;
	
	
}

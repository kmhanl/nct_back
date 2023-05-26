package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expListTechVO")
public class ExpListTechVO {
	
	private String nctRecCode;
	private String techNctCode;
	private String nctMetaCode;
	private String techId ;
	private int techIdCnt;
	private String techName ;
	private String nctMetaTechNm ;
	private String nctMetaTechSort;
	private String techUniqId;
	private String techItemName;
	
	
}

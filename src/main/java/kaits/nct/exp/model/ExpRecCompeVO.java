package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expRecCompeVO")
public class ExpRecCompeVO {
	
	private String nctRecCode;
	private String nctTechCode;
	private String nctComRegiId;
	private String nctComRegiDt;
	private String nctComRegiDtView;
	
}

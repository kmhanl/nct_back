package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expRecHistoryVO")
public class ExpRecHistoryVO {
	
	private String nctRecCode;
	private String nctRecHisCode;
	private String nctRecStatus;
	private String hisAmgGruop;
	private String hisComment;
	private String hisRegId;
	private String hisRegDt;
	private String hisRegIp;
	private String hisRegDtView;
	
	
}

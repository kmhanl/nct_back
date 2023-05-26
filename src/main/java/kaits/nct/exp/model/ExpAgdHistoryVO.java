package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expAgdHistoryVO")
public class ExpAgdHistoryVO {
	
	private String nctAgdCode;
	private String nctAgdHisCode;
	private String nctAgdStatus;
	private String hisAmgGruop;
	private String hisComment;
	private String hisRegId;
	private String hisRegDt;
	private String hisRegIp;
	private String hisRegDtView;
	
	
}

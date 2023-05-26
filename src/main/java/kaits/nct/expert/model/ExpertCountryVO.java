package kaits.nct.expert.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expertCountryVO")
public class ExpertCountryVO {
	private String conId;
	private String conCode;
	private String conName;
	private String conInfo;
	private String conUseYn;
	private String conReg;
	private String conRegId;
	private String conUpdate;
	private String conUpdateId;
	
	private boolean isCompetence;
}

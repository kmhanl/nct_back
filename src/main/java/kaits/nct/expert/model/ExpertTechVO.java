package kaits.nct.expert.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expertTechVO")
public class ExpertTechVO {
	private String techId;
	private String techName;
	private int techSort;
	private String techDelYn;
	private String techShwYn;
	private String techUseYn;
	private String techReg;
	private String techRegId;
	private String techUpdate;
	private String techUpdateId;
	
	private boolean isCompetence;
}

package kaits.nct.expert.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expertTechItemVO")
public class ExpertTechItemVO {
	private String techItemId;
	private String techNtcGid;
	private String techId;
	private String techItemName;
	private int techItemSort;
	private String techItemMemo;
	private String techItemDelYn;
	private String techTechItemShwYn;
	private String techItemReg;
	private String techItemRegId;
	private String techItemUpdate;
	private String techItemUpdateId;
	
	private boolean isCompetence;
}

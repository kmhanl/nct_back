package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expNctTechVO")
public class ExpNctTechVO {
	
	private String techId;
	private String techNtcGid;
	private String techNtcShwYn;
	private String techNtcUseYn;
	private String techName;
	private String techSort;
	private String techItemId;
	private String techItemName;
	private String techItemSort;
	
	
	private String admId;
	private String admAuthId;
	
	
	
	private String techItemMemo;
	private String techItemDelYn;
	private String techItemShwYn;
	private String techItemReg;
	private String techItemRegId;
	private String techItemUpdate;
	private String techItemUpdateId;
	
	
	
}

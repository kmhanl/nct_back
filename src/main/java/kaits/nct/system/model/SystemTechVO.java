package kaits.nct.system.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("systemTechVO")
public class SystemTechVO {
	
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
	
	private int pageNo;
	private int startNo;
	private int pageRows;
	private int totalPage;
	private int totalRows;
	
	public void setPageInit() {
		pageNo = 1;
		pageRows = 10;
	}
}

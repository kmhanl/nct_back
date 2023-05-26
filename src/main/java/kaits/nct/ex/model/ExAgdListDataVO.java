package kaits.nct.ex.model;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("exAgdListDataVO")
public class ExAgdListDataVO {
	
	private String committeeIdx;
	private String agdCode;
	private String agdViewCode;
	private String rcptMetaCode;
	
	private String rcptTypeCode;
	private String rcptCode;
	private String rcptComCode;
	private String cpnNm;
	private String rctpReYn;
	private String rctpReCode;
	private String rcptTitle;
	private String rcptTechForm;
	
	
	private String agdTechId;
	private String agdExIdx;
	private String agdExSort;
	private String agdStatus;
	
	private String techUniqId;
	private String techItemMemo;
	private String techrcptTechNm;

	
	
}

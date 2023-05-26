package kaits.nct.expert.model.agenda;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("expertAgendaTechVO")
public class ExpertAgendaTechVO {
	
	private String techItemId;
	private String techNtcGid;
	private String techId;
	private String techItemName;
	private String techItemSort;
	private String techItemMemo;
	
}

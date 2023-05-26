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
@Alias("expertAgendaListVO")
public class ExpertAgendaListVO {
	private String committeeIdx;
	private String committeeAdmId;
	
	private String agdCode;
	private String agdViewCode;
	private String agdExSort;
	private String rcptMetaCode;
	private String rcptTypeCode;
	
	private String rcptCode;
	private String rcptComCode;
	private String cpnNm;
	
	private String techUniqId;
	private String techRcptTechNm;
	
	private String committeeOptStatus;
}

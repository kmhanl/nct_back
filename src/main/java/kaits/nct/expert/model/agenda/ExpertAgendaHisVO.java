package kaits.nct.expert.model.agenda;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("expertAgendaHisVO")
public class ExpertAgendaHisVO {
	private String agdIdx;
	private String hisCode;
	private String hisRcptStatus;
	private String hisRegId;
	private String hisRegIp;
	private String hisRegDt;
	
}

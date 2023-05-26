package kaits.nct.expert.model.agenda;

import java.util.List;

import org.apache.ibatis.type.Alias;

import kaits.nct.common.model.FileToVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("expertAgendaDTO")
public class ExpertAgendaDTO {
	private List<String> receiptIdxList;
	private List<String> techList;
	private List<FileToVO> fileList;
}

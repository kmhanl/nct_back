package kaits.nct.exp.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

import kaits.nct.common.model.FileToVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("expSendAgdDTO")
public class ExpSendAgdDTO {
	private String userId;
	private String admGroup;
	private String admIp;
	private String metaDateTime;
	private List<String> recCodeList;
	private List<String> agdCodeList;
	private List<ExpRecUpdateVO> sendMetaList;
	private List<ExpRecUpdateVO> sendRecList;
	private List<ExpAgdListVO> sendagdList;
	private List<String> metaList;
	private List<String> techList;
	private List<FileToVO> fileList;
}

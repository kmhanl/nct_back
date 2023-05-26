package kaits.nct.exp.model;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ExtRecCompeDTO {
	private String nctRecCode;
	private List<String> techList;
	
	private String admGroup;
	private String admId;
	private String admIpAddress;
}

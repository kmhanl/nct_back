package kaits.nct.expert.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expertTabVO")
public class ExpertTabVO {
	private String title;
	private int count;

}

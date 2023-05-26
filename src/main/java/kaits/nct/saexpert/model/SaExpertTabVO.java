package kaits.nct.saexpert.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("saExpertTabVO")
public class SaExpertTabVO {
	private String title;
	private int count;

}

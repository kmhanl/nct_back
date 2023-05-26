package kaits.nct.soexpert.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("soExpertTabVO")
public class SoExpertTabVO {
	private String title;
	private int count;
}

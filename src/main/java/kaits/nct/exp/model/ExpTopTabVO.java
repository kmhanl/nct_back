package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("expTopTabVO")
public class ExpTopTabVO {
	private String title;
	private int count;
	
	

}

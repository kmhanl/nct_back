package kaits.nct.member.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("memberTabVO")
public class MemberTabVO {
	private String title;
	private int count;

}

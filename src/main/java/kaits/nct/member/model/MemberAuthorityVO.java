package kaits.nct.member.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("memberAuthorityVO")
public class MemberAuthorityVO {
	private String admId;
	private String techId;
}

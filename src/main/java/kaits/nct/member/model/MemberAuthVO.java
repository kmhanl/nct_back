package kaits.nct.member.model;

import org.jetbrains.annotations.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@Alias("memberAuthVO")
public class MemberAuthVO {
	private String admId;
	private String admAuthId;
	private String admAuthTech;
	private String admAuthYn;
	
}

package kaits.nct.member.model;

import org.jetbrains.annotations.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@Alias("memberChkVO")
public class MemberChkVO {
	private String admId;
	private String admDnValue;
	
}

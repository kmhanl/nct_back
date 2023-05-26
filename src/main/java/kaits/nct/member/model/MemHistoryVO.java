package kaits.nct.member.model;

import org.jetbrains.annotations.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Alias("memHistoryVO")
public class MemHistoryVO {
	@NotNull
	private String admId;
	
	private String admHisIdx;
	private String admHisMenu;
	private String admHisCode;
	private String admHisComment;
	private String admHisDate;
	private String admHisDate8Ko;
}

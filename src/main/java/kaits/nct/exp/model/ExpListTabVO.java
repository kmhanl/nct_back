package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("expListTabVO")
public class ExpListTabVO {
	private String title;
	private int count;
	private String admGroup;
	private String admId;
}

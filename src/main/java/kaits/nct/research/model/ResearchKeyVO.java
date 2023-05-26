package kaits.nct.research.model;

import org.jetbrains.annotations.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data

@NoArgsConstructor
@Alias("ResearchKeyVO")
public class ResearchKeyVO {
	@NotNull
	private String rscMakekey;
}

package kaits.nct.research.model;

import org.jetbrains.annotations.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("intoMemVO")
public class IntoMemVO {
	private String rscMemCode;
	private String rscCode;
	private String rscInviKey;
	private String rscMemCompany;
	private String rscMemComCode;
	private String rscMemName;
	private String rscMemEmail;
}

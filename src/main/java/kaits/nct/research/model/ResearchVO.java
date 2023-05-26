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
@NoArgsConstructor
@Alias("ResearchVO")
public class ResearchVO {
	private int index; //?
	@NotNull
	
	private String rscCode;
	private String rscTitle;
	private String rscSponsor;
	private String rscMemo;
	private String rscStrSate;
	private String rscStrDate8Ko;
	private String rscEndDate;
	private String rscEndDate8Ko;
	private String rscStatus;
	private String rscStatusNm;
	private String rscRegDate;
	private String rscRegDate8Ko;
	private String rscRegId;

	
	// 리스트 페이징 변수 
	private int pageNo;
	private int startNo;
	private int pageRows;
	private int totalPage;
	private int totalRows;
	
	public void setPageInit() {
		pageNo = 1;
		pageRows = 10;
	}
}

package kaits.nct.rsc.model;

import org.jetbrains.annotations.NotNull;

import kaits.nct.research.model.ResearchVO;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("rscAnswerVO")
public class RscAnswerVO {
	
	private String rscMemCode;
	private String rscMemCompany;
	private String rscQuesIdx;
	private String rscSection;
	private String rscAnsType;
	private String rscAnsSelType;
	private String rscQuesChoNo;
	private String rscQuesAns;
	private String rscQuesAnsEtc1;
	private String rscQuesAnsEtc2;
	private String rscQuesAnsEtc3;
	private String rscQuesAnsEtc4;
	private String rscQuesAnsEtc5;
	private String rscQuesAnsEtc6;
	private String rscQuesAnsText;
	
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

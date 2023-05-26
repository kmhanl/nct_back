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
@Alias("rscForDataVO")
public class RscForDataVO {
	private String rscMemCode;
	private String rscMemCompany;
	private String rscForCnt;
	private String rscForType;
	private String rscForCountry;
	private String rscForTotal;
	private String rscForNum1;
	private String rscForNum2;
	private String rscForNum3;
	private String rscForNum4;
	private String rscForNum5;
	private String rscForNum6;
	private String rscForNum7;
	private String rscForNum8;
	private String rscForNum9;
	private String rscForNum10;
	private String rscForNum11;
	private String rscForNum12;
	private String rscForNum13;
	private String rscForNum14;
	private String rscForNum15;
	private String rscForNum16;
	private String rscForNum17;
	private String rscForNum18;
	private String rscForNum19;
	private String rscForNum20;
	private String rscForNum21;
	private String rscForNum22;
	private String rscForNum23;
	private String rscForNum24;
	private String rscForNum25;
	private String rscForNum26;
	private String rscForNum27;
	
	
	
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

package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("pagingVO")
public class PagingVO {
	private int pageNo;
	private int startNo;
	private int pageRows;
	private int totalPage;
	private int totalRows; 
	
	public PagingVO(int pageNo, int pageRows, int totalRows) {
		this.pageNo = pageNo;
		this.pageRows = pageRows;
		this.totalRows = totalRows;
		this.totalPage = (int)Math.ceil((double)totalRows / (double)pageRows);
		this.startNo = (this.pageNo - 1) * this.pageRows;
	}
}

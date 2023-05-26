package kaits.nct.board.model;
import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("BoardVO")
public class BoardVO {
	
	
	private String infoBoardCode;
	private String infoBoardTitle;
	private String infoBoardContent;
	private String infoBoardId;
	private String infoBoardViewYn;
	private String infoBoardDate;
	private String policyDate8Ko;
	
	
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
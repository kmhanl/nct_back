package kaits.nct.policy.model;
import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("PolicyVO")
public class PolicyVO {
	
		private String policyCode;
		private String policyDepth;
		private String policyType;
		private String policyTitle;
		private String policyContent;
		private String policyId;
		private String policyPwYn;
		private String policyPassword;
		private String policyViewYn;
		private String policyDate;
		private String policyDate8Ko;
		private String policyName;
		private String policyAnswer;
		private String policySignId;
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

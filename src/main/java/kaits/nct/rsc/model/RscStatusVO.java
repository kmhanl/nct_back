package kaits.nct.rsc.model;

import org.jetbrains.annotations.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("rscStatusVO")
public class RscStatusVO {
	
	private String rscCode;
	private String rscMemCode;
	
	private String statCode;
	
	private String rscStatus;
	private String rscStatusRd;
	private String rscStatusIm;
	private String rscStatusCo;
	
	private String rscAllCnt;
	
	private String rscComCnt1;
	private String rscComCnt1Rd;
	private String rscComCnt1Im;
	private String rscComCnt1Co;
	private String rscComCnt2;
	private String rscComCnt2Rd;
	private String rscComCnt2Im;
	private String rscComCnt2Co;
	private String rscComCnt3;
	private String rscComCnt3Rd;
	private String rscComCnt3Im;
	private String rscComCnt3Co;
	private String rscComCnt4;
	private String rscComCnt4Rd;
	private String rscComCnt4Im;
	private String rscComCnt4Co;
	
	private String rscHaveCnt1;
	private String rscHaveCnt1Rd;
	private String rscHaveCnt1Im;
	private String rscHaveCnt1Co;
	private String rscHaveCnt2;
	private String rscHaveCnt2Rd;
	private String rscHaveCnt2Im;
	private String rscHaveCnt2Co;
	private String rscHaveCnt3;
	private String rscHaveCnt3Rd;
	private String rscHaveCnt3Im;
	private String rscHaveCnt3Co;
	private String rscHaveCnt4;
	private String rscHaveCnt4Rd;
	private String rscHaveCnt4Im;
	private String rscHaveCnt4Co;
	
	private String rscInqCnt1;
	private String rscInqCnt1Rd;
	private String rscInqCnt1Im;
	private String rscInqCnt1Co;
	private String rscInqCnt2;
	private String rscInqCnt2Rd;
	private String rscInqCnt2Im;
	private String rscInqCnt2Co;
	private String rscInqCnt3;
	private String rscInqCnt3Rd;
	private String rscInqCnt3Im;
	private String rscInqCnt3Co;
	private String rscInqCnt4;
	private String rscInqCnt4Rd;
	private String rscInqCnt4Im;
	private String rscInqCnt4Co;
	private String rscInqCnt5;
	private String rscInqCnt5Rd;
	private String rscInqCnt5Im;
	private String rscInqCnt5Co;
	private String rscInqCnt6;
	private String rscInqCnt6Rd;
	private String rscInqCnt6Im;
	private String rscInqCnt6Co;
	private String rscInqCnt7;
	private String rscInqCnt7Rd;
	private String rscInqCnt7Im;
	private String rscInqCnt7Co;
	private String rscInqCnt8;
	private String rscInqCnt8Rd;
	private String rscInqCnt8Im;
	private String rscInqCnt8Co;
	
}

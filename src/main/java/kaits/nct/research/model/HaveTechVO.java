package kaits.nct.research.model;

import java.util.List;

import org.jetbrains.annotations.NotNull;

import kaits.nct.common.model.FileToVO;
//import kaits.nct.receipt.model.ExpertAgendaStatVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HaveTechVO {
	private String rscCode;
	private String rscMemCode;
	private String rscHaveTechUniqId;
	
	private String techFrameDel;
	
	
	private String rscHavePlaceIdx;
	private int rscHavePlaceNaCnt;
	private int rscHavePlaceHoCnt;
	private int rscHavePlaceTaCnt;
	
	private String rscHavePlaceType;
	private String rscHavePlaceTypeNm;
	private String rscHavePlaceCode;
	private String rscHavePlaceName;
	private String rscHavePlaceEtc;
	private String rscHavePlaceCity;
	private String rscHavePlacePost;
	private String rscHavePlaceAdd1;
	private String rscHavePlaceAdd2;
	private String rscHavePlaceDate;
	private String rscHavePlaceDate8Ko;
	private String rscHavePlaceYn;
	
	private String rscHaveSysIdx;
	private String rscHaveSys1;
	private String rscHaveSys2;
	private String rscHaveSys3;
	private String rscHaveSys4;
	private String rscHaveSys5;
	private String rscHaveSys6;
	private String rscHaveSys7;
	private String rscHaveSys8;
	private String rscHaveSysDate;
	private String rscHaveSysDate8Ko;
	private String rscHaveSysYn;
	
	private String rscHavePatIdx;
	private String rscHavePatStat;
	private String rscHavePatCnt;
	private String rscHavePatAddCnt;
	private String havePatFileNm;
	private String havePatFileOriginNm;
	private String havePatFilePath;
	private String havePatFileSize;
	private String havePatFileKey;
	private String rscHavePatDate;
	private String rscHavePatDate8Ko;
	private String rscHavePatYn;
	
	private String rscHavePatentIdx;
	private String rscHavePatentName;
	private String rscHavePatentSpon;
	private String rscHavePatentCode;
	private String rscHavePatentDate;
	private String rscHavePatentDate8Ko;
	private String rscHavePatentYn;
	
	private String rscHaveRndIdx;
	private String rscHaveRndStat;
	private String rscHaveRndCnt;
	private String rscHaveRndAddCnt;
	private String haveRndFileNm;
	private String haveRndFileOriginNm;
	private String haveRndFilePath;
	private String haveRndFileSize;
	private String haveRndFileKey;
	private String rscHaveRndDate;
	private String rscHaveRndDate8Ko;
	private String rscHaveRndYn;
	
	private String rscHaveRndlIdx;
	private String rscHaveRndlName;
	private String rscHaveRndlType;
	private String rscHaveRndlTypeYn;
	private String rscHaveRndlTypeYn2;
	private String rscHaveRndlTypeEtc;
	private String rscHaveRndlSpon;
	private String rscHaveRndlEtc;
	private String rscHaveRndlSpon2;
	private String rscHaveRndlSpon2Etc;
	private String rscHaveRndlDate;
	private String rscHaveRndlDate8Ko;
	private String rscHaveRndlYn;
	
}

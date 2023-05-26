package kaits.nct.exp.model;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Alias("expRecListVO")
public class ExpRecListVO {
	private int index;
	@NotNull
	
	private String nctRecCode;
	private String nctMetaCode;
	
	private String techCount;
		
	private String nctRecReYn;
	private String nctRecReCode;
	private String nctRecExCnt;
	private String nctRecExEnCnt;
	private String nctRecFixDate;
	private String nctRecAdmView;
	private String nctRecComView;
	private String nctRecStatus;
	private String nctRecStatusLast;
	private String nctRecStatusLastView;
	private String nctRecStatusLastId;
	
	private String nctMetaType;
	private String nctMetaRecYn;
	private String nctMetaAdmYn;
	private String nctMetaRecCode;
	private String nctMetaComType;
	private String nctMetaComCode;
	private String nctMetaComNo;
	private String nctMetaComNm;
	private String nctMetaCeo;
	private String nctMetaBoZip;
	private String nctMetaBoAdd1;
	private String nctMetaBoAdd2;
	private String nctMetaBoPhone1;
	private String nctMetaBoPhone2;
	private String nctMetaBoPhone3;
	private String nctMetaSaZip;
	private String nctMetaSaAdd1;
	private String nctMetaSaAdd2;
	private String nctMetaSaPhone1;
	private String nctMetaSaPhone2;
	private String nctMetaSaPhone3;
	private String nctMetaPmNm;
	private String nctMetaPmDept;
	private String nctMetaPmPosition;
	private String nctMetaPmPhone1;
	private String nctMetaPmPhone2;
	private String nctMetaPmPhone3;
	private String nctMetaPmMobile1;
	private String nctMetaPmMobile2;
	private String nctMetaPmMobile3;
	private String nctMetaPmEmail;
	private String nctMetaTitle;
	private String nctMetaRegiId;
	private String nctMetaRegi;
	private String nctMetaRegiView;
	private String nctMetaLastId;
	private String nctMetaLast;
	private String nctMetaLastView;
	private String nctMetaTechNm;
	private String techName;
	private String techItemName;
	
	private String admGroup;
	private String admId;
	private String admIpAddress;
	
	private int pageNo;
	private int startNo;
	private int pageRows;
	private int totalPage;
	private int totalRows;
	
	public void setPageInit() {
		pageNo = 1;
		pageRows = 10;
		startNo = (pageNo - 1) * pageRows;
	}
 }

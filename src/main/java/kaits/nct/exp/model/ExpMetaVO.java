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
@Alias("expMetaVO") //ExpRecMetaVO expRecViewVO
public class ExpMetaVO {
	private int index;
	@NotNull
	private String nctIdx;
	private String nctRecCode;
	private String nctMetaCode;
	private String nctRecReYn;
	private String nctRecReCode;
	private String nctRecExCnt;
	private String nctRecExEnCnt;
	private String nctRecFixDate;
	private String nctRecFixDateView;
	private String nctRecAdmView;
	private String nctRecComView;
	private String nctRecStatus;
	private String nctRecStatusLast;
	private String nctRecStatusLastView;
	private String nctRecStatusLastId;
	
	private String nctAgdCode;
	private String nctAgdReYn;
	private String nctAgdReCode;
	private String nctAgdTech;
	private String nctAgdTechNm;
	private String nctExpIdx;
	private String nctExpSort;
	private String nctAgdTitle;
	private String nctAgdFixDate;
	private String nctAgdFixDateView;
	private String nctAgdStatus;
	private String nctAgdRegId;
	private String nctAgdRegDate;
	private String nctAgdRegDateView;
	private String nctAgdStatusLast;
	private String nctAgdStatusLastView;
	private String nctAgdStatusLastId;
	
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
	private String nctMetaTitleEtc;
	private String nctMetaTechForm;
	private String nctMetaExSale;
	private String nctMetaExSCom;
	private String nctMetaExTrans;
	private String nctMetaExTCom;
	private String nctMetaExEtc;
	private String nctMetaExECom;
	private String nctMetaExDate;
	private String nctMetaExDateView;
	private String nctMetaExDCom;
	private String nctMetaTechQua;
	private String nctMetaReason;
	private String nctMetaLaw01;
	private String nctMetaLaw02;
	private String nctMetaLaw03;
	private String nctMetaRegiId;
	private String nctMetaRegi;
	private String nctMetaRegiView;
	private String nctMetaLastId;
	private String nctMetaLast;
	private String nctMetaLastView;
	
	private String admGroup;
	private String admId;
	private String admIpAddress;
	
}

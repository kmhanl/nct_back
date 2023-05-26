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
@Alias("expSchComVO")
public class ExpSchComVO {
	private String cpnId;
	private String cpnSeCode;
	private String cpnSNo;
	private String cpnBNo;
	private String cpnNm;
	private String cpnCeo;
	private String cpnBZip;
	private String cpnBAdd1;
	private String cpnBAdd2;
	private String cpnBPhone1;
	private String cpnBPhone2;
	private String cpnBPhone3;
	private String cpnBFax1;
	private String cpnBFax2;
	private String cpnBFax3;
	private String cpnDutyCode;
	private String cpnSZip;
	private String cpnSAdd1;
	private String cpnSAdd2;
	private String cpnSPhone1;
	private String cpnSPhone2;
	private String cpnSPhone3;
	private String cpnPNm;
	private String cpnPDept;
	private String cpnPPosition;
	private String cpnPPhone1;
	private String cpnPPhone2;
	private String cpnPPhone3;
	private String cpnPMobile1;
	private String cpnPMobile2;
	private String cpnPMobile3;
	private String cpnPEmail;
	private String cpnStat;
	
}

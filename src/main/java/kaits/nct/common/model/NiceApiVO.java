package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("niceApiVO")
public class NiceApiVO {
	private String niceAuthTokenVersionId;
	private String niceAuthKey;
	private String niceAuthIv;
	private String niceAuthHmacKey;
	private String niceAuthName;
	private String niceAuthMobileNo;
	private String niceAuthYn;
	private String niceAuthRegDate;
	private String di;
	private String businessNo;
	
	private String niceEncData;
}

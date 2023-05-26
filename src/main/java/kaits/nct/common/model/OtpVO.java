package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("otpVO")
public class OtpVO {
	private int otpIdx;
	private String otpCode;
	private String admId;
	private String otpDate;
}

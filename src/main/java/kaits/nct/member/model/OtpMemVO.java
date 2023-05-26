package kaits.nct.member.model;

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
@Alias("otpMemVO")
public class OtpMemVO {
	@NotNull
	private String userId;
	
	private String userName;
	private String email;
	private String mobile;
	
	
}

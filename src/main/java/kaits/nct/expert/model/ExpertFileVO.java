package kaits.nct.expert.model;


import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
@Alias("expertFileVO")
public class ExpertFileVO {
	@NotNull
	private String rcptIdx;
	private String fileRcptSeq;
	private String fileNm;
	private String fileOriginNm;
	private String filePath;
	private String fileSize;
	private String fileKey;
	private String fileRegId;
	private String fileRegDate;
}

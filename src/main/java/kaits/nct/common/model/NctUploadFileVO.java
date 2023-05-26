package kaits.nct.common.model;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("nctUploadFileVO")
@NoArgsConstructor
public class NctUploadFileVO {
    private Integer id;
    private boolean deleted = false;
    private String type;
    private String sort;
    private MultipartFile file;

}

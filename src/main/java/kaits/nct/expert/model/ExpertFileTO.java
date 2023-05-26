package kaits.nct.expert.model;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("expertFileTO")
@NoArgsConstructor
public class ExpertFileTO {
    private Integer id;
    private boolean deleted = false;
    private MultipartFile file;
}

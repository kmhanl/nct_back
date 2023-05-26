package kaits.nct.common.service;

import java.util.List;

import kaits.nct.common.model.FileIdxVO;
import kaits.nct.common.model.FileToVO;

public interface FileService {
	void saveFile(String filePath, List<FileToVO> fileList, List<FileIdxVO> idxList) throws Exception;
}

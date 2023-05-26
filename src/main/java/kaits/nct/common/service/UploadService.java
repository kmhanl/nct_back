package kaits.nct.common.service;

import java.util.List;

import kaits.nct.common.model.FileToVO;
import kaits.nct.common.model.NctFileVO;
import kaits.nct.common.model.NctUploadFileVO;

public interface UploadService {
	
	/** 공통 파일 업로드 **/
	void uploadFile(String filePath, List<FileToVO> fileList, List<NctFileVO> idxList) throws Exception;

}

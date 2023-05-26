package kaits.nct.common.service.impl;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.Normalizer;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kaits.nct.common.mapper.FileMapper;
import kaits.nct.common.model.FileIdxVO;
import kaits.nct.common.model.FileMstVO;
import kaits.nct.common.model.FileToVO;
import kaits.nct.common.service.FileService;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.common.utility.JSchWrapper;

@Service
public class FileServiceImpl implements FileService {
	@Value("#{prop['file.url']}")
	String gFilePath;
	
	@Value("#{prop['file.temp.url']}")
	String tempFilePath;
	
	@Value("#{flprop['fl.host']}")
	String fileServerHost;
	
	@Value("#{flprop['fl.user']}")
	String fileServerUser;
	
	@Value("#{flprop['fl.pwd']}")
	String fileServerPassword;
	
	@Autowired
	FileMapper fileMapper;
	
	@Override
	public void saveFile(String filePath, List<FileToVO> fileList, List<FileIdxVO> idxList) throws Exception {
		JSchWrapper ftp= new JSchWrapper();
		// File Upload Logic
		for (FileToVO fileData : fileList) {
			MultipartFile newFile = fileData.getFile();
			System.out.println("implFile " + newFile);
			
			String fileCode = fileMapper.getNewFileCode();
			String origFileName = newFile.getOriginalFilename();
			String origFileExt = origFileName.substring(origFileName.lastIndexOf("."));
			String storedFileName = getNewUUID() + origFileExt;
			String fileSize = newFile.getSize() + "";
			String fileKey = DataScrty.encryptPassword(storedFileName, fileCode);
            
			// 맥 파일명 => 윈도우 파일명 (맥에서 파일 업로드 시 사용)
            if (Normalizer.isNormalized(origFileName, Normalizer.Form.NFD)) {
            	origFileName = Normalizer.normalize(origFileName, Normalizer.Form.NFC);
            }
			
            // 파일 저장
            try {
            	// 로컬(개발용)이 아닐 경우에만 실제 파일 생성
				if(!"LOCAL".equals(gFilePath)) {
					// 임시폴더 없으면 생성
					File xfile = new File(tempFilePath); 
					if(xfile.exists() == false) xfile.mkdirs(); 
					
					// SFTP 연결
					ftp.connectSFTP(fileServerHost, 22, fileServerUser, fileServerPassword);
					
					// 임시폴더 내 파일 생성
	            	xfile = new File(tempFilePath + storedFileName);
					Files.copy(newFile.getInputStream(), xfile.toPath(), StandardCopyOption.REPLACE_EXISTING);
					
					// 생성된 파일 FTP 전송
					ftp.uploadFile(tempFilePath + storedFileName, gFilePath);
					
					// SFTP 연결 해제
					ftp.disconnectSFTP();
					
					// 임시폴더 내 파일 제거
					xfile.delete();
				}
			} catch (Exception e) {
				System.out.println("파일 저장 에러");
				System.out.println(e);
				return;
			}
			
			FileMstVO fileMstVO = new FileMstVO(fileCode, storedFileName, origFileName, !"LOCAL".equals(gFilePath) ? "/home/tomcat/live/upload/file/" : "LOCAL", fileSize, fileKey);
			
			// kaits_file_mst 데이터 생성
			fileMapper.insertFileMst(fileMstVO);
			System.out.println("파일MST : "+fileMstVO);  
			for (FileIdxVO fileIdxVO : idxList) {
				fileIdxVO.setFileCode(fileCode);
				fileIdxVO.setFileDepth(fileData.getDepth());
				fileIdxVO.setFileType(fileData.getType());
				fileMapper.insertFileIdx(fileIdxVO);
				System.out.println("파일IDX : "+fileIdxVO);
			}
			
			
		}
	}
	private String getNewUUID() {
		return UUID.randomUUID().toString().toUpperCase();
	}
}

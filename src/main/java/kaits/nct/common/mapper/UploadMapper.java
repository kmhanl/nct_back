package kaits.nct.common.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import kaits.nct.common.model.NctFileMetaVO;
import kaits.nct.common.model.NctFileVO;

@Mapper
public interface UploadMapper {
	/**
	 * 파일 업로드 > 신규 파일 메타 코드 생성
	 * @param params
	 * @return
	 */
	public String getNewFileMeta();
	/**
	 * 파일 업로드 > 파일 마스터 정보 저장
	 * @param params
	 * @return
	 */
	public int saveFileMeta(NctFileMetaVO param);
	/**
	 * 파일 업로드  > 파일 인덱스 정보 저장
	 * @param params
	 * @return
	 */
	public int saveFileIdx(NctFileVO param);
}

package kaits.nct.common.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.common.model.FileIdxVO;
import kaits.nct.common.model.FileMstVO;

@Mapper
public interface FileMapper {
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public String getNewFileCode();
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public int insertFileMst(FileMstVO param);
	/**
	 * 접수완료 > 검토완료 시 상태 변경
	 * @param params
	 * @return
	 */
	public int insertFileIdx(FileIdxVO param);
}

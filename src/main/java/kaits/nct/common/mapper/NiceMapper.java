package kaits.nct.common.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.common.model.FileIdxVO;
import kaits.nct.common.model.FileMstVO;
import kaits.nct.common.model.NiceApiVO;

@Mapper
public interface NiceMapper {
	/**
	 * NICE API 정보 저장(인증 이름, 번호)
	 * @param params
	 * @return
	 */
	public int updateNiceAuth(NiceApiVO param);
	/**
	 * NICE API 정보 저장
	 * @param params
	 * @return
	 */
	public int insertNiceInfo(NiceApiVO param);
	/**
	 * NICE API 정보 조회
	 * @param params
	 * @return
	 */
	public NiceApiVO selectNiceAuth(NiceApiVO param);
}

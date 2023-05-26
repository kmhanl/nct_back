package kaits.nct.saexpert.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.saexpert.model.SaExpertAgendaVO;
import kaits.nct.saexpert.model.SaExpertTabVO;

@Mapper
public interface SaExpertAgendaMapper {
	/**
	 * 안건 현황 조회
	 * @param SaExpertAgendaVO
	 * @return
	 */
	public List<SaExpertAgendaVO> getAgendaList(SaExpertAgendaVO params);
	
	/**
	 * 안건 현황 상태별 데이터 수 조회
	 * @param SaExpertAgendaVO
	 * @return
	 */
	public List<SaExpertTabVO> getAgendaListGroupCount(SaExpertAgendaVO params);
}

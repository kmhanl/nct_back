package kaits.nct.soexpert.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.soexpert.model.SoExpertAgendaVO;
import kaits.nct.soexpert.model.SoExpertTabVO;

@Mapper
public interface SoExpertAgendaMapper {
	/**
	 * 안건 현황 조회
	 * @param SaExpertAgendaVO
	 * @return
	 */
	public List<SoExpertAgendaVO> getAgendaList(SoExpertAgendaVO params);
	
	/**
	 * 안건 현황 상태별 데이터 수 조회
	 * @param SaExpertAgendaVO
	 * @return
	 */
	public List<SoExpertTabVO> getAgendaListGroupCount(SoExpertAgendaVO params);

}

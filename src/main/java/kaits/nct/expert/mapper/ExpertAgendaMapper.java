package kaits.nct.expert.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.expert.model.ExpertFileVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.ExpertTechVO;
import kaits.nct.expert.model.agenda.ExpertAgendaHisVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.agenda.ExpertAgendaVO;

@Mapper
public interface ExpertAgendaMapper {
	/**
	 * 안건 현황 조회
	 * @param ExpertAgendaVO
	 * @return
	 */
	public List<ExpertAgendaStatVO> getAgendaStatList(ExpertAgendaStatVO params);
	
	/**
	 * 안건 현황 상태별 데이터 수 조회
	 * @param ExpertAgendaVO
	 * @return
	 */
	public List<ExpertTabVO> getAgendaStatListGroupCount(ExpertAgendaStatVO params);
	
	/**
	 * 검토요청 - 분야 리스트 조회
	 * @return
	 */
	public List<ExpertTechVO> getTechList();
	
	/**
	 * 검토요청 - 분야 리스트 조회
	 * @return
	 */
	public List<ExpertTechItemVO> getTechItemList(ExpertTechItemVO param);
	
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveAgenda(ExpertAgendaVO params);
	
	/**
	 * 검토요청 - 데이터 저장
	 * @param ExpertAgendaVO
	 * @return
	 */
	public int saveAgendaStat(ExpertAgendaStatVO params);
	
	/**
	 * 검토요청 - 데이터 저장
	 * @param FileVO
	 * @return
	 */
	public int saveAgendaFile(ExpertFileVO params);
	
	/**
	 * 검토요청 - 데이터 저장
	 * @param FileVO
	 * @return
	 */
	public int saveAgendaHistory(ExpertAgendaHisVO params);
	
	/**
	 * 검토요청 - 데이터 저장
	 * @param FileVO
	 * @return
	 */
	public String getNewAgdStatCode(ExpertAgendaStatVO params);
		
	/**
	 * 접수내역 상태 변경
	 * @param params
	 * @return
	 */
	public int updateAgdExIdx(ExpertAgendaStatVO params);
	
	/**
	 * 접수내역 상태 변경
	 * @param params
	 * @return
	 */
	public int updateAgdStatusComplete(ExpertAgendaStatVO params);
	/**
	 * 접수내역 상태 변경
	 * @param params
	 * @return
	 */
	public int deleteAgenda(ExpertAgendaStatVO params);

	/**
	 * 안건 현황 조회
	 * @param ExpertAgendaVO
	 * @return
	 */
	public List<ExpertAgendaStatVO> searchAgendaCode(ExpertAgendaStatVO params);
}

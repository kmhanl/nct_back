package kaits.nct.ex.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.ex.model.ExAgdListDataVO;
import kaits.nct.ex.model.ExInfoDataVO;
import kaits.nct.expert.model.agenda.ExpertAgendaListVO;


@Mapper
public interface ExMapper {
	
	/** 전문위원회 > 위원회 회차 정보 조회  **/
	public List<ExInfoDataVO> getExInfoData(ExInfoDataVO param);
	
	/** 전문위원회 > 위원회 회차별 왼쪽 안건 리스트 조회  **/
	public List<ExAgdListDataVO> loadAgendaList(ExAgdListDataVO param);
	/** 전문위원회 > 위원회 회차별 왼쪽 안건 리스트 조회 > 기술 명칭 조회 **/
	public List<ExAgdListDataVO> loadAgendaTitList(ExAgdListDataVO param);
	
	
	/** 전문위원회 > 위원회 현황 > 위원회 개최 처리  **/
	public int openProcEx(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 처리 > 에 따른 포함된 안건 업데이트  **/
	public int updateOpenExAgd(ExInfoDataVO params);
	
	/** 전문위원회 > 위원회 현황 > 위원회 개최 취소 처리  **/
	public int cancelProcEx(ExInfoDataVO params);
	
	
	
	/** 전문위원회 > 위원회 현황 > 위원회 개최 삭제 > 위원회 정보 처리  **/
	public int deleteProcEx(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 삭제 > 위원회 구성원 처리  **/
	public int deleteProcExMem(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 삭제 > 위원회 작성의견 처리  **/
	public int deleteProcExOpi(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 삭제 > 에 따른 포함된 안건 업데이트  **/
	public int updateProcExAgd(ExInfoDataVO params);
	
	
	
	
	/** 전문위원회 > 위원회 현황 > 위원회 개최 (진행중) > 개최 회수 처리  **/
	public int backProcEx(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 (진행중) > 개최 회수 에 따른 구성원 처리  **/
	public int updateBackExMem(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 (진행중) > 개최 회수 에 따른 위원회 작성의견 처리  **/
	public int updateBackExOpi(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 (진행중) > 개최 회수 에 따른 안건 업데이트  **/
	public int updateBackExAgd(ExInfoDataVO params);
	
	
	
	/** 전문위원회 > 위원회 현황 > 위원회 개최 (진행중) > 위원회 종료 처리  **/
	public int endProcEx(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 개최 (진행중) >  위원회 종료 처리 따른 안건 업데이트  **/
	public int updateEndExAgd(ExInfoDataVO params);
	
	
	
	/** 전문위원회 > 위원회 현황 > 결과 도출중 > 위원회 종료 회수 처리  **/
	public int endBackProcEx(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 결과 도출중 > 위원회 종료 회수 처리 따른 안건 업데이트  **/
	public int updateEndBackExAgd(ExInfoDataVO params);
	
	
	/** 전문위원회 > 위원회 현황 > 위원회 종료 > 기술안보과 이관  처리  **/
	public int sendProcExdo(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 위원회 종료 > 기술안보과 이관   처리 따른 안건 업데이트  **/
	public int updatesendExAgd(ExInfoDataVO params);
	
	
	/** 전문위원회 > 위원회 현황 > 이관 완료 > 이관  회수 처리  **/
	public int returnProcEx(ExInfoDataVO params);
	/** 전문위원회 > 위원회 현황 > 이관 완료 > 이관  처리 따른 안건 업데이트  **/
	public int updatereturnExAgd(ExInfoDataVO params);
	
	
	
}

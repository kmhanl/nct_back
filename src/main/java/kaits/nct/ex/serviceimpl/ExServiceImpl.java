package kaits.nct.ex.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kaits.nct.ex.service.ExService;
import kaits.nct.ex.mapper.ExMapper;
import kaits.nct.ex.model.ExAgdListDataVO;

import kaits.nct.common.model.PagingVO;

import kaits.nct.expert.mapper.ExpertAgendaMapper;
import kaits.nct.expert.mapper.ExpertCommitteeMapper;
import kaits.nct.expert.mapper.ExpertReceiptMapper;
import kaits.nct.expert.model.ExDataInfoVO;

import kaits.nct.expert.model.agenda.ExpertAgendaListVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;

import kaits.nct.ex.model.ExInfoDataVO;


@Service
public class ExServiceImpl implements ExService {
	
	@Autowired
	private ExMapper exMapper;
	
	// 전문위원회 > 위원회 회차 정보 조회 
	@Override
	public List<ExInfoDataVO> getExInfoData(ExInfoDataVO params) {
		// TODO Auto-generated method stub
		List<ExInfoDataVO> resultList = exMapper.getExInfoData(params);
		return resultList;
	}
	
	// 전문위원회 > 위원회 회차별 왼쪽 안건 리스트 조회 
	@Override
	public List<ExAgdListDataVO> loadAgendaList(ExAgdListDataVO params) {
		// TODO Auto-generated method stub
		List<ExAgdListDataVO> resultList = exMapper.loadAgendaList(params);
		return resultList;
	}
	
	// 전문위원회 > 위원회 회차별 왼쪽 안건 리스트 > 기술 명칭 조회 
		@Override
		public List<ExAgdListDataVO> loadAgendaTitList(ExAgdListDataVO params) {
			// TODO Auto-generated method stub
			List<ExAgdListDataVO> resultList = exMapper.loadAgendaTitList(params);
			return resultList;
		}
	
	// 전문위원회 > 위원회 현황 > 전문위원회 취소 처리  
	@Override
	public void cancelProcEx(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.cancelProcEx(param);
		
	}
	
	// 전문위원회 > 위원회 현황 > 전문위원회 취소 처리  
	@Override
	public void openProcEx(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.openProcEx(param);
		exMapper.updateOpenExAgd(param);
		
	}

	
	// 전문위원회 > 위원회 현황 > 전문위원회 삭제 처리  
	@Override
	public void deleteProcEx(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.deleteProcEx(param);
		exMapper.deleteProcExMem(param);
		exMapper.deleteProcExOpi(param);
		exMapper.updateProcExAgd(param);
	}
	
	// 전문위원회 > 위원회 현황 > 전문위원회-진행중 > 개최 회수 처리  
	@Override
	public void backProcEx(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.backProcEx(param);
		System.out.println("개최 회수================>impl 1");
		exMapper.updateBackExMem(param);
		System.out.println("개최 회수================>impl 2");
		exMapper.updateBackExOpi(param);
		System.out.println("개최 회수================>impl 3");
		exMapper.updateBackExAgd(param);
		System.out.println("개최 회수================>impl 4");
	}
	
	// 전문위원회 > 위원회 현황 > 전문위원회-진행중 > 위원회 종료 처리  
	@Override
	public void endProcEx(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.endProcEx(param);
		exMapper.updateEndExAgd(param);
		
	}

	// 전문위원회 > 위원회 현황 > 결과 도출중 > 위원회 종료 회수 처리  
	@Override
	public void endBackProcEx(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.endBackProcEx(param);
		exMapper.updateEndBackExAgd(param);
		
	}
	// 전문위원회 > 위원회 현황 > 위원회 종료 > 기술안보과 이관  처리  
	@Override
	public void sendProcExdo(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.sendProcExdo(param);
		exMapper.updatesendExAgd(param);
		
	}
	
	// 전문위원회 > 위원회 현황 > 이관 완료 > 이관 회수 처리  
	@Override
	public void returnProcEx(ExInfoDataVO param) {
		// TODO Auto-generated method stub
		exMapper.returnProcEx(param);
		exMapper.updatereturnExAgd(param);
		
	}
	
}

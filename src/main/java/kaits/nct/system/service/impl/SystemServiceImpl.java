package kaits.nct.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kaits.nct.common.model.PagingVO;
import kaits.nct.expert.mapper.ExpertReceiptMapper;
import kaits.nct.system.mapper.SystemTechMapper;
import kaits.nct.system.model.SystemTechVO;
import kaits.nct.system.service.SystemService;

@Service
public class SystemServiceImpl implements SystemService {
	private PagingVO paging;
	@Autowired
	private SystemTechMapper systemTechMapper;
	
	@Override
	public List<SystemTechVO> getTechList(SystemTechVO param) {
		// TODO Auto-generated method stub
		List<SystemTechVO> techlist = systemTechMapper.getTechList(param); // 맵퍼에서 DB 조회 결과 받기
		int totalRows = techlist.size();
		
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows); 
		return techlist;
	}

	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}

}

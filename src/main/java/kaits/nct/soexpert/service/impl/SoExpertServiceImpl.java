package kaits.nct.soexpert.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kaits.nct.common.model.PagingVO;
import kaits.nct.soexpert.mapper.SoExpertAgendaMapper;
import kaits.nct.soexpert.model.SoExpertAgendaVO;
import kaits.nct.soexpert.model.SoExpertTabVO;
import kaits.nct.soexpert.service.SoExpertService;

@Service
public class SoExpertServiceImpl implements SoExpertService {
	private PagingVO paging;
	private List<SoExpertTabVO> tabList;

	@Autowired
	private SoExpertAgendaMapper soExpertAgendaMapper;

	@Override
	public List<SoExpertAgendaVO> getAgendaList(SoExpertAgendaVO params) {
		// TODO Auto-generated method stub
		List<SoExpertAgendaVO> resultList = soExpertAgendaMapper.getAgendaList(params);
		int totalRows = resultList.size();
		tabList = soExpertAgendaMapper.getAgendaListGroupCount(params);
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);
		
		return resultList;
	}

	@Override
	public List<SoExpertTabVO> getTabList() {
		// TODO Auto-generated method stub
		return tabList;
	}

	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}
}

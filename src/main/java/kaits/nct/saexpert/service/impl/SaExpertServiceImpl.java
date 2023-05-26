package kaits.nct.saexpert.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kaits.nct.common.model.PagingVO;
import kaits.nct.saexpert.mapper.SaExpertAgendaMapper;
import kaits.nct.saexpert.model.SaExpertAgendaVO;
import kaits.nct.saexpert.model.SaExpertTabVO;
import kaits.nct.saexpert.service.SaExpertService;

@Service
public class SaExpertServiceImpl implements SaExpertService {
	private PagingVO paging;
	private List<SaExpertTabVO> tabList;

	@Autowired
	private SaExpertAgendaMapper saExpertAgendaMapper;

	@Override
	public List<SaExpertAgendaVO> getAgendaList(SaExpertAgendaVO params) {
		// TODO Auto-generated method stub
		List<SaExpertAgendaVO> resultList = saExpertAgendaMapper.getAgendaList(params);
		int totalRows = resultList.size();
		tabList = saExpertAgendaMapper.getAgendaListGroupCount(params);
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);
		
		return resultList;
	}

	@Override
	public List<SaExpertTabVO> getTabList() {
		// TODO Auto-generated method stub
		return tabList;
	}

	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}

}

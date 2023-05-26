package kaits.nct.rsc.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kaits.nct.common.model.PagingVO;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.rsc.mapper.RscMapper;
import kaits.nct.rsc.model.RscAnswerVO;
import kaits.nct.rsc.model.RscDataVO;
import kaits.nct.rsc.model.RscForDataVO;
import kaits.nct.rsc.model.RscMemberVO;
import kaits.nct.rsc.model.RscStatusVO;
import kaits.nct.rsc.service.RscService;

@Service
public class RscServiceImpl implements RscService {
	private PagingVO paging;
	
	@Resource(name = "rscMapper")
	private RscMapper rscMapper;

	
	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}
	
	/** 2022년 실태조사 관리 인덱스 > 최초인증 상태 값 리스트 조회 **/
	@Override
	public List<RscStatusVO> RscInviStatList(RscStatusVO params) {
		// 
		List<RscStatusVO> resultList = new ArrayList<RscStatusVO>();
		try { 
			resultList = rscMapper.RscInviStatList(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/** 2022년 실태조사 관리 인덱스 > 기관 기본 현황 상태 값 리스트 조회 **/
	@Override
	public List<RscStatusVO> RscComStatList(RscStatusVO params) {
		// 
		List<RscStatusVO> resultList = new ArrayList<RscStatusVO>();
		try { 
			resultList = rscMapper.RscComStatList(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	/** 2022년 실태조사 관리 인덱스 > 보유 기술 현황 상태 값 리스트 조회 **/
	@Override
	public List<RscStatusVO> RscHaveStatList(RscStatusVO params) {
		// 
		List<RscStatusVO> resultList = new ArrayList<RscStatusVO>();
		try { 
			resultList = rscMapper.RscHaveStatList(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	/** 2022년 실태조사 관리 인덱스 > 실태조사 현황 상태 값 리스트 조회  **/
	@Override
	public List<RscStatusVO> RscInqStatList(RscStatusVO params) {
		// 
		List<RscStatusVO> resultList = new ArrayList<RscStatusVO>();
		try { 
			resultList = rscMapper.RscInqStatList(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	/** 2022년 실태조사 관리 인덱스 > 설문조사 현황 상태 값 리스트 조회 **/
	@Override
	public List<RscStatusVO> RscSurStatList(RscStatusVO params) {
		// 
		List<RscStatusVO> resultList = new ArrayList<RscStatusVO>();
		try { 
			resultList = rscMapper.RscSurStatList(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 리스트  조회 **/
	@Override
	public List<RscMemberVO> RscMemberList(RscMemberVO param) {
		// 
		List<RscMemberVO> resultList = new ArrayList<RscMemberVO>();
		try { 
			resultList = rscMapper.RscMemberList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		int totalRows = resultList.size();
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows); 
		return resultList;
	}
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 리스트  조회 **/
	@Override
	public List<RscDataVO> RscDataList(RscDataVO param) {
		// 
		List<RscDataVO> resultList = new ArrayList<RscDataVO>();
		try { 
			resultList = rscMapper.RscDataList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 리스트  조회 **/
	@Override
	public List<RscForDataVO> RscDataForList(RscForDataVO param) {
		// 
		List<RscForDataVO> resultList = new ArrayList<RscForDataVO>();
		try { 
			resultList = rscMapper.RscDataForList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	@Override
	public List<RscForDataVO> RscDataForMemList(RscForDataVO param) {
		// 
		List<RscForDataVO> resultList = new ArrayList<RscForDataVO>();
		try { 
			resultList = rscMapper.RscDataForMemList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 답변 리스트  조회 **/
	@Override
	public List<RscAnswerVO> RscAnsDataList(RscAnswerVO param) {
		// 
		List<RscAnswerVO> resultList = new ArrayList<RscAnswerVO>();
		try { 
			resultList = rscMapper.RscAnsDataList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 대상 기업 리스트  조회 **/
	@Override
	public List<RscMemberVO> getCompanyList(RscMemberVO param) {
		// 
		List<RscMemberVO> resultList = new ArrayList<RscMemberVO>();
		try { 
			resultList = rscMapper.getCompanyList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	/** 2022년 실태조사 관리  > 대상기업 관리 > 대상 기업 1건  조회 **/
	@Override
	public RscMemberVO loadCompany(RscMemberVO haveplace) {
		// TODO Auto-generated method stub
        try {
        	RscMemberVO loadPlace = rscMapper.loadCompany(haveplace);
            return loadPlace;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 대상기업 수정 저장  **/
	@Override
	public int saveCompany(RscMemberVO member) {
		// TODO Auto-generated method stub
        try {
            int saveMember = rscMapper.saveCompany(member);
            return saveMember;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
	}
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 답변 리스트  조회 **/
	@Override
	public List<RscAnswerVO> RscAnsContentList(RscAnswerVO param) {
		// 
		List<RscAnswerVO> resultList = new ArrayList<RscAnswerVO>();
		try { 
			resultList = rscMapper.RscAnsContentList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 답변 리스트  조회 **/
	@Override
	public List<RscAnswerVO> RscAnsComList(RscAnswerVO param) {
		// 
		List<RscAnswerVO> resultList = new ArrayList<RscAnswerVO>();
		try { 
			resultList = rscMapper.RscAnsComList(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/** 2022년 실태조사 관리  > 대상기업 관리 > 답변 리스트  조회 **/
	@Override
	public List<RscAnswerVO> RscAnsqus01List(RscAnswerVO param) {
		// 
		List<RscAnswerVO> resultList = new ArrayList<RscAnswerVO>();
		try { 
			resultList = rscMapper.RscAnsqus01List(param);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
}
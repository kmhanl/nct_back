package kaits.nct.research.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kaits.nct.common.model.PagingVO;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.research.mapper.ResearchMapper;
import kaits.nct.research.mapper.ResearchMemberMapper;
import kaits.nct.research.model.IntoMemDTO;
import kaits.nct.research.model.IntoMemVO;
import kaits.nct.research.model.ResearchKeyVO;
import kaits.nct.research.model.ResearchMemberVO;
import kaits.nct.research.model.ResearchVO;
import kaits.nct.research.service.ResearchMemberService;
import kaits.nct.research.service.ResearchService;

@Service
public class ResearchServiceImpl implements ResearchService {
	private PagingVO paging;
	
	@Resource(name = "researchMapper")
	private ResearchMapper researchMapper;

	/**
	 * 로그인 처리
	 */
	@Override
	public List<ResearchVO> getResearchList(ResearchVO params) {
		// TODO Auto-generated method stub
		List<ResearchVO> resultList = new ArrayList<ResearchVO>();
		try { 
			resultList = researchMapper.getResearchList(params);
		} catch (Exception e) {
			System.out.println(e);
		}

		int totalRows = resultList.size();
		//tabList = researchMapper.getReceiptStatListGroupCount(params);
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);

		return resultList;
	}
	
	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}
	
	@Override
	public String MakeKey(ResearchKeyVO member) {
		// TODO Auto-generated method stub
        try {
            String makekey = DataScrty.encryptPassword(member.getRscMakekey());
            String makekey2 = makekey.replace("+","");
            return makekey2;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	/** 실태조사 대상 기업 인설트 리스트 **/
	@Override
	public String InsertRscMember(IntoMemDTO param) {
		// TODO Auto-generated method stub
		String rscCode = param.getRscCode();
		// 기술 명칭 데이터 추가
		//System.out.println(param.getAnsChoList());
		
		for (IntoMemVO intoAns : param.getIntoRscMemList()) {
			researchMapper.InsertMember(intoAns);
		}
		
		return rscCode;
	}
	
	/** 실태조사 테스트 이메일 발송 대상 기업 리스트 조회 **/
	@Override
	public List<ResearchMemberVO> getTargetList(ResearchMemberVO params) {
		// TODO Auto-generated method stub
		List<ResearchMemberVO> resultList = new ArrayList<ResearchMemberVO>();
		try { 
			resultList = researchMapper.getTargetList(params);
		} catch (Exception e) {
			System.out.println(e);
		}


		return resultList;
	}
	
	/** 실태조사 테스트 이메일 발송 대상 기업 리스트 조회 **/
	@Override
	public List<ResearchMemberVO> getTargetTestList(ResearchMemberVO params) {
		// TODO Auto-generated method stub
		List<ResearchMemberVO> resultList = new ArrayList<ResearchMemberVO>();
		try { 
			resultList = researchMapper.getTargetTestList(params);
		} catch (Exception e) {
			System.out.println(e);
		}


		return resultList;
	}
	/** 실태조사 테스트 이메일 발송 대상 기업 리스트 조회 **/
	@Override
	public List<ResearchMemberVO> getTarget01List(ResearchMemberVO params) {
		// TODO Auto-generated method stub
		List<ResearchMemberVO> resultList = new ArrayList<ResearchMemberVO>();
		try { 
			resultList = researchMapper.getTarget01List(params);
		} catch (Exception e) {
			System.out.println(e);
		}


		return resultList;
	}
	
}
package kaits.nct.policy.service.impl;

import java.util.ArrayList;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kaits.nct.policy.service.PolicyService;


import kaits.nct.common.model.PagingVO;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.member.mapper.MemberMapper;

import kaits.nct.policy.model.PolicyVO;
import kaits.nct.policy.mapper.PolicyMapper;
import kaits.nct.research.model.EndFileVO;

@Service
public class PolicyServiceImpl implements PolicyService {
private PagingVO paging;
	
	@Autowired
	private PolicyMapper policyMapper;
	
	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}
	
	// 접수 신청 - 임시 저장 - 메타 데이터 List<PolicyVO> getPolicyList(PolicyVO param);
	@Override
	public List<PolicyVO> getPolicyList(PolicyVO param) {
		// TODO Auto-generated method stub
		List<PolicyVO> policyList = new ArrayList<PolicyVO>();
		
		try { 
			policyList = policyMapper.getPolicyList(param);// 맵퍼에서 DB 조회 결과 받기
		} catch (Exception e) {
			System.out.println(e);
		}
		
		int totalRows = policyList.size();
		
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows); 
		return policyList;
	}
	
	// 접수 신청 - 임시 저장 - View 조회
		@Override
		public List<PolicyVO> getPolicyView(PolicyVO param) {
			// TODO Auto-generated method stub
			List<PolicyVO> policyView = new ArrayList<PolicyVO>();
			// 신규 접수 코드 생성
			//String policyCode = policyMapper.getPolicyCode();
			try {
				policyView = policyMapper.getPolicyView(param);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			return policyView;
		}
		
	// 접수 신청 - 임시 저장 - 메타 데이터 
	@Override
	public String InsertPolicyData(PolicyVO param) {
		// TODO Auto-generated method stub
		
		// 신규 접수 코드 생성
		String policyCode = policyMapper.getPolicyCode();
		try {
			String encPw = DataScrty.encryptPassword(param.getPolicyPassword());
			System.out.println(encPw);
			param.setPolicyPassword(encPw);
			param.setPolicyCode(policyCode);
			policyMapper.InsertPolicyData(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return policyCode;
	}
	
	@Override
	public List<EndFileVO> policyFileList(EndFileVO endFile) {
		// TODO Auto-generated method stub
		List<EndFileVO> policyFileList = new ArrayList<EndFileVO>();
		// 신규 접수 코드 생성
		//String policyCode = policyMapper.getPolicyCode();
		try {
			policyFileList = policyMapper.policyFileList(endFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return policyFileList;
	}
	
	
	@Override
	public String UpdataPolicyData(PolicyVO param) {
		// TODO Auto-generated method stub
		
		// 신규 접수 코드 생성
		String policyCode = param.getPolicyCode();
		try {
			String encPw = DataScrty.encryptPassword(param.getPolicyPassword());
			System.out.println(encPw);
			param.setPolicyPassword(encPw);
			param.setPolicyCode(policyCode);
			policyMapper.UpdataPolicyData(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return policyCode;
	}
	
	@Override
	public int getPassword(PolicyVO param) {
		String policyCode = param.getPolicyCode();
		String Password = param.getPolicyPassword();
		int result = 0;
		try {
			String encPw = DataScrty.encryptPassword(Password);
			param.setPolicyPassword(encPw);
			param.setPolicyCode(policyCode);
			result = policyMapper.getPassword(param);
			
		}catch (Exception e) {
            e.printStackTrace();
        }
		
		return result;
		
	}
	
	@Override
	public String setUpData(PolicyVO param) {
		// TODO Auto-generated method stub
		
		// 신규 접수 코드 생성
		String policyCode = param.getPolicyCode();
		String policyViewYn = param.getPolicyViewYn();
		String policyAnswer = param.getPolicyAnswer();
		String policySignId = param.getPolicySignId();
		try {
			
			param.setPolicyCode(policyCode);
			param.setPolicyViewYn(policyViewYn);
			param.setPolicyAnswer(policyAnswer);
			param.setPolicySignId(policySignId);
			policyMapper.setUpData(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return policyCode;
	}
}
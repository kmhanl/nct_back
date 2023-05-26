package kaits.nct.policy.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.policy.model.PolicyVO;
import kaits.nct.research.model.EndFileVO;

public interface  PolicyService {
	/** 기술유출 상담 저장 **/
	String InsertPolicyData(PolicyVO param);
	
	/** 기술유출 상담 리스트 조회 **/
	List<PolicyVO> getPolicyList(PolicyVO param);
	
	/** 기술유출 상담 View 조회 **/
	List<PolicyVO> getPolicyView(PolicyVO param);
	
	/** 페이징 데이터 조회 **/
	PagingVO getPaging();

	List<EndFileVO> policyFileList(EndFileVO endFile);

	String UpdataPolicyData(PolicyVO param);

	int getPassword(PolicyVO policyintoData);

	String setUpData(PolicyVO policyintoData);
}

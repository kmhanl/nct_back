package kaits.nct.policy.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import kaits.nct.policy.model.PolicyVO;
import kaits.nct.research.model.EndFileVO;

@Mapper
public interface PolicyMapper {
	
	/** 기술유출 상담 신규 코드 생성 **/
	public String getPolicyCode();
	
	/** 기술유출 상담 메타 데이터 저장  생성 **/
	public int InsertPolicyData(PolicyVO param);
	
	/** 기술유출 상담 메타 데이터 > Viewe 조회  **/
	public List<PolicyVO> getPolicyView(PolicyVO params);
	
	/** 기술유출 상담 메타 데이터 > 리스트 조회  **/
	public List<PolicyVO> getPolicyList(PolicyVO params);

	public List<EndFileVO> policyFileList(EndFileVO endFile);

	public void UpdataPolicyData(PolicyVO param);

	public int getPassword(PolicyVO param);

	public void setUpData(PolicyVO param);
	
	
	
}

package kaits.nct.rsc.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kaits.nct.rsc.model.RscAnswerVO;
import kaits.nct.rsc.model.RscDataVO;
import kaits.nct.rsc.model.RscForDataVO;
import kaits.nct.rsc.model.RscMemberVO;
import kaits.nct.rsc.model.RscStatusVO;

@Mapper
public interface RscMapper {
	
	/** 2022년 실태조사 관리 인덱스 > 최초인증 상태 값 리스트 조회 **/
	public List<RscStatusVO> RscInviStatList(RscStatusVO params);
	
	/** 2022년 실태조사 관리 인덱스 > 기관 기본 현황 상태 값 리스트 조회 **/
	public List<RscStatusVO> RscComStatList(RscStatusVO params);
	/** 2022년 실태조사 관리 인덱스 > 보유 기술 현황 상태 값 리스트 조회 **/
	public List<RscStatusVO> RscHaveStatList(RscStatusVO params);
	/** 2022년 실태조사 관리 인덱스 > 실태조사 현황 상태 값 리스트 조회 **/
	public List<RscStatusVO> RscInqStatList(RscStatusVO params);
	/** 2022년 실태조사 관리 인덱스 > 설문조사 현황 상태 값 리스트 조회 **/
	public List<RscStatusVO> RscSurStatList(RscStatusVO params);
	
	
	
	/** 2022년 실태조사 관리  > 대상기업 > 리스트  조회 **/
	public List<RscMemberVO> RscMemberList(RscMemberVO param);
	
	/** 2022년 실태조사 관리  > 대상기업 > 리스트  조회 **/
	public List<RscDataVO> RscDataList(RscDataVO param);
	public List<RscForDataVO> RscDataForList(RscForDataVO param);
	public List<RscForDataVO> RscDataForMemList(RscForDataVO param);
	
	/** 2022년 실태조사 관리  > 대상기업 > 리스트  조회 **/
	public List<RscMemberVO> getCompanyList(RscMemberVO param);
	
	/** 2022년 실태조사 관리  > 대상기업 > 1건 조회 **/
	public RscMemberVO loadCompany(RscMemberVO param);
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 대상기업 수정 저장  **/
	public int saveCompany(RscMemberVO member);
	
	/** 2022년 실태조사 관리  > 대상기업 > 답변 리스트  조회 **/
	public List<RscAnswerVO> RscAnsDataList(RscAnswerVO param);
	
	public List<RscAnswerVO> RscAnsComList(RscAnswerVO param);
	public List<RscAnswerVO> RscAnsContentList(RscAnswerVO param);
	
	public List<RscAnswerVO> RscAnsqus01List(RscAnswerVO param);
	
	
	
}

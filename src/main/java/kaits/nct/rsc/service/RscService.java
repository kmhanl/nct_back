package kaits.nct.rsc.service;

import java.util.List;
import java.util.Map;

import kaits.nct.common.model.PagingVO;
import kaits.nct.rsc.model.RscAnswerVO;
import kaits.nct.rsc.model.RscDataVO;
import kaits.nct.rsc.model.RscForDataVO;
import kaits.nct.rsc.model.RscMemberVO;
import kaits.nct.rsc.model.RscStatusVO;

public interface RscService {
	
	/** 2022년 실태조사 관리 인덱스 > 최초인증 상태 값 리스트 조회 **/
	List<RscStatusVO> RscInviStatList(RscStatusVO param);
	/** 2022년 실태조사 관리 인덱스 > 기관 기본 현황 상태 값 리스트 조회 **/
	List<RscStatusVO> RscComStatList(RscStatusVO param);
	/** 2022년 실태조사 관리 인덱스 > 보유 기술 현황 상태 값 리스트 조회 **/
	List<RscStatusVO> RscHaveStatList(RscStatusVO param);
	/** 2022년 실태조사 관리 인덱스 > 실태조사 현황 상태 값 리스트 조회 **/
	List<RscStatusVO> RscInqStatList(RscStatusVO param);
	/** 2022년 실태조사 관리 인덱스 > 설문조사 현황 상태 값 리스트 조회 **/
	List<RscStatusVO> RscSurStatList(RscStatusVO param);
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 리스트  조회 **/
	List<RscMemberVO> RscMemberList(RscMemberVO param);
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 데이터 기준 리스트  조회 **/
	List<RscDataVO> RscDataList(RscDataVO param);
	List<RscForDataVO> RscDataForList(RscForDataVO param);
	List<RscForDataVO> RscDataForMemList(RscForDataVO param);
	
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 데이터 문항 답변 리스트  조회 **/
	List<RscAnswerVO> RscAnsDataList(RscAnswerVO param);
	
	
	List<RscAnswerVO> RscAnsComList(RscAnswerVO param);
	List<RscAnswerVO> RscAnsqus01List(RscAnswerVO param);
	
	List<RscAnswerVO> RscAnsContentList(RscAnswerVO param);
	
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 대상기업 리스트  조회 **/
	List<RscMemberVO> getCompanyList(RscMemberVO param);
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 대상기업 1건  조회 **/
	RscMemberVO loadCompany(RscMemberVO param);
	
	/** 2022년 실태조사 관리 > 대상기업 관리 > 대상기업 수정 저장  **/
	int saveCompany(RscMemberVO member);
	
	
	
	
	/** 페이징 데이터 조회 **/
	PagingVO getPaging();
	
	
	
}
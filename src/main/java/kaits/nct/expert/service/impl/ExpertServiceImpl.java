package kaits.nct.expert.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kaits.nct.common.model.PagingVO;
import kaits.nct.expert.mapper.ExpertAgendaMapper;
import kaits.nct.expert.mapper.ExpertCommitteeMapper;
import kaits.nct.expert.mapper.ExpertReceiptMapper;
import kaits.nct.expert.model.ExDataInfoVO;
import kaits.nct.expert.model.ExDatePickStatusVO;
import kaits.nct.expert.model.ExpertCommitteeMemberSaveDTO;
import kaits.nct.expert.model.ExpertCommitteeMemberVO;
import kaits.nct.expert.model.ExpertCommitteeOpinionVO;
import kaits.nct.expert.model.ExpertCommitteeSaveDTO;
import kaits.nct.expert.model.ExpertCommitteeVO;
import kaits.nct.expert.model.ExpertCountryVO;
import kaits.nct.expert.model.ExpertFileVO;
import kaits.nct.expert.model.ExpertPrintOpinionVO;
import kaits.nct.expert.model.ExpertTabVO;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.ExpertTechVO;
import kaits.nct.expert.model.agenda.ExpertAgendaListVO;
import kaits.nct.expert.model.agenda.ExpertAgendaModifyDTO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.agenda.ExpertAgendaTechVO;
import kaits.nct.expert.model.agenda.ExpertAgendaVO;
import kaits.nct.expert.model.receipt.ExpertReceiptCountryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptDTO;
import kaits.nct.expert.model.receipt.ExpertReceiptHistoryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptSaveDTO;
import kaits.nct.expert.model.receipt.ExpertReceiptStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptTechVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.expert.service.ExpertService;

@Service
public class ExpertServiceImpl implements ExpertService {
	private PagingVO paging;
	private List<ExpertTabVO> tabList;

	@Autowired
	private ExpertReceiptMapper expertReceiptMapper;

	@Autowired
	private ExpertAgendaMapper expertAgendaMapper;

	@Autowired
	private ExpertCommitteeMapper expertCommitteeMapper;
	
	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}

	@Override
	public List<ExpertTabVO> getExpertTabList() {
		// TODO Auto-generated method stub
		return tabList;
	}
	
	@Override
	public List<ExpertReceiptVO> getReceiptList(ExpertReceiptVO params) {
		// TODO Auto-generated method stub
		List<ExpertReceiptVO> resultList = new ArrayList<ExpertReceiptVO>();
		try { 
			resultList = expertReceiptMapper.getReceiptStatList(params);
		} catch (Exception e) {
			System.out.println(e);
		}

		int totalRows = resultList.size();
		tabList = expertReceiptMapper.getReceiptStatListGroupCount(params);
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);

		return resultList;
	}

	@Override
	public List<ExpertReceiptTechVO> getReceiptTechList(ExpertReceiptTechVO param) {
		// TODO Auto-generated method stub
		return expertReceiptMapper.getReceiptStatTechList(param);
	}

	@Override
	public List<ExpertReceiptCountryVO> getReceiptCountryList(ExpertReceiptCountryVO param) {
		// TODO Auto-generated method stub
		return expertReceiptMapper.getReceiptCountryList(param);
	}

	@Override
	public List<ExpertFileVO> getReceiptFileList(ExpertFileVO param) {
		// TODO Auto-generated method stub
		return expertReceiptMapper.getReceiptStatFileList(param);
	}

	@Override
	public List<ExpertReceiptHistoryVO> getReceiptHistoryList(ExpertReceiptHistoryVO param) {
		// TODO Auto-generated method stub
		return expertReceiptMapper.getReceiptHistoryList(param);
	}

	@Override
	public List<ExpertAgendaStatVO> getAgendaStatList(ExpertAgendaStatVO params) {
		// TODO Auto-generated method stub
		List<ExpertAgendaStatVO> resultList = expertAgendaMapper.getAgendaStatList(params);
		int totalRows = resultList.size();
		tabList = expertAgendaMapper.getAgendaStatListGroupCount(params);
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);

		return resultList;
	}
	
	// 전문위원회 참석일 선택 상세 기본 정보 조회
	@Override
	public List<ExDataInfoVO> getExDateInfo(ExDataInfoVO params) {
		// TODO Auto-generated method stub
		List<ExDataInfoVO> resultList = expertCommitteeMapper.getExDateInfo(params);
		
		return resultList;
	}
	
	// 전문위원회 참석일 선택 현황 조회 > 위원회 키 > 멤버별 선택 현황 조회
	@Override
	public List<ExDatePickStatusVO> getDatePickStatus(ExDatePickStatusVO params) {
		// TODO Auto-generated method stub
		List<ExDatePickStatusVO> resultList = expertCommitteeMapper.getDatePickStatus(params);
		
		return resultList;
	}

	@Override
	public List<ExpertTechVO> getTechList() {
		// TODO Auto-generated method stub
		List<ExpertTechVO> techList = expertAgendaMapper.getTechList();
		return techList;
	}

	@Override
	public List<ExpertReceiptTechVO> getTechListWithCompetence(String rcptIdx) {
		// TODO Auto-generated method stub
		List<ExpertReceiptTechVO> resultList = new ArrayList<>();
		List<ExpertReceiptTechVO> competenceList = expertReceiptMapper
				.getReceiptCompetenceList(new ExpertReceiptTechVO(rcptIdx));

		for (ExpertTechVO tech : getTechList()) {
			ExpertReceiptTechVO result = new ExpertReceiptTechVO();
			result.setRcptIdx(rcptIdx);
			result.setTechNctCode(tech.getTechId());
			result.setTechName(tech.getTechName());
			result.setCompetence(false);
			for (ExpertReceiptTechVO competence : competenceList) {
				if (tech.getTechId().equals(competence.getTechNctCode())) {
					result.setCompetence(true);
				}
			}
			resultList.add(result);
		}

		return resultList;
	}

	@Override
	public void saveAgenda(ExpertAgendaVO param) {
		// TODO Auto-generated method stub

		// 안건 데이터 저장
		expertAgendaMapper.saveAgenda(param);

		// 접수 데이터 상태 변경 (안건 카운트 ++)
		expertReceiptMapper.updateAgendaReceiptStatus(new ExpertReceiptVO(param.getRcptIdx()));
	}

	@Override
	public void saveAgendaFile(ExpertFileVO param) {
		// TODO Auto-generated method stub
		expertAgendaMapper.saveAgendaFile(param);

	}

	@Override
	public void changeReceiptStatus(ExpertReceiptVO param) {
		// TODO Auto-generated method stub
		// 접수상태 변경
		expertReceiptMapper.updateReceiptStatus(param);
	}

	@Override
	public void saveReceiptHistory(ExpertReceiptHistoryVO param) {
		// TODO Auto-generated method stub
		// 접수 히스토리 생성
		expertReceiptMapper.saveReceiptHistory(param);

	}

	@Override
	public void saveReceiptCompetence(ExpertReceiptDTO expertReceiptDTO) {
		// TODO Auto-generated method stub

		ExpertReceiptTechVO param = new ExpertReceiptTechVO(expertReceiptDTO.getRcptIdx());
		param.setTechRegId(expertReceiptDTO.getUserId());
		expertReceiptMapper.deleteReceiptCompetence(param);

		for (String techId : expertReceiptDTO.getTechList()) {
			param.setTechNctCode(techId);
			expertReceiptMapper.saveReceiptCompetence(param);
		}
	}

	@Override
	public List<ExpertTechItemVO> getTechItemList(ExpertTechItemVO param) {
		// TODO Auto-generated method stub
		List<ExpertTechItemVO> techList = expertAgendaMapper.getTechItemList(param);
		return techList;
	}

	@Override
	public List<ExpertCountryVO> getCountryList(ExpertCountryVO param) {
		// TODO Auto-generated method stub
		List<ExpertCountryVO> countryList = expertReceiptMapper.getCountryList(param);
		return countryList;
	}

	@Override
	public String saveReceipt(ExpertReceiptSaveDTO param) {
		// TODO Auto-generated method stub
		// 신규 접수 코드 생성
//		String rcptIdx = expertReceiptMapper.getNewRcptIdx();
		String rcptIdx = expertReceiptMapper.getNewRcptStatCode();
		String metaCode = expertReceiptMapper.getNewMetaCode();
		// 접수 데이터 추가
		ExpertReceiptVO receiptData = param.getReceiptData();
		receiptData.setRcptIdx(rcptIdx);
		receiptData.setRcptRegId(param.getUserId());
		receiptData.setRcptMetaCode(metaCode);

		if ("N".equals(receiptData.getRcptComType())) {
			// 신규 기업 등록일 경우
			receiptData.setRcptComCode(expertReceiptMapper.getNewCpnId());
			expertReceiptMapper.saveComMember(receiptData);
		}

		expertReceiptMapper.saveMetaData(receiptData);
		expertReceiptMapper.saveReceiptStat(receiptData);

		// 접수분야 데이터 추가
		for (ExpertReceiptTechVO techEnt : param.getReceiptTechList()) {
			techEnt.setRcptIdx(rcptIdx);
			techEnt.setRcptMetaCode(metaCode);
			expertReceiptMapper.saveMetaTech(techEnt);
		}

		// 대상국 데이터 추가
		for (ExpertReceiptCountryVO contEnt : param.getReceiptCountryList()) {
			contEnt.setRcptIdx(rcptIdx);
			contEnt.setRcptMetaCode(metaCode);
			expertReceiptMapper.saveMetaCountry(contEnt);
		}

		// 관련 안건 데이터 추가
		for (ExpertAgendaStatVO agdEnt : param.getReceiptLinkAgdList()) {
			agdEnt.setRcptMetaCode(metaCode);
			expertReceiptMapper.saveMetaLinkAgenda(agdEnt);
		}

		return metaCode;
	}

	@Override
	public void saveCommittee(ExpertCommitteeSaveDTO param) {
		// TODO Auto-generated method stub
		String committeeIdx = expertCommitteeMapper.getNewCommitteeIdx(param.getCommitteeData());

		// 전문위원회 데이터 추가
		ExpertCommitteeVO committeeData = param.getCommitteeData();
		committeeData.setCommitteeIdx(committeeIdx);
		committeeData.setLastUpdusrId(param.getUserId());
		System.out.println("전문위원회 > 위원회 현황 > 전문위 취소================>"+committeeData);
		expertCommitteeMapper.saveCommitteeInfo(committeeData);
		
		// 전문위원회 안건에 전문위원회 번호 추가
		int index = 1;
		for (String agdCode : param.getCommitteeAgendaList()) {
			ExpertAgendaStatVO agenda = new ExpertAgendaStatVO();
			agenda.setIndex(index++);
			agenda.setAgdCode(agdCode);
			agenda.setAgdExIdx(committeeIdx);
			agenda.setAdmId(param.getUserId());
			agenda.setAgdStatus(committeeData.getCommitteeStatus());
			expertCommitteeMapper.updateAgendaAfterSaveCommittee(agenda);
		}

		// 전문위원회 구성원 추갸
		for (ExpertCommitteeMemberVO member : param.getCommitteeMemberList()) {
			member.setCommitteeIdx(committeeIdx);
			expertCommitteeMapper.saveCommitteeMember(member);
		}

		// 전문위원회 의견 추갸
		for (ExpertCommitteeOpinionVO member : param.getCommitteeOpinionList()) {
			member.setCommitteeIdx(committeeIdx);
			expertCommitteeMapper.insertCommitteeOpinion(member);
		}
	}

	@Override
	public List<ExpertCommitteeVO> getDatepickList(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		List<ExpertCommitteeVO> resultList = expertCommitteeMapper.getCommitteeList(param);
		
		int totalRows = resultList.size();
		/* tabList = expertCommitteeMapper.getCommitteeListGroupCount(param); */
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);

		return resultList;
	}
	
	@Override
	public List<ExpertCommitteeVO> getExpMemList(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		List<ExpertCommitteeVO> resultList = expertCommitteeMapper.getExpMemList(param);
		
		int totalRows = resultList.size();
		/* tabList = expertCommitteeMapper.getCommitteeListGroupCount(param); */
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);

		return resultList;
	}
	
	@Override
	public ExpertCommitteeVO exeInfoData(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		ExpertCommitteeVO returnData = null;
		List<ExpertCommitteeVO> resultData = expertCommitteeMapper.exeInfoData(param);
		if (resultData.size() != 0) {
			returnData = resultData.get(0);
		}
		return returnData;
	}
	
	@Override
	public ExpertCommitteeVO expIdxInfoData(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		ExpertCommitteeVO returnData = null;
		List<ExpertCommitteeVO> resultData = expertCommitteeMapper.expIdxInfoData(param);
		if (resultData.size() != 0) {
			returnData = resultData.get(0);
		}
		return returnData;
	}
	
	
	@Override
	public List<ExpertCommitteeVO> getDatePList(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		List<ExpertCommitteeVO> resultList = expertCommitteeMapper.getDatePList(param);
		System.out.println("=impl===============>"+ resultList);
		int totalRows = resultList.size();
		
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);
		return resultList;
	}
	@Override
	public List<ExpertCommitteeVO> getExLiveList(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		List<ExpertCommitteeVO> resultList = expertCommitteeMapper.getExLiveList(param);
		System.out.println("=impl===============>"+ resultList);
		int totalRows = resultList.size();
		
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows);
		return resultList;
	}

	@Override
	public String getAgdCode(ExpertAgendaStatVO param) {
		return expertAgendaMapper.getNewAgdStatCode(param);
	}

	@Override
	public void saveAgendaStat(ExpertAgendaStatVO param) {
		// TODO Auto-generated method stub

		// 안건 데이터 저장
		expertAgendaMapper.saveAgendaStat(param);

		// 트리거에서 처리되도록 수정
//		// 접수 데이터 상태 변경 (안건 카운트 ++)
//		expertReceiptMapper.updateAgendaReceiptStatus(new ExpertReceiptVO(param.getRcptCode()));

	}

	@Override
	public String modifyAgenda(ExpertAgendaModifyDTO param) {
		// TODO Auto-generated method stub
		ExpertAgendaStatVO agendaVO = new ExpertAgendaStatVO();
		agendaVO.setAdmId(param.getUserId());

		for (String agdCode : param.getNoExList()) {
			agendaVO.setAgdExIdx(null);
			agendaVO.setAgdCode(agdCode);
			expertAgendaMapper.updateAgdExIdx(agendaVO);
		}
		for (String agdCode : param.getExList()) {
			agendaVO.setAgdExIdx(param.getCommitteeIdx());
			agendaVO.setAgdCode(agdCode);
			expertAgendaMapper.updateAgdExIdx(agendaVO);
		}
		return param.getCommitteeIdx();
	}

	@Override
	public List<ExpertCommitteeMemberVO> getCommitteeMemberList(ExpertCommitteeMemberVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.getCommitteeMemberList(param);
	}
	
	@Override
	public ExpertCommitteeMemberVO getLoginMemberStat(ExpertCommitteeMemberVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.getLoginMemberStat(param);
	}

	@Override
	public String modifyMember(ExpertCommitteeMemberSaveDTO param) {
		// TODO Auto-generated method stub
		ExpertCommitteeMemberVO committeeMemberVO = new ExpertCommitteeMemberVO();
		committeeMemberVO.setCommitteeIdx(param.getCommitteeIdx());
		committeeMemberVO.setCommitteeTechId(param.getCommitteeTechId());

		List<ExpertCommitteeMemberVO> currMemberList = expertCommitteeMapper.getCommitteeMemberList(committeeMemberVO);

		for (String admId : param.getNoCheckList()) {
			// 현재 구성원이 아닌지 확인 후 삭제
			boolean isAlreadyNoCheck = false;
			for (ExpertCommitteeMemberVO cm : currMemberList) {
				if (cm.getAdmId().equals(admId) && cm.getCommitteeIdx() == null) {
					isAlreadyNoCheck = true;
					break;
				}
			}
			if (!isAlreadyNoCheck) {
				// 구성 인원 => 해제된 경우
				// 위원 테이블 데이터 삭제
				committeeMemberVO.setAdmId(admId);
				expertCommitteeMapper.deleteCommitteeMember(committeeMemberVO);
			}
		}
		for (String admId : param.getCheckList()) {
			// 이미 구성원인지 확인 후 저장
			boolean isAlreadyCheck = false;
			for (ExpertCommitteeMemberVO cm : currMemberList) {
				if (cm.getAdmId().equals(admId) && cm.getCommitteeIdx() != null) {
					isAlreadyCheck = true;
					break;
				}
			}
			if (!isAlreadyCheck) {
				// 구성 인원 제외 => 구성 인원 설정된 경우
				// 위원 테이블 데이터 추가
				committeeMemberVO.setAdmId(admId);
				expertCommitteeMapper.saveCommitteeMember(committeeMemberVO);
			}
		}
		return param.getCommitteeIdx();
	}

	@Override
	public ExpertCommitteeVO getCommitteeData(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		ExpertCommitteeVO returnData = null;
		List<ExpertCommitteeVO> resultList = expertCommitteeMapper.getCommitteeList(param);
		if (resultList.size() != 0) {
			returnData = resultList.get(0);
		}
		return returnData;
	}

	@Override
	public String modifyCommitteeDate(ExpertCommitteeSaveDTO param) {
		// TODO Auto-generated method stub
		ExpertCommitteeVO upParam = param.getCommitteeData();
		expertCommitteeMapper.updateCommitteeInfo(upParam);
		return upParam.getCommitteeIdx();
	}

	@Override
	public List<ExpertAgendaStatVO> getSearchAgendaCode(ExpertAgendaStatVO param) {
		// TODO Auto-generated method stub
		List<ExpertAgendaStatVO> list = expertAgendaMapper.searchAgendaCode(param);
		return list;
	}

	@Override
	public void deleteMetaData(ExpertReceiptStatVO param) {
		// TODO Auto-generated method stub

		expertReceiptMapper.deleteMeta(param);

	}
	
	/**
	 * 전문위원회 - 자료 열람 비밀 유지 동의 저장 
	 * @param ExpertCommitteeMemberVO
	 * @return
	 */
	@Override
	public void updateCommitteeAgreeView(ExpertCommitteeMemberVO param) {
		expertCommitteeMapper.updateCommitteeAgreeView(param);
	}
	
	
	
	@Override
	public void saveCommitteeOpinion(ExpertCommitteeOpinionVO param) {
		// TODO Auto-generated method stub
		int result = expertCommitteeMapper.selectCommitteeOpinionCount(param);
		if (result > 0) {
			expertCommitteeMapper.updateCommitteeOpinion(param);
		} else {
			expertCommitteeMapper.insertCommitteeOpinion(param);
		}
	}

	@Override
	public void saveCommitteeMember(ExpertCommitteeMemberVO param) {
		// TODO Auto-generated method stub

		expertCommitteeMapper.updateCommitteeMember(param);
	}

	@Override
	public void confirmCommitteeInfo(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub

		expertCommitteeMapper.updateCommitteeInfoConfirmation(param);

	}

	@Override
	public void cancelCommitteeInfo(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub

		expertCommitteeMapper.updateCommitteeInfoCancel(param);

	}

	@Override
	public List<ExpertCommitteeOpinionVO> getCommitteOpinionGroupList(ExpertCommitteeOpinionVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.selectCommitteeOpinionGroupCount(param);
	}
	
	@Override
	public List<ExpertCommitteeOpinionVO> expMemOpinionList(ExpertCommitteeOpinionVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.expMemOpinionList(param);
	}
	
	@Override
	public List<ExpertPrintOpinionVO> expMemPrintList(ExpertPrintOpinionVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.expMemPrintList(param);
	}
	
	@Override
	public ExpertCommitteeOpinionVO getCommitteeOpinionData(ExpertCommitteeOpinionVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.selectCommitteeOpinion(param);
	}

	@Override
	public void saveCommitteeOpinionStat(ExpertCommitteeMemberVO param) {
		// TODO Auto-generated method stub
		System.out.println(param);
		expertCommitteeMapper.updateCommitteeMemberStat(param);
	}

	@Override
	public void setAgendaComplete(ExpertAgendaStatVO param) {
		// TODO Auto-generated method stub
		expertAgendaMapper.updateAgdStatusComplete(param);
	}

	@Override
	public void setCommitteeStatusCS(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		param.setCommitteeStatus("CO");
		expertCommitteeMapper.updateCommitteeInfoStatus(param);
	}

	@Override
	public void deleteAgenda(ExpertAgendaStatVO param) {
		// TODO Auto-generated method stub
		expertAgendaMapper.deleteAgenda(param);

	}

	@Override
	public List<ExpertAgendaListVO> expAgendaList(ExpertAgendaListVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.expAgendaList(param);
	}
	
	@Override
	public List<ExpertAgendaListVO> expAgendaTList(ExpertAgendaListVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.expAgendaTList(param);
	}
	
	@Override
	public List<ExpertAgendaListVO> getAgendaList(ExpertAgendaListVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.getAgendaList(param);
	}
	
	@Override
	public List<ExpertAgendaListVO> getAgendaTList(ExpertAgendaListVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.getAgendaTList(param);
	}
	
	@Override
	public List<ExpertAgendaTechVO> getTechAreaList(ExpertAgendaTechVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.getTechAreaList(param);
	}
	
	@Override
	public List<ExpertAgendaStatVO> getCommitteAgendaList(ExpertAgendaStatVO param) {
		// TODO Auto-generated method stub
		return expertCommitteeMapper.getCommitteeAgendaList(param);
	}

	@Override
	public void startCommitteeInfo(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		param.setCommitteeStatus("CI");
		expertCommitteeMapper.updateCommitteeInfoStatus(param);
	}
	
	@Override
	public void stopCommitteeInfo(ExpertCommitteeVO param) {
		// TODO Auto-generated method stub
		param.setCommitteeStatus("CC");
		expertCommitteeMapper.updateCommitteeInfoStatus(param);
	}
	
	
	@Override
	public int  setReceiptCnt(ExpertReceiptVO param) {
		// TODO Auto-generated method stub
		//param.setCommitteeStatus("CC");
		//expertCommitteeMapper.updateCommitteeInfoStatus(param);
	     int cnt = 0;
	      
	      cnt = expertReceiptMapper.setReceiptCnt(param);
	      
	     return cnt;
	
	}
	
	@Override
	public void setDelete(ExpertReceiptVO param) {
		// TODO Auto-generated method stub
		// 접수상태 변경
		expertReceiptMapper.setDelete(param);
	}
}

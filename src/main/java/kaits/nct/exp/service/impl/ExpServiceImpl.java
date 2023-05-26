package kaits.nct.exp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;

import kaits.nct.common.model.PagingVO;
import kaits.nct.exp.mapper.ExpMapper;
import kaits.nct.exp.model.ExpAgdHistoryVO;
import kaits.nct.exp.model.ExpAgdListVO;
import kaits.nct.exp.model.ExpListTabVO;
import kaits.nct.exp.model.ExpListTechVO;
import kaits.nct.exp.model.ExpLoadFileVO;
import kaits.nct.exp.model.ExpNctTechVO;
import kaits.nct.exp.model.ExpRecCompeVO;
import kaits.nct.exp.model.ExpRecConturyVO;
import kaits.nct.exp.model.ExpRecHistoryVO;
import kaits.nct.exp.model.ExpRecListVO;
import kaits.nct.exp.model.ExpRecTechVO;
import kaits.nct.exp.model.ExpRecUpdateVO;
import kaits.nct.exp.model.ExpMetaVO;
import kaits.nct.exp.model.ExpRecSaveDTO;
import kaits.nct.exp.model.ExpSchComVO;
import kaits.nct.exp.model.ExpSendAgdDTO;
import kaits.nct.exp.model.ExpTopTabVO;
import kaits.nct.exp.model.ExtRecCompeDTO;
import kaits.nct.exp.service.ExpService;
import kaits.nct.expert.model.ExpertFileVO;
import kaits.nct.expert.model.ExpertTechItemVO;
import kaits.nct.expert.model.agenda.ExpertAgendaStatVO;
import kaits.nct.expert.model.receipt.ExpertReceiptCountryVO;
import kaits.nct.expert.model.receipt.ExpertReceiptSaveDTO;
import kaits.nct.expert.model.receipt.ExpertReceiptTechVO;
import kaits.nct.expert.model.receipt.ExpertReceiptVO;
import kaits.nct.member.model.ComMemberVO;





@Service
public class ExpServiceImpl implements ExpService {
	
	@Autowired
	private ExpMapper expMapper;
	
	private PagingVO paging;
	private List<ExpTopTabVO> topTap;
	private List<ExpTopTabVO> listTap;
	
	private List<ExpListTechVO> listTechCnt;
	private List<ExpListTechVO> listTechList;
	
	
	//private List<ExpertTabVO> tabList;
	
	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}
	
	@Override
	public List<ExpTopTabVO> recListTap() {
		// TODO Auto-generated method stub
		return topTap;
	}
	
	@Override
	public List<ExpTopTabVO> agdListTap() {
		// TODO Auto-generated method stub
		return listTap;
	}
	
	
	@Override
	public List<ExpListTechVO> expListTechCnt() {
		// TODO Auto-generated method stub
		return listTechCnt;
	}
	
	@Override
	public List<ExpListTechVO> expListTechList() {
		// TODO Auto-generated method stub
		return listTechList;
	}
	
	/**
	 * 공통 국가 핵심 기술 분야 명칭 조회 
	 * @param ExpNctTechVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpNctTechVO> nctTech(ExpNctTechVO params) {
		// TODO Auto-generated method stub
		List<ExpNctTechVO> resultList = new ArrayList<ExpNctTechVO>();
		try { 
			resultList = expMapper.nctTech(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/**
	 * 공통 로그인한 계정의 기술 분야 권한 조회 
	 * @param ExpNctTechVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpNctTechVO> haveTech(ExpNctTechVO params) {
		// TODO Auto-generated method stub
		List<ExpNctTechVO> resultList = new ArrayList<ExpNctTechVO>();
		try { 
			resultList = expMapper.haveTech(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	
	
	/**
	 * 공통 리스트 접수 현황 히스토리 / 검토의견 저장 처리 
	 * @param ExpRecHistoryVO
	 * @param params
	 * @return
	 */
	@Override
	public void insertRecHistory(ExpRecHistoryVO param) {
		expMapper.insertRecHistory(param);
	}
	
	/**
	 * 전문위원회 -  공통 리스트 접수 신청서 라스트 상태 업데이트 
	 * @param ExpRecUpdateVO
	 * @param params
	 * @return
	 */
	@Override
	public void updateRecStat(ExpRecUpdateVO param) {
		expMapper.updateRecStat(param);
	}
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 대상 기업 조회 (자동 검색 / 셀렉트) 
	 * @param ExpSchComVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpSchComVO> schCompany(ExpSchComVO param) {
		// TODO Auto-generated method stub
		List<ExpSchComVO> resultList = expMapper.schCompany(param);

		return resultList;
	}
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 기술 분야 기술 범위 조회
	 * @param ExpSchComVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpNctTechVO> loadTechAreaList(ExpNctTechVO param) {
		// TODO Auto-generated method stub
		List<ExpNctTechVO> techList = expMapper.loadTechAreaList(param);
		return techList;
	}
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 접수현황 > 신규 등록 >> 신규 등록  채번 
	 * @param ExpSchComVO
	 * @param params
	 * @return
	 */
	@Override
	public String makeNewCode(ExpMetaVO param) {
		// TODO Auto-generated method stub
		String metaCode = expMapper.makeNewMetaCode();
		

		return metaCode;
	}
	
	/**
	 * 전문위원회 - 접수현황 >> 신규 등록 > 접수현황 > 신규 등록 >> 데이터 저장
	 * @param ExpSchComVO
	 * @param params
	 * @return
	 */
	@Override
	public String saveMetaData(ExpRecSaveDTO param) {
		
		String metaCode = param.getMetaCode();
		String metaDateTime = param.getMetaDateTime();
		String admGroup = param.getAdmGroup();
		String admIp = param.getAdmIp();
		
		//메타 데이터 저장 처리 
		ExpMetaVO metaData = param.getRecMetaData();
		metaData.setNctMetaCode(metaCode);
		metaData.setNctMetaRegiId(param.getUserId());
		metaData.setNctMetaLastId(param.getUserId());
		metaData.setNctMetaRegi(metaDateTime);
		metaData.setNctMetaLast(metaDateTime);
		metaData.setAdmId(param.getUserId());
		
		String nctRecCode = expMapper.makeNewRecCode();
		metaData.setNctRecCode(nctRecCode);
		System.out.println("META_SAVE_IMPL : "+metaCode+":"+metaDateTime+":"+nctRecCode);
		System.out.println("META: "+metaData);
		expMapper.saveMetaData(metaData);
		
		//접수  데이터 저장 처리
		ExpMetaVO recData = param.getRecMetaData();
		recData.setNctRecCode(nctRecCode);
		recData.setNctMetaCode(metaCode);
		recData.setNctRecStatusLast(metaDateTime);
		recData.setNctRecStatusLastId(param.getUserId());
		System.out.println("REC: "+recData);
		expMapper.saveRecData(recData);
		
		//접수 데이터 히스토리 생성
		ExpRecHistoryVO recHis = new ExpRecHistoryVO();
		recHis.setNctRecCode(nctRecCode);
		recHis.setNctRecHisCode("H100");
		recHis.setNctRecStatus("REC200");
		recHis.setHisAmgGruop(admGroup);
		recHis.setHisComment("");
		recHis.setHisRegId(param.getUserId());
		recHis.setHisRegIp(admIp);
		recHis.setHisRegDt(metaDateTime);
		expMapper.insertRecHistory(recHis);

		// 기술 분야 및 명칭 데이터 추가
		for (ExpRecTechVO techEnt : param.getRecTechList()) {
			techEnt.setNctMetaCode(metaCode);
			expMapper.saveMetaTech(techEnt);
		}

		// 대상국 데이터 추가
		for (ExpRecConturyVO contEnt : param.getRecCountryList()) {
			contEnt.setNctMetaCode(metaCode);
			expMapper.saveMetaCountry(contEnt);
		}

		// 관련 안건 데이터 추가
		//for (ExpertAgendaStatVO agdEnt : param.getReceiptLinkAgdList()) {
		//	agdEnt.setRcptMetaCode(metaCode);
		//	expertReceiptMapper.saveMetaLinkAgenda(agdEnt);
		//}

		return nctRecCode;
	}
	
	/**
	 * 전문위원회 - 전문위원회 -  안건현황 > 리스트 > 검토 요청   데이터 저장
	 * @param ExpSendAgdDTO
	 * @param params
	 * @return
	 */
	@Override
	public String saveSendData(ExpSendAgdDTO param) {
		System.out.println("안건 데이터 저장imp : "+param);
		String userId = param.getUserId();
		String metaDateTime = param.getMetaDateTime();
		String admGroup = param.getAdmGroup();
		String admIp = param.getAdmIp();
		
		// 접수 DB 상태 update 및 히스토리 Insert  
		for (ExpRecUpdateVO recUp : param.getSendMetaList()) {
			recUp.setNctRecStatus("REC600");
			recUp.setNctRecStatusLast(metaDateTime);
			recUp.setNctRecStatusLastId(userId);
			expMapper.updateSendRec(recUp);
			ExpRecHistoryVO recHis = new ExpRecHistoryVO();
			recHis.setNctRecCode(recUp.getNctRecCode());
			recHis.setNctRecHisCode("H100");
			recHis.setNctRecStatus("REC600");
			recHis.setHisAmgGruop(admGroup);
			recHis.setHisComment("");
			recHis.setHisRegId(param.getUserId());
			recHis.setHisRegIp(admIp);
			recHis.setHisRegDt(metaDateTime);
			expMapper.insertRecHistory(recHis);
		}
		
		// 안건 DB 상태 update 및 히스토리 Insert  
		for (ExpAgdListVO agdCode : param.getSendagdList()) {
			agdCode.setNctAgdStatus("AGD100");
			agdCode.setNctAgdRegDate(metaDateTime);
			agdCode.setNctAgdRegId(userId);
			agdCode.setNctAgdStatusLast(metaDateTime);
			agdCode.setNctAgdStatusLastId(userId);
			System.out.println("안건 데이터  추가ㅏ :"+agdCode);
			expMapper.insertNewAgd(agdCode);
			
			ExpAgdHistoryVO agdHis = new ExpAgdHistoryVO();
			agdHis.setNctAgdCode(agdCode.getNctAgdCode());
			agdHis.setNctAgdHisCode("H100");
			agdHis.setNctAgdStatus("AGD100");
			agdHis.setHisAmgGruop(admGroup);
			agdHis.setHisComment("");
			agdHis.setHisRegId(param.getUserId());
			agdHis.setHisRegIp(admIp);
			agdHis.setHisRegDt(metaDateTime);
			
			System.out.println("안건 히스토리 추가ㅏ :"+agdCode);
			expMapper.insertAgdHistory(agdHis);
		}
		
		
		return userId;
	}
	
	/**
	 * 전문위원회 - 접수현황 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpRecListVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpRecListVO> loadListRec(ExpRecListVO params) {
		// TODO Auto-generated method stub
		List<ExpRecListVO> resultList = new ArrayList<ExpRecListVO>();
		try { 
			resultList = expMapper.loadListRecPage(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		List<ExpListTechVO> techCnt = new ArrayList<ExpListTechVO>();
		List<ExpListTechVO> techList = new ArrayList<ExpListTechVO>();
		
		for (ExpRecListVO returnCode : resultList) {
			System.out.println("code == > "+ returnCode.getNctMetaCode());
			
			List<ExpListTechVO> cntresult = new ArrayList<ExpListTechVO>();
			cntresult = expMapper.expComListTechCnt(returnCode.getNctMetaCode());
			
			List<ExpListTechVO> listresult = new ArrayList<ExpListTechVO>();
			listresult = expMapper.expComListTechList(returnCode.getNctMetaCode());
			
			techCnt.addAll(cntresult);
			techList.addAll(listresult);
		}
		listTechCnt = techCnt;
		listTechList = techList;
		
		List<ExpRecListVO> listTotal = new ArrayList<ExpRecListVO>();
		listTotal = expMapper.loadListRecTotal(params);
		int totalRows = listTotal.size();
		topTap = expMapper.loadListRecTap(params);
		
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);

		return resultList;
	}
	
	/**
	 * 전문위원회 - 안건현황 리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpAgdListVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpAgdListVO> loadListAgd(ExpAgdListVO params) {
		// TODO Auto-generated method stub
		List<ExpAgdListVO> resultList = new ArrayList<ExpAgdListVO>();
		try { 
			resultList = expMapper.loadListAgdPage(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("리스트는  == > "+ resultList.size());
		
		// 조회된 리스트의 NCT_META_CODE를 기준으로 기술 분야 카운트 
		List<ExpListTechVO> techCnt = new ArrayList<ExpListTechVO>();
		List<ExpListTechVO> techList = new ArrayList<ExpListTechVO>();
		for (ExpAgdListVO returnCode : resultList) {
			System.out.println("code == > "+ returnCode.getNctMetaCode());
			
			List<ExpListTechVO> cntresult = new ArrayList<ExpListTechVO>();
			cntresult = expMapper.expComListTechCnt(returnCode.getNctMetaCode());
			
			List<ExpListTechVO> listresult = new ArrayList<ExpListTechVO>();
			listresult = expMapper.expComListTechList(returnCode.getNctMetaCode());
			
			techCnt.addAll(cntresult);
			techList.addAll(listresult);
		}
		
		
		listTechCnt = techCnt;
		listTechList = techList;
		
		List<ExpAgdListVO> listTotal = new ArrayList<ExpAgdListVO>();
		listTotal = expMapper.loadListAgdTotal(params);
		int totalRows = listTotal.size();
		listTap = expMapper.loadListAgdTap(params);
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);

		return resultList;
	}
	
	/**
	 * 전문위원회 - 검토 준비중  리스트 조회  >> 기술안보과, 보호협회, 기밀 센터 
	 * @param ExpAgdListVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpAgdListVO> loadListRdy(ExpAgdListVO params) {
		// TODO Auto-generated method stub
		List<ExpAgdListVO> resultList = new ArrayList<ExpAgdListVO>();
		try { 
			resultList = expMapper.loadListRdyPage(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("리스트는  == > "+ resultList.size());
		
		// 조회된 리스트의 NCT_META_CODE를 기준으로 기술 분야 카운트 
		List<ExpListTechVO> techCnt = new ArrayList<ExpListTechVO>();
		List<ExpListTechVO> techList = new ArrayList<ExpListTechVO>();
		for (ExpAgdListVO returnCode : resultList) {
			System.out.println("code == > "+ returnCode.getNctMetaCode());
			
			List<ExpListTechVO> cntresult = new ArrayList<ExpListTechVO>();
			cntresult = expMapper.expComListTechCnt(returnCode.getNctMetaCode());
			
			List<ExpListTechVO> listresult = new ArrayList<ExpListTechVO>();
			listresult = expMapper.expComListTechList(returnCode.getNctMetaCode());
			
			techCnt.addAll(cntresult);
			techList.addAll(listresult);
		}
		
		
		listTechCnt = techCnt;
		listTechList = techList;
		
		List<ExpAgdListVO> listTotal = new ArrayList<ExpAgdListVO>();
		listTotal = expMapper.loadListRdyTotal(params);
		int totalRows = listTotal.size();
		listTap = expMapper.loadListRdyTap(params);
		paging = new PagingVO(params.getPageNo(), params.getPageRows(), totalRows);

		return resultList;
	}
	
	/**
	 * 전문위원회 - 검토 준비중 리스트 > 위원회 구성 > 안건 추가 팝업 > 안건 조회   
	 * @param ExpAgdListVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpAgdListVO> loadListAddAgd(ExpAgdListVO params) {
		// TODO Auto-generated method stub
		List<ExpAgdListVO> resultList = new ArrayList<ExpAgdListVO>();
		try { 
			resultList = expMapper.loadListAddAgd(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("리스트는  == > "+ resultList.size());
		
		return resultList;
	}
	
	/**
	 * 전문위원회 - 공통 > 신청 서 + 메타 상세 조회 
	 * @param ExpMetaVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpMetaVO> loadViewRecMeta(ExpMetaVO params) {
		// TODO Auto-generated method stub
		List<ExpMetaVO> resultList = new ArrayList<ExpMetaVO>();
		try { 
			resultList = expMapper.loadViewRecMeta(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	@Override
	public List<ExpMetaVO> loadViewAgdMeta(ExpMetaVO params) {
		// TODO Auto-generated method stub
		List<ExpMetaVO> resultList = new ArrayList<ExpMetaVO>();
		try { 
			resultList = expMapper.loadViewAgdMeta(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 기술 명칭 리스트 조회
	 * @param ExpRecTechVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpRecTechVO> expRecViewTech(ExpRecTechVO params) {
		// TODO Auto-generated method stub
		List<ExpRecTechVO> resultList = new ArrayList<ExpRecTechVO>();
		try { 
			resultList = expMapper.expRecViewTech(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 대상국 리스트  조회
	 * @param ExpRecConturyVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpRecConturyVO> expRecViewCountury(ExpRecConturyVO params) {
		// TODO Auto-generated method stub
		List<ExpRecConturyVO> resultList = new ArrayList<ExpRecConturyVO>();
		try { 
			resultList = expMapper.expRecViewCountury(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 히스토리 리스트  조회
	 * @param ExpRecHistoryVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpRecHistoryVO> expRecViewHistory(ExpRecHistoryVO params) {
		// TODO Auto-generated method stub
		List<ExpRecHistoryVO> resultList = new ArrayList<ExpRecHistoryVO>();
		try { 
			resultList = expMapper.expRecViewHistory(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 검토 권한 리스트  조회
	 * @param ExpRecCompeVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpRecCompeVO> expRecViewCompe(ExpRecCompeVO params) {
		// TODO Auto-generated method stub
		List<ExpRecCompeVO> resultList = new ArrayList<ExpRecCompeVO>();
		try { 
			resultList = expMapper.expRecViewCompe(params);
		} catch (Exception e) {
			System.out.println(e);
		}
		return resultList;
	}
	
	
	/**
	 * 전문위원회 - 접수현황 상세 조회  >> 첨부 파일 조회
	 * @param ExpRecCompeVO
	 * @param params
	 * @return
	 */
	@Override
	public List<ExpLoadFileVO> expViewFile(ExpLoadFileVO param) {
		// TODO Auto-generated method stub
		return expMapper.expViewFile(param);
	}
	
	/**
	 * 전문위원회 - 접수현황 상세  >> 의견 첨부 권한 저장
	 * @param ExpRecCompeVO
	 * @param params
	 * @return
	 */
	@Override
	public void saveRecCompe(ExtRecCompeDTO expertReceiptDTO) {
		// TODO Auto-generated method stub
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
    	SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	String nowTime = fourteen_format.format(date_now);
    	
		ExpRecCompeVO param = new ExpRecCompeVO();
		param.setNctRecCode(expertReceiptDTO.getNctRecCode());
		param.setNctComRegiId(expertReceiptDTO.getAdmId());
		param.setNctComRegiDt(nowTime);
		expMapper.delRecCompe(param);
		if (expertReceiptDTO.getTechList() != null ) {
			for (String techId : expertReceiptDTO.getTechList()) {
				param.setNctTechCode(techId);
				param.setNctComRegiDt(nowTime);
				expMapper.saveRecCompe(param);
			}
		}
		
	}
	
	
	
	
	
	
	
	
}

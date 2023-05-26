package kaits.nct.board.service.impl;

import java.util.ArrayList;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kaits.nct.board.service.BoardService;


import kaits.nct.common.model.PagingVO;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.member.mapper.MemberMapper;
import kaits.nct.policy.mapper.PolicyMapper;
import kaits.nct.policy.model.PolicyVO;
import kaits.nct.policy.service.PolicyService;
import kaits.nct.board.model.BoardVO;
import kaits.nct.board.mapper.BoardMapper;
import kaits.nct.research.model.EndFileVO;

@Service
public class BoardServiceImpl implements BoardService {
	private PagingVO paging;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;

	
	
	@Override
	public String InsertBoardData(BoardVO param) {
		// TODO Auto-generated method stub
		
		String infoBoardCode = boardMapper.getInfoBoardCode();
		try {

			param.setInfoBoardCode(infoBoardCode);
			boardMapper.InsertBoardData(param);
		}catch (Exception e) {
            e.printStackTrace();
        }
		return infoBoardCode;
		
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO param) {
		// TODO Auto-generated method stub
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		try { 
			boardList = boardMapper.getBoardList(param);// 맵퍼에서 DB 조회 결과 받기
		} catch (Exception e) {
			System.out.println(e);
		}
		
		int totalRows = boardList.size();
		
		paging = new PagingVO(param.getPageNo(), param.getPageRows(), totalRows); 
		return boardList;
	}

	@Override
	public List<BoardVO> getBoardView(BoardVO param) {
		// TODO Auto-generated method stub
		List<BoardVO> boardView = new ArrayList<BoardVO>();
		// 신규 접수 코드 생성
		//String policyCode = policyMapper.getPolicyCode();
		try {
			boardView = boardMapper.getBoardView(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return boardView;
	}

	@Override
	public PagingVO getPaging() {
		// TODO Auto-generated method stub
		return paging;
	}

	@Override
	public List<EndFileVO> BoardFileList(EndFileVO endFile) {
		// TODO Auto-generated method stub
		List<EndFileVO> boardFileList = new ArrayList<EndFileVO>();
		// 신규 접수 코드 생성
		//String policyCode = policyMapper.getPolicyCode();
		try {
			boardFileList = boardMapper.boardFileList(endFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return boardFileList;
	
	}

	@Override
	public String UpdataBoardData(BoardVO param) {
		// TODO Auto-generated method stub
		// 신규 접수 코드 생성
				String infoBoardCode = param.getInfoBoardCode();
				try {
					
				
					param.setInfoBoardCode(infoBoardCode);
					boardMapper.UpdataBoardData(param);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
				return infoBoardCode;
	}

	

	
	
}
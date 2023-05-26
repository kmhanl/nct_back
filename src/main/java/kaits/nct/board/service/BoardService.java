package kaits.nct.board.service;

import java.util.List;

import kaits.nct.common.model.PagingVO;
import kaits.nct.board.model.BoardVO;
import kaits.nct.research.model.EndFileVO;

public interface  BoardService {
	/** 기술유출 상담 저장 **/
	String InsertBoardData(BoardVO param);
	
	/** 기술유출 상담 리스트 조회 **/
	List<BoardVO> getBoardList(BoardVO param);
	
	/** 기술유출 상담 View 조회 **/
	List<BoardVO> getBoardView(BoardVO param);
	
	/** 페이징 데이터 조회 **/
	PagingVO getPaging();

	List<EndFileVO> BoardFileList(EndFileVO endFile);

	String UpdataBoardData(BoardVO param);



	
}

package kaits.nct.board.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import kaits.nct.board.model.BoardVO;
import kaits.nct.research.model.EndFileVO;

@Mapper
public interface BoardMapper {
	
	/** 기술유출 상담 신규 코드 생성 **/

	
	/** 기술유출 상담 메타 데이터 저장  생성 **/
	public int InsertBoardData(BoardVO param);
	
	/** 기술유출 상담 메타 데이터 > Viewe 조회  **/
	public List<BoardVO> getBoardView(BoardVO params);
	
	/** 기술유출 상담 메타 데이터 > 리스트 조회  **/
	public List<BoardVO> getBoardList(BoardVO params);

	public List<EndFileVO> boardFileList(EndFileVO endFile);

	public void UpdataBoardData(BoardVO param);


	public String getInfoBoardCode();
	
	
	
}

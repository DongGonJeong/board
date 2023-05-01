package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
//public class BoardDAO {
public class BoardDAO extends EgovAbstractDAO {
	

	public String insertNBoard(BoardVO vo) {
		
//		return null;
		return (String) insert("boardDAO.insertNBoard", vo);
	}

	public List<?> selectNBoardList(BoardVO vo) {
		
//		return null;
		return list("boardDAO.selectNBoardList", vo);
	}

	public int selectNBoardTotal(BoardVO vo) {
		
//		return 0;
		return (int) select("boardDAO.selectNBaordTotal", vo);
	}

	public BoardVO selectNBoardDetail(int unq) {
		
//		return null;
		return (BoardVO) select("boardDAO.selectNBoardDetail", unq);
	}

	public int updateNBoardHits(int unq) {
		
//		return 0;
		return update("boardDAO.updateNBoardHits", unq);
	}

	public int updateNBoard(BoardVO vo) {
		
//		return 0;
		return update("boardDAO.updateNBoard", vo);
	}

	public int selectNBoardPass(BoardVO vo) {
		
//		return 0;
		return (int) select("boardDAO.selectNBoardPass", vo);
	}

	public int deleteNBaord(BoardVO vo) {
		
//		return 0;
//		return delete("boardDAO.deleteNBaord", vo);
		return delete("boardDAO.deleteNBoard", vo);
	}
	
	

}

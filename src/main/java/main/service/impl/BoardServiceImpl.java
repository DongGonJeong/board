package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	
	@Resource(name = "boardDAO")
	public BoardDAO boardDAO;

	@Override
	public String insertNBoard(BoardVO vo) throws Exception {
		
//		return null;
		return boardDAO.insertNBoard(vo);
	}

	@Override
	public List<?> selectNBoardList(BoardVO vo) throws Exception {
		
//		return null;
		return boardDAO.selectNBoardList(vo);
	}

	@Override
	public int selectNBoardTotal(BoardVO vo) throws Exception {
		
//		return 0;
		return boardDAO.selectNBoardTotal(vo);
	}

	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		
//		return null;
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateNBoardHits(int unq) throws Exception {
		
//		return 0;
		return boardDAO.updateNBoardHits(unq);
	}

	@Override
	public int updateNBoard(BoardVO vo) throws Exception {
		
//		return 0;
		return boardDAO.updateNBoard(vo);
	}

	@Override
	public int selectNBoardPass(BoardVO vo) throws Exception {
		
//		return 0;
		return boardDAO.selectNBoardPass(vo);
	}

	@Override
	public int deleteNBoard(BoardVO vo) throws Exception {
		
//		return 0;
		return boardDAO.deleteNBaord(vo);
	}

	

}

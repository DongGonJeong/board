package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	
	@Resource(name = "boardService")
	public BoardService boardService;
	
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";  
		
		
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
//	public String insertBoard(BoardVO vo) throws Exception {
	public String insertNBoard(BoardVO vo) throws Exception {
		
		String result = boardService.insertNBoard(vo);
		
		String msg;
		
		if(result == null) {
			
			msg = "ok";
			
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
	
	
	@RequestMapping("/boardList.do")
//	public String selectBoardList() throws Exception {
//	public String selectNBoardList(BoardVO vo) throws Exception {
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
//		int unit = 10;
		int unit = 5;
		
		int total = boardService.selectNBoardTotal(vo);
		
//		int totalPage = (int) Math.ceil(total/10);
//		int totalPage = (int) Math.ceil((double)total/10);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
		if(viewPage > totalPage || viewPage < 1) {
			
			viewPage = 1;
		}
		
//		int startIndex = (viewPage - 1)*10 + 1;
		int startIndex = (viewPage - 1)*unit + 1;
		
//		int endIndex = startIndex + (10 - 1);
		int endIndex = startIndex + (unit - 1);
		
//		int startRowNo = total - (viewPage - 1)*10;
		int startRowNo = total - (viewPage - 1)*unit;
		
		vo.setStartIndex(startIndex);
		
		vo.setEndIndex(endIndex); 
		
		List<?> list = boardService.selectNBoardList(vo);
		
		System.out.println("list: " + list);
		
		model.addAttribute("resultList", list);
		
		model.addAttribute("total", total);
		
		model.addAttribute("totalPage", totalPage);
		
		model.addAttribute("rowNumber", startRowNo);
		
		return "board/boardList";
	}
	
	@RequestMapping("/boardDetail.do")
//	public String selectNBoardDetail(BoardVO vo) throws Exception {
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception {		
		
		boardService.updateNBoardHits(vo.getUnq());
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent();
		
		boardVO.setContent(content.replace("\n", "<br>"));
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
		
	}
	
	@RequestMapping("/boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception {
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardModifyWrite";
		
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateNBoard(BoardVO vo) throws Exception {
		
		int result = 0;
		
		int count = boardService.selectNBoardPass(vo);
		
		if(count == 1) {
			
//			int result = boardService.updateNBoard(vo);
			result = boardService.updateNBoard(vo);
			
		} else {
			
			result = -1;
		}

//		int result = boardService.updateNBoard(vo);
		
		
		return result + "";
		
	}
	
	@RequestMapping("/passWrite.do")
//	public String passWrite(int unq) {
	public String passWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq", unq);
		
		return "board/passWrite";
		
	}
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception {
		
		int result = 0;
		
		int count = boardService.selectNBoardPass(vo);
		
		System.out.println("count 개수 => " + count);
		
		if(count == 1) {

//			int result = boardService.deleteNBoard(vo);
			result = boardService.deleteNBoard(vo);
			
			System.out.println("result ===>> " + result);
			
		} else if(count == 0) {
			
			result = -1;
			
		}
		
//		 int result = boardService.deleteNBoard(vo); 
		
		return result + "";
	}
	

}

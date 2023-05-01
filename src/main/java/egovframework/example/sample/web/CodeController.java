package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
public class CodeController {
	
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "/codeWrite.do")
	public String codeWrite() {
		
		return "code/codeWrite";
	}
	
	@RequestMapping(value = "/codeWriteSave.do")
//	public String insertCode() throws Exception {
	public String insertCode(CodeVO vo) throws Exception {
		
//		codeService.insertCodes(vo);
		String result = codeService.insertCodes(vo);
		
		if(result == null) {
			
			System.out.println("insert 완료");
			
		} else {
			
			System.out.println("insert 실패");
		}
		
//		return "";
		return "redirect:codeList.do";
		
	}
	
	@RequestMapping(value = "/codeList.do")
//	public String selectCodesList(CodeVO vo) throws Exception {
	public String selectCodesList(CodeVO vo, ModelMap model) throws Exception {
		
		int total = codeService.selectCodesCount(vo);
		
		System.out.println("total ==>> " + total);
		
		List<?> list = codeService.selectCodesList(vo);
		
		System.out.println("list ==>>" + list);
		
		model.addAttribute("resultList", list);
		
		model.addAttribute("resultTotal", total);
		
		return "code/codeList";
	}

	@RequestMapping(value = "/codeDelete.do")
	public String deleteCode(int code) throws Exception {
		
		int result = codeService.deleteCodes(code);
		
//		System.out.println("result ==>> " + result);
		
		if(result == 1) {
			
			System.out.println("삭제 성공");
			
		} else {
			
			System.out.println("삭제 실패");
		}
		
//		return "redirect:/codeList.do";
		return "redirect:codeList.do";
		
	}
	
	@RequestMapping(value = "/codeModifyWrite.do")
//	public String selectCodesDetail(int code) throws Exception {
	public String selectCodesDetail(int code, ModelMap model) throws Exception {
		
		CodeVO vo = codeService.selectCodesDetail(code);
		
		model.addAttribute("vo", vo);
		
		return "code/codeModifyWrite";
		
	}
	
	@RequestMapping(value = "/codeModifySave.do")
	public String updateCodes(CodeVO vo) throws Exception {
		
		codeService.updateCodes(vo);
		
		return "redirect:codeList.do";
		
		
	}
}

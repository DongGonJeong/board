package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

@Repository("memberDAO")
//public class MemberDAO {
public class MemberDAO extends EgovAbstractDAO {	
	

	public String insertMember(MemberVO vo) {
		
//		return null;
//		return insert("memberDAO.insertMember", vo);
		return (String) insert("memberDAO.insertMember", vo);
	}

	public int selectMemberIdCheck(String userid) {
		
//		return 0;
		return (int) select("memberDAO.selectMemberIdCheck", userid);
	}

	public List<?> selectPostList(String dong) {
		
//		return null;
		return list("memberDAO.selectPostList", dong);
	}

	public int selectMemberCount(MemberVO vo) {
		
//		return 0;
		return (int) select("memberDAO.selectMemberCount", vo);
	}

	

	

}

package com.lecture.admin.model.service.member;

import static com.lecture.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lecture.admin.model.dao.board.AdminMemberDao;
import com.lecture.admin.model.dto.Member;

public class AdminMemberService {

	AdminMemberDao memberDao = new AdminMemberDao();
	
	
	public List<Member> selectMemberAll(Map<String, Integer> param) {
		
		SqlSession session= getSession();
		
		List<Member> m = memberDao.selectMemberAll(session,param);
		session.close();
		
		return m;
		
	}

	public int selectMemberCount() {
		SqlSession session=getSession();
		int count=memberDao.selectMemberCount(session);
		session.close();
		return count;
	}

	public Member selectMemberById(String memberId) {
		SqlSession session = getSession();
		Member searchMember = memberDao.selectMemberByid(session, memberId);
		return searchMember;
	}
}

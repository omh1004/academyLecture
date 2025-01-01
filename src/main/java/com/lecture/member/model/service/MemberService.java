package com.lecture.member.model.service;

import static com.lecture.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.lecture.member.model.dao.MemberDao;
import com.lecture.model.dto.Member;

public class MemberService {

private MemberDao dao = new MemberDao();
	
	public int signupMember(Member m) throws RuntimeException {
		SqlSession session = getSession();
		int result = dao.signupMember(session, m);

		if (result > 0)
			session.commit();
		else
			session.rollback();

		session.close();

		return result;
	}
	
	
}

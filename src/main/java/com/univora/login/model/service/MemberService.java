package com.univora.login.model.service;

import static com.univora.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.univora.login.model.dao.MemberDao;
import com.univora.login.model.dto.Member;

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

	public Member loginCheckById(Member checkMember) {
		SqlSession session= getSession();
		
		Member invalidMember = dao.loginCheckById(session, checkMember);
		
		
		return invalidMember;
	}
	
	
}

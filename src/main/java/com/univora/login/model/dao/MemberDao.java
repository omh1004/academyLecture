package com.univora.login.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.univora.login.model.dto.Member;

public class MemberDao {

	public int signupMember(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMember" , m);
	}

	public Member loginCheckById(SqlSession session, Member checkMember) {
		return session.selectOne("member.loginCheckById",checkMember);
	}
	
}

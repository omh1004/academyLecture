package com.lecture.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.lecture.model.dto.Member;

public class MemberDao {

	public int signupMember(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMember" , m);
	}
	
}

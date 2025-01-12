package com.univora.login.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.login.model.dto.Member;

public class MemberDao {

	public int signupMember(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMember" , m);
	}

	public Member loginCheckById(SqlSession session, Member checkMember) {
		return session.selectOne("member.loginCheckById",checkMember);
	}
	
	public Member selectMemberToFindIdPwd(SqlSession session, Map<String, String> param) {
		return session.selectOne("member.selectMemberToFindIdPwd", param);
	}

	public int updateMemberInfo(SqlSession session, Map<String, Object> param) {
		return session.update("member.updateMemberInfo", param);
	}
	
    public boolean isNicknameDuplicate(SqlSession session, String nickname) {
        return session.selectOne("member.isNicknameDuplicate", nickname) != null;
    }

    public boolean isPhoneDuplicate(SqlSession session, String phone) {
        return session.selectOne("member.isPhoneDuplicate", phone) != null;
    }

    public boolean isEmailDuplicate(SqlSession session, String email) {
        return session.selectOne("member.isEmailDuplicate", email) != null;
    }
    
	public Member selectMemberById(SqlSession session, String id) {
		return session.selectOne("member.selectMemberById", id);
	}
    
}

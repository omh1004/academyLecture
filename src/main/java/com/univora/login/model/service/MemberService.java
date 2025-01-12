package com.univora.login.model.service;



import static com.univora.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.Map;

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
	
	
	public Member selectMemberToFindIdPwd(Map<String, String> param) {
		SqlSession session = getSession();
		Member m = dao.selectMemberToFindIdPwd(session, param);
		session.close();
		return m;
	}
	
	
	public int updateMemberInfo(Map<String, Object> param) {
		SqlSession session = getSession();
		int result = dao.updateMemberInfo(session, param);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}
	
	
	 public Map<String, Boolean> checkDuplicate(String nickname, String phone, String email) {
			SqlSession session = getSession();
	        Map<String, Boolean> result = new HashMap<>();
	        result.put("nicknameIsDuplicate", dao.isNicknameDuplicate(session, nickname));
	        result.put("phoneIsDuplicate", dao.isPhoneDuplicate(session, phone));
	        result.put("emailIsDuplicate", dao.isEmailDuplicate(session, email));
	        session.close();
	        return result;
		 }
	 
		public Member selectMemberById(String id) {
			SqlSession session = getSession();
			Member m = dao.selectMemberById(session, id);
			session.close();
			return m;
		}
	 
}

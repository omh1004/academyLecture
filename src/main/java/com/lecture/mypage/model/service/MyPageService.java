package com.lecture.mypage.model.service;


import static com.lecture.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.lecture.mypage.model.dao.mypageDao;
import com.lecture.mypage.model.dto.User;





public class MyPageService {

	mypageDao mypageDao = new mypageDao();
	
	public User getUserProfile(String loginId) {
		SqlSession session = getSession();
		
		User userProfile = mypageDao.getUserProfile(session,loginId);
		
		return userProfile;
		
	}
	
}
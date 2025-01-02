package com.lecture.mypage.model.service;


import static com.lecture.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lecture.mypage.model.dao.mypageDao;
import com.lecture.mypage.model.dto.Schedule;
import com.lecture.mypage.model.dto.User;





public class MyPageService {

	mypageDao mypageDao = new mypageDao();
	
	public User getUserProfile(String loginId) {
		SqlSession session = getSession();
		
		User userProfile = mypageDao.getUserProfile(session,loginId);
		
		return userProfile;
		
	}

	public HashMap<String, List<HashMap<String, String>>> selectMyopenLectureByCalender(Map<String, String> daily) {
		SqlSession session = getSession();
		return mypageDao.selectMyopenLectureByCalender(session, daily);
		
	}
	
}
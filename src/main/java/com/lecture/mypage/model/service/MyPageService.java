package com.lecture.mypage.model.service;


import static com.lecture.common.SqlSessionTemplate.getSession;

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

	public List<Schedule> selectMyopenLectureByCalender(Map<String, String> daily) {
		SqlSession session = getSession();
		
		System.out.println("ads::"+daily);
		
		List<Schedule> schedules = mypageDao.selectMyopenLectureByCalender(session, daily);
		
		
		
		System.out.println("schedules::::::::"+schedules);
		
		
		return schedules;
	}
	
}
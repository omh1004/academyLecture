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

    public boolean saveLecture(String name, String content, String date, String time, String userId) {
    	SqlSession session = getSession();
    	
    	HashMap<String, Object> lectureData = new HashMap<>();
        lectureData.put("name", name);
        lectureData.put("content", content);
        lectureData.put("dateTime", date + " " + time);
        lectureData.put("time", time);
        lectureData.put("userId", userId);
        
        System.out.println("lectureData::"+lectureData);
        
        
        int result = mypageDao.saveLecture(session,lectureData);
        
    	if(result>0) session.commit();
		else session.rollback();

        return result>0;
    }
	
}
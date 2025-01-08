package com.univora.mypage.model.service;


import static com.univora.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.mypage.model.dao.mypageDao;
import com.univora.mypage.model.dto.LectureBasket;
import com.univora.login.model.dto.Member;
import com.univora.mypage.model.dto.OpenLecture;
import com.univora.mypage.model.dto.Payment;
import com.univora.mypage.model.dto.PurchaseHistory;
import com.univora.mypage.model.dto.User;





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
        lectureData.put("dateTime", date);
        lectureData.put("time", time);
        lectureData.put("userId", userId);
        
        
        System.out.println("뭥미"+lectureData.get("dateTime"));
        
        int result = mypageDao.saveLecture(session,lectureData);
        
    	if(result>0) session.commit();
		else session.rollback();

        return result>0;
    }

	public OpenLecture openLectureByLectureNo(String scheduleId) {
		SqlSession session = getSession();
		
		OpenLecture openLecture = mypageDao.openLectureByLectureNo(session, scheduleId);
		
		return openLecture;
	}

	public List<LectureBasket> selectMyLectureBasket(String memberNo) {
		SqlSession session = getSession();
		
		return mypageDao.selectMyLectureBasket(session, memberNo);
	}

	public int savePayment(Payment payment) {
		SqlSession session = getSession();
		int result = mypageDao.savePayment(session, payment);
		
    	if(result>0) session.commit();
		else session.rollback();

        return result;
	}
	
	
	// sk_마이페이지 수정 후 업데이트 
	
	public int updateUserProfile(Member user) {
        SqlSession session = getSession();
        int result = 0;

        try {
            result = new mypageDao().updateUserProfile(session, user);
            if (result > 0) {
                session.commit();
            } else {
                session.rollback();
            }
        } finally {
            session.close();
        }

        return result;
    }
	
	
	// sk_구매내역 리스트 구현
	public List<PurchaseHistory> getPurchaseHistory(String studentId) {
        SqlSession session = getSession();
        List<PurchaseHistory> historyList = mypageDao.getPurchaseHistory(session, studentId);
        session.close();
        return historyList;
    }
	
	// sk_내강의 리스트 가져오기
	public List<Map<String, Object>> getLectureDetails(String studentId) {
	    SqlSession session = getSession();
	    List<Map<String, Object>> lectureDetails = null;

	    try {
	        // DAO 호출
	        lectureDetails = new mypageDao().getLectureDetails(session, studentId);
	    } finally {
	        // 세션 닫기
	        session.close();
	    }

	    return lectureDetails;
	}

}
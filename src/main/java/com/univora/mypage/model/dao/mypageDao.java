package com.univora.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.mypage.model.dto.LectureBasket;
import com.univora.login.model.dto.Member;
import com.univora.mypage.model.dto.OpenLecture;
import com.univora.mypage.model.dto.Payment;
import com.univora.mypage.model.dto.PurchaseHistory;
import com.univora.mypage.model.dto.User;

public class mypageDao {

	private static final String NAMESPACE = "mypage";

	public User getUserProfile(SqlSession session, String loginId) {
		return session.selectOne("mypage.getUserProfile", loginId);
	}

	public HashMap<String, List<HashMap<String, String>>> selectMyopenLectureByCalender(SqlSession session, Map<String, String> daily) {
		List<HashMap<String, Object>> rawSchedules = session.selectList(NAMESPACE + ".selectMyopenLectureByCalender",
				daily);
		System.out.println("rawSchedules::"+rawSchedules);

		HashMap<String, List<HashMap<String, String>>> scheduleMap = new HashMap<>();
		for (HashMap<String, Object> rawSchedule : rawSchedules) {
			String date = (String) rawSchedule.get("TDATE");
			HashMap<String, String> schedule = new HashMap<>();
			schedule.put("name", (String) rawSchedule.get("NAME"));
			schedule.put("time", (String) rawSchedule.get("TIME"));
			schedule.put("description", (String) rawSchedule.get("DESCRIPTION"));
			schedule.put("lectureNo", (String) rawSchedule.get("LECTURENO"));

			scheduleMap.computeIfAbsent(date, k -> new ArrayList<>()).add(schedule);
		}
		return scheduleMap;
	}


	public int saveLecture(SqlSession session, HashMap<String, Object> lectureData) {
		return session.insert(NAMESPACE + ".insertLecture", lectureData);
	}

	public OpenLecture openLectureByLectureNo(SqlSession session, String lectureNo) {
		return session.selectOne("mypage.openLectureByLectureNo", lectureNo);
	}


	// sk_마이페이지 수정 후 업데이트 처리
	
	 public int updateUserProfile(SqlSession session, Member user) {
	        return session.update("mypage.updateUserProfile", user);
	 }
	

	public List<LectureBasket> selectMyLectureBasket(SqlSession session, String memberNo) {
		return session.selectList("mypage.selectMyLectureBasket", memberNo);
	}

	public int savePayment(SqlSession session, Payment payment) {
		return session.insert(NAMESPACE + ".savePayment", payment);
	}
	

	// sk_ 구매내역
	 public List<PurchaseHistory> getPurchaseHistory(SqlSession session, String studentId) {
	        return session.selectList("mypage.selectPurchaseHistory", studentId);
	}

	// sk_내 강의 가져오기
	 public List<Map<String, Object>> getLectureDetails(SqlSession session, String studentId) {
		    return session.selectList("mypage.selectLectureDetails", studentId);
	}


}

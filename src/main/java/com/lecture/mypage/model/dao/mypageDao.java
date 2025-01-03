package com.lecture.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lecture.mypage.model.dto.Schedule;
import com.lecture.mypage.model.dto.User;

public class mypageDao {

	private static final String NAMESPACE = "mypage";

	public User getUserProfile(SqlSession session, String loginId) {
		return session.selectOne("mypage.getUserProfile", loginId);
	}

	public HashMap<String, List<HashMap<String, String>>> selectMyopenLectureByCalender(SqlSession session, Map<String, String> daily) {

		System.out.println("tdate::"+daily);
		
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
			
			System.out.println("schedule::"+schedule);

			scheduleMap.computeIfAbsent(date, k -> new ArrayList<>()).add(schedule);
		}
		return scheduleMap;
	}


	public int saveLecture(SqlSession session, HashMap<String, Object> lectureData) {
		return session.insert(NAMESPACE + ".insertLecture", lectureData);
	}

}

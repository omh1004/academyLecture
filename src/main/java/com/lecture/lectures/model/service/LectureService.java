package com.lecture.lectures.model.service;


import static com.lecture.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lecture.lectures.model.dao.LectureDao;
import com.lecture.model.dto.Lectures;

public class LectureService {

	private LectureDao dao = new LectureDao();

	 public List<Lectures> getAllLectures() throws RuntimeException {
	        SqlSession session = getSession();
	        List<Lectures> lectureList;

	        try {
	            // DAO 호출 및 데이터 조회
	            lectureList = dao.selectAllLectures(session);
	        } finally {
	            session.close(); // 세션 닫기
	        }

	        return lectureList;
	    }
	 
	 
	// 강좌 상세 조회
    public Lectures getLectureDetail(String lectureNo) throws RuntimeException {
	        SqlSession session = getSession();
	        Lectures lectureDetail;

	        try {
	            // DAO 호출 및 강좌 상세 정보 조회
	            lectureDetail = dao.selectLectureDetail(session, lectureNo);
	        } finally {
	            session.close(); // 세션 닫기
	        }

	        return lectureDetail;
	    }
	    
    
}

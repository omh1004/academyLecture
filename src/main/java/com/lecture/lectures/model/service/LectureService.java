package com.lecture.lectures.model.service;


import static com.lecture.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lecture.lectures.model.dao.LectureDao;
import com.lecture.model.dto.Lectures;

public class LectureService {

	private LectureDao dao = new LectureDao();

	// 메인페이지에서 전체 강의들 출력!!!!
	
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
    
	 
	 // 강의 타이틀 클릭시 상세정보 (수정필요))
	 
	// public Lectures getLectureById(String lectureNo) {
	  //      return dao.getLectureById(lectureNo);
	    //}
}

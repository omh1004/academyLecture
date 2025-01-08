package com.univora.lectures.model.service;


import static com.univora.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.univora.lectures.model.dao.LectureDao;
import com.univora.lectures.model.dto.Lectures;
import com.univora.lectures.model.dto.Review;

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
	   
    
    public List<Review> getLectureReviews(String lectureNo) {
        SqlSession session = getSession(); // 세션 시작
        List<Review> reviews;

        try {
            // DAO를 통해 리뷰 데이터 가져오기
            reviews = dao.selectLectureReviews(session, lectureNo);
        } finally {
            session.close(); // 세션 닫기
        }

        return reviews; // 가져온 리뷰 반환
    }
    
    
    // 강좌 검색 서비스
    
    public List<Lectures> searchLectures(String query) throws RuntimeException {
        SqlSession session = getSession(); // 세션 생성
        List<Lectures> lectures;

        try {
            // DAO 호출 및 강좌 검색
            lectures = dao.searchLectures(session, query);
        } finally {
            session.close(); // 세션 닫기
        }

        return lectures;
    }
    
	 
	 // 강의 타이틀 클릭시 상세정보 (수정필요))
	 
	// public Lectures getLectureById(String lectureNo) {
	  //      return dao.getLectureById(lectureNo);
	    //}
}

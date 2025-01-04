package com.lecture.mypage.model.service;

import org.apache.ibatis.session.SqlSession;

import com.lecture.mypage.model.dao.MyLectureDao;
import com.lecture.mypage.model.dao.UploadDao;

public class MyLectureService {

	private final MyLectureDao lectureDAO = new MyLectureDao();
	private final UploadDao uploadDAO = new UploadDao();

	public String registerLecture(SqlSession session, String category, String title, String content, String tags) {
		return lectureDAO.insertLecture(session, category, title, content, tags);
	}

	public void uploadFile(SqlSession session, String lectureNo, String originalName, String savedName, String path) {
		uploadDAO.insertUpload(session, lectureNo, originalName, savedName, path);
	}

}

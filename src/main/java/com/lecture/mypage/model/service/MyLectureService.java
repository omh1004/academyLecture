package com.lecture.mypage.model.service;

import com.lecture.mypage.model.dao.MyLectureDao;
import com.lecture.mypage.model.dao.UploadDao;

import static com.lecture.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

public class MyLectureService {

	private final MyLectureDao lectureDao = new MyLectureDao();
	private final UploadDao uploadDAO = new UploadDao();

	public void registerDetailLecture(String lectureNo, String category, String title, String instructorintro) {
		SqlSession session = getSession();

		lectureDao.registerDetailLecture(session, lectureNo, category, title, instructorintro);

		try {
			session.commit();
			
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

//	public void uploadFile(SqlSession session, String lectureNo, String originalName, String savedName, String path) {
//		uploadDAO.insertUpload(session, lectureNo, originalName, savedName, path);
//	}

}

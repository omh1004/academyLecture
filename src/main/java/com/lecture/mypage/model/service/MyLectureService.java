package com.lecture.mypage.model.service;

import com.lecture.mypage.model.dao.MyLectureDao;
import com.lecture.mypage.model.dao.UploadDao;
import com.lecture.mypage.model.dto.AttachFile;
import com.lecture.mypage.model.dto.OpenLecture;

import static com.lecture.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

public class MyLectureService {

	private final MyLectureDao lectureDao = new MyLectureDao();
	private final UploadDao uploadDAO = new UploadDao();

	public int updateMyLectureDetail(OpenLecture lecture) {
		SqlSession session = getSession();

		int result = lectureDao.updateMyLectureDetail(session, lecture);

		if (result > 0) {
			session.commit();

		} else {
			session.rollback();

		}
		session.close();
		
		return result;

	}

	public void uploadFile(AttachFile uploadFile) {
		SqlSession session = getSession();
		
		lectureDao.uploadFile(session,uploadFile);
		
		session.commit();
		session.close();
		
	}

}

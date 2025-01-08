package com.univora.mypage.model.service;

import static com.univora.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.univora.mypage.model.dao.MyLectureDao;
import com.univora.mypage.model.dao.UploadDao;
import com.univora.mypage.model.dto.AttachFile;
import com.univora.mypage.model.dto.OpenLecture;

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

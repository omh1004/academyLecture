package com.univora.admin.model.service.board;

import static com.univora.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.admin.model.dao.AdminBoardDao;
import com.univora.admin.model.dto.Board;

public class AdminBoardService {
	AdminBoardDao boardDao = new AdminBoardDao();


	public int updateReportProcessing(Map<String, String> param) {
		SqlSession session = getSession();
		
		int result = boardDao.updateReportProcessing(session,param);
		
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		
		
		return result;
	}

	public int insertAnnounceBoard(Board insertBoard) {
		SqlSession session = getSession();
		int result = boardDao.insertAnnounceBoard(session, insertBoard);
		
		if(result>0) session.commit();
		else session.rollback();
		session.close();
		
		return result;
	}
}

package com.univora.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.admin.model.dto.Board;


public class AdminBoardDao {


	public int updateReportProcessing(SqlSession session, Map<String, String> param) {
		return session.update("admin.updateReportProcessing", param);
				
	}


	public int insertAnnounceBoard(SqlSession session, Board insertBoard) {
		return session.insert("admin.insertAnnounceBoard", insertBoard);
	}

}

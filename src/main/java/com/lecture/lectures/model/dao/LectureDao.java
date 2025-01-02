package com.lecture.lectures.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lecture.model.dto.Lectures;

public class LectureDao {

	 public List<Lectures> selectAllLectures(SqlSession session) {
	        // MyBatis Mapper 호출
	        return session.selectList("lecture.selectAllLectures");
	    }

	
	 
}

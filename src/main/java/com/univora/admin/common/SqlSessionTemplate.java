package com.univora.admin.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionTemplate {
	// Mybatis가 DB에 접근해서 sql을 실행한 SqlSession객체를 생성해주는 역할
	public static SqlSession getSession() {
		// SqlSession생성하는방법
		// 1. SqlSessionFactoryBuilder클래스를 생성 -> default생성자
		// 2. SqlSessionFactoryBuilder클래스가 제공하는
		// build("mybatis-config.xml") 메소드로
		// SqlSessionFactory클래스를 생성
		// 3. 생성된 SqlSessionFactory클래스가 제공하는
		// openSession(boolean)메소드를 이용해서 SqlSession클래스를 생성
		// 매개변수 인자는 autoCommit에 대한 설정 (false)
		SqlSession session = null;
		String fileName = "mybatis-config.xml";
		try (InputStream config = Resources.getResourceAsStream(fileName)) {
			SqlSessionFactoryBuilder sfb = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sfb.build(config);
			session = factory.openSession(false);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return session;
	}
}

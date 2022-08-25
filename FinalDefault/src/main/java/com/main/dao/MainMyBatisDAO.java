package com.main.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.theme.entity.Board;
import com.theme.entity.User;

public class MainMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "com/main/dao/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// User
	public User UserLogin(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		User uvo = session.selectOne("UserLogin", user);
		session.close();
		return uvo;
	}
	public int UserRegister(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.insert("UserRegister", user);
		session.commit();
		session.close();
		return flag;		
	}
	
	// Board
	public List<Board> allBoardList() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> boardList = session.selectList("allBoardList");
		session.close();
		return boardList;
	}
	
	public void BoardCntUpdate(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("BoardCntUpdate", num);
		session.commit();
		session.close();
	}
	public Board BoardView(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		Board bvo = session.selectOne("BoardView", num);
		session.close();
		return bvo;
	}
	
}

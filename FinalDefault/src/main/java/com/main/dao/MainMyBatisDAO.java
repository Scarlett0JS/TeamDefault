package com.main.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.theme.entity.Board;
import com.theme.entity.Comment;
import com.theme.entity.Comment_nick;
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
	
	public void UserDelete(String user_id) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("UserDelete", user_id);
		session.commit();
		session.close();
	}
	
	public User UserSelect(String user_id) {
		SqlSession session = sqlSessionFactory.openSession();
		User uvo = session.selectOne("UserSelect", user_id);
		session.close();
		return uvo;
	}
	
	public void UserNickUpdate(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("UserNickUpdate", user);
		session.commit();
		session.close();
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
	
	public List<Board> LangBoardList(String lang) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> boardList = session.selectList("LangBoardList", lang);
		session.close();
		return boardList;
	}
	
	public void BoardDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("BoardDelete", num);
		session.commit();
		session.close();
	}
	
	public void BoardInsert(Board vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("BoardInsert", vo);
		session.commit();
		session.close();
	}
	
	public Board BoardSelect(int board_num) {
		SqlSession session = sqlSessionFactory.openSession();
		Board vo = session.selectOne("BoardSelect", board_num);
		session.close();
		return vo;
	}
	
	public void BoardUpdate(Board vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("BoardUpdate", vo);
		session.commit();
		session.close();
	}

	// Comment
	public List<Comment_nick> allCommentList(int board_num) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Comment_nick> commentList = session.selectList("allCommentList", board_num);
		session.close();
		return commentList;
	}
	
	public void CommentWrite(Comment vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("CommentWrite", vo);
		session.commit();
		session.close();
	}
	public void CommentDelete(Comment vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("CommentDelete", vo);
		session.commit();
		session.close();
	}

	

	
}

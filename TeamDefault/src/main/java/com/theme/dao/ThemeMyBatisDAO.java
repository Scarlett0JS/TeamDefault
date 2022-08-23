package com.theme.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.theme.entity.Board;
import com.theme.entity.Member;

public class ThemeMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "com/theme/dao/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> allList(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> boardList =  session.selectList("allList");
		session.close();
		return boardList;
	}
	
	public int boardWrite(Board vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.insert("boardWrite", vo);
		session.commit();
		session.close();
		return flag;
	}
	
	public int boardDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.delete("boardDelete", num);
		session.commit();
		session.close();
		return flag;
	}
	
	public Board boardView(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		Board vo = session.selectOne("boardView", num);
		session.close();
		return vo;
	}
	
	public void countUpdate(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("countUpdate", num);
		session.commit();
		session.close();
	}
	
	public int boardUpdate(Board vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.update("boardUpdate", vo);
		session.commit();
		session.close();
		return flag;
	}
	
	public int MemberSignUp(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.insert("MemberSignUp", vo);
		session.commit();
		session.close();
		return flag;
	}

	public Member MemberLogin(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		Member memberDTO = session.selectOne("MemberLogin", vo);
		session.close();
		return memberDTO;
	}
	
	public List<Member> memberList(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Member> memberList = session.selectList("memberList");
		session.close();
		return memberList;
	}
	
	public int memberDelete(String memId) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.delete("memberDelete", memId);
		session.commit();
		session.close();
		return flag;
	}
	
}

package com.main.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	public User UserLogin(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		User uvo = session.selectOne("UserLogin", user);
		session.close();
		return uvo;
	}
	
}

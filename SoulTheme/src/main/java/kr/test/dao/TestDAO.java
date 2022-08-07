package kr.test.dao;

import kr.test.entity.TestDTO;

public class TestDAO {
	public TestDTO checkLogin(String id, String pw) {
		return new TestDTO(id, pw);
	}
}

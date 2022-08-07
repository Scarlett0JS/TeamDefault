package kr.test.entity;

public class TestDTO {
	private String userId;
	private String userPw;
	
	public TestDTO() {
		super();
	}
	
	public TestDTO(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	@Override
	public String toString() {
		return "TestDTO [userId=" + userId + ", userPw=" + userPw + "]";
	}
	
}

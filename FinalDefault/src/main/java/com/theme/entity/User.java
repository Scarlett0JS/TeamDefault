package com.theme.entity;

public class User {
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_joindate;
	private String user_type;
	private String user_status;
	
	public User() {
		super();
	}

	public User(String user_id, String user_pw, String user_nick, String user_joindate, String user_type,
			String user_status) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nick = user_nick;
		this.user_joindate = user_joindate;
		this.user_type = user_type;
		this.user_status = user_status;
	}
	
	public User(String user_id, String user_pw) {
		this(user_id, user_pw, null, null, null, null);
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(String user_joindate) {
		this.user_joindate = user_joindate;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pw=" + user_pw + ", user_nick=" + user_nick + ", user_joindate="
				+ user_joindate + ", user_type=" + user_type + ", user_status=" + user_status + "]";
	}
	
	
}

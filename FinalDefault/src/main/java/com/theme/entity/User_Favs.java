package com.theme.entity;

public class User_Favs {
	private int uf_seq;
	private int theme_seq;
	private String user_id;
	private String reg_date;
	
	public User_Favs() {
		super();
	}

	public User_Favs(int uf_seq, int theme_seq, String user_id, String reg_date) {
		super();
		this.uf_seq = uf_seq;
		this.theme_seq = theme_seq;
		this.user_id = user_id;
		this.reg_date = reg_date;
	}
	
	public User_Favs(int theme_seq, String user_id) {
		this(0, theme_seq, user_id, null);
	}

	public int getUf_seq() {
		return uf_seq;
	}

	public void setUf_seq(int uf_seq) {
		this.uf_seq = uf_seq;
	}

	public int getTheme_seq() {
		return theme_seq;
	}

	public void setTheme_seq(int theme_seq) {
		this.theme_seq = theme_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "User_Favs [uf_seq=" + uf_seq + ", theme_seq=" + theme_seq + ", user_id=" + user_id + ", reg_date="
				+ reg_date + "]";
	}

	
}

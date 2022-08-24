package com.theme.entity;

public class Board {
	private int b_seq;
	private String b_title;
	private String b_content;
	private String b_file;
	private String b_date;
	private String user_id;
	private int b_cnt;
	private String b_category;
	private int b_like;
	
	public Board() {
		super();
	}

	public Board(int b_seq, String b_title, String b_content, String b_file, String b_date, String user_id, int b_cnt,
			String b_category, int b_like) {
		super();
		this.b_seq = b_seq;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_file = b_file;
		this.b_date = b_date;
		this.user_id = user_id;
		this.b_cnt = b_cnt;
		this.b_category = b_category;
		this.b_like = b_like;
	}

	public int getB_seq() {
		return b_seq;
	}

	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public int getB_like() {
		return b_like;
	}

	public void setB_like(int b_like) {
		this.b_like = b_like;
	}

	@Override
	public String toString() {
		return "Board [b_seq=" + b_seq + ", b_title=" + b_title + ", b_content=" + b_content + ", b_file=" + b_file
				+ ", b_date=" + b_date + ", user_id=" + user_id + ", b_cnt=" + b_cnt + ", b_category=" + b_category
				+ ", b_like=" + b_like + "]";
	}
	
	
}

package com.theme.entity;

public class Board {
	private int d_seq;
	private String d_title;
	private String d_content;
	private String d_file;
	private String d_date;
	private String user_id;
	private int d_cnt;
	private String d_category;
	private int d_like;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int d_seq, String d_title, String d_content, String d_file, String d_date, String user_id, int d_cnt,
			String d_category, int d_like) {
		super();
		this.d_seq = d_seq;
		this.d_title = d_title;
		this.d_content = d_content;
		this.d_file = d_file;
		this.d_date = d_date;
		this.user_id = user_id;
		this.d_cnt = d_cnt;
		this.d_category = d_category;
		this.d_like = d_like;
	}
	
	public Board(String title, String content, String writer, String lang) {
		this(0, title, content, null, null, writer, 0, lang, 0);
	}
	
	public Board(int d_seq, String title, String content, String writer) {
		this(d_seq, title, content, null, null, writer, 0, null, 0);
	}
	
	public int getD_seq() {
		return d_seq;
	}

	public void setD_seq(int d_seq) {
		this.d_seq = d_seq;
	}

	public String getD_title() {
		return d_title;
	}

	public void setD_title(String d_title) {
		this.d_title = d_title;
	}

	public String getD_content() {
		return d_content;
	}

	public void setD_content(String d_content) {
		this.d_content = d_content;
	}

	public String getD_file() {
		return d_file;
	}

	public void setD_file(String d_file) {
		this.d_file = d_file;
	}

	public String getD_date() {
		return d_date;
	}

	public void setD_date(String d_date) {
		this.d_date = d_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getD_cnt() {
		return d_cnt;
	}

	public void setD_cnt(int d_cnt) {
		this.d_cnt = d_cnt;
	}

	public String getD_category() {
		return d_category;
	}

	public void setD_category(String d_category) {
		this.d_category = d_category;
	}

	public int getD_like() {
		return d_like;
	}

	public void setD_like(int d_like) {
		this.d_like = d_like;
	}

	@Override
	public String toString() {
		return "Board [d_seq=" + d_seq + ", d_title=" + d_title + ", d_content=" + d_content + ", d_file=" + d_file
				+ ", d_date=" + d_date + ", user_id=" + user_id + ", d_cnt=" + d_cnt + ", d_category=" + d_category
				+ ", d_like=" + d_like + "]";
	}
	
	
	
	
}

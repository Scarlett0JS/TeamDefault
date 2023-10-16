package com.theme.entity;

public class Theme {
	private int theme_seq;
	private String theme_name;
	private String theme_lang;
	private String theme_font;
	private int theme_likes;
	private String theme_col1;
	private String theme_col2;
	private String theme_col3;
	private String theme_col4;
	private String theme_col5;
	private String theme_producer;
	private String theme_filepath;
	private String theme_url;
	private String theme_icon;
	private int theme_installcnt;
	
	public Theme() {
		super();
	}

	public Theme(int theme_seq, String theme_name, String theme_lang, String theme_font, int theme_likes,
			String theme_col1, String theme_col2, String theme_col3, String theme_col4, String theme_col5,
			String theme_producer, String theme_filepath, String theme_url, String theme_icon, int theme_installcnt) {
		super();
		this.theme_seq = theme_seq;
		this.theme_name = theme_name;
		this.theme_lang = theme_lang;
		this.theme_font = theme_font;
		this.theme_likes = theme_likes;
		this.theme_col1 = theme_col1;
		this.theme_col2 = theme_col2;
		this.theme_col3 = theme_col3;
		this.theme_col4 = theme_col4;
		this.theme_col5 = theme_col5;
		this.theme_producer = theme_producer;
		this.theme_filepath = theme_filepath;
		this.theme_url = theme_url;
		this.theme_icon = theme_icon;
		this.theme_installcnt = theme_installcnt;
	}

	public int getTheme_seq() {
		return theme_seq;
	}

	public void setTheme_seq(int theme_seq) {
		this.theme_seq = theme_seq;
	}

	public String getTheme_name() {
		return theme_name;
	}

	public void setTheme_name(String theme_name) {
		this.theme_name = theme_name;
	}

	public String getTheme_lang() {
		return theme_lang;
	}

	public void setTheme_lang(String theme_lang) {
		this.theme_lang = theme_lang;
	}

	public String getTheme_font() {
		return theme_font;
	}

	public void setTheme_font(String theme_font) {
		this.theme_font = theme_font;
	}

	public int getTheme_likes() {
		return theme_likes;
	}

	public void setTheme_likes(int theme_likes) {
		this.theme_likes = theme_likes;
	}

	public String getTheme_col1() {
		return theme_col1;
	}

	public void setTheme_col1(String theme_col1) {
		this.theme_col1 = theme_col1;
	}

	public String getTheme_col2() {
		return theme_col2;
	}

	public void setTheme_col2(String theme_col2) {
		this.theme_col2 = theme_col2;
	}

	public String getTheme_col3() {
		return theme_col3;
	}

	public void setTheme_col3(String theme_col3) {
		this.theme_col3 = theme_col3;
	}

	public String getTheme_col4() {
		return theme_col4;
	}

	public void setTheme_col4(String theme_col4) {
		this.theme_col4 = theme_col4;
	}

	public String getTheme_col5() {
		return theme_col5;
	}

	public void setTheme_col5(String theme_col5) {
		this.theme_col5 = theme_col5;
	}

	public String getTheme_producer() {
		return theme_producer;
	}

	public void setTheme_producer(String theme_producer) {
		this.theme_producer = theme_producer;
	}

	public String getTheme_filepath() {
		return theme_filepath;
	}

	public void setTheme_filepath(String theme_filepath) {
		this.theme_filepath = theme_filepath;
	}

	public String getTheme_url() {
		return theme_url;
	}

	public void setTheme_url(String theme_url) {
		this.theme_url = theme_url;
	}

	public String getTheme_icon() {
		return theme_icon;
	}

	public void setTheme_icon(String theme_icon) {
		this.theme_icon = theme_icon;
	}

	public int getTheme_installcnt() {
		return theme_installcnt;
	}

	public void setTheme_installcnt(int theme_installcnt) {
		this.theme_installcnt = theme_installcnt;
	}

	@Override
	public String toString() {
		return "Theme [theme_seq=" + theme_seq + ", theme_name=" + theme_name + ", theme_lang=" + theme_lang
				+ ", theme_font=" + theme_font + ", theme_likes=" + theme_likes + ", theme_col1=" + theme_col1
				+ ", theme_col2=" + theme_col2 + ", theme_col3=" + theme_col3 + ", theme_col4=" + theme_col4
				+ ", theme_col5=" + theme_col5 + ", theme_producer=" + theme_producer + ", theme_filepath="
				+ theme_filepath + ", theme_url=" + theme_url + ", theme_icon=" + theme_icon + ", theme_installcnt="
				+ theme_installcnt + "]";
	}
	
	
	
}

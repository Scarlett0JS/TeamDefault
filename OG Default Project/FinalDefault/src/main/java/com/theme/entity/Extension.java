package com.theme.entity;

public class Extension {
	private int ex_seq;
	private String ex_name;
	private String ex_producer;
	private String ex_detail;
	private String admin_id;
	private String ex_cnt;
	private String ex_filepath;
	private String ex_url;
	private String ex_category;
	
	public Extension() {
		super();
	}

	public Extension(int ex_seq, String ex_name, String ex_producer, String ex_detail, String admin_id, String ex_cnt,
			String ex_filepath, String ex_url, String ex_category) {
		super();
		this.ex_seq = ex_seq;
		this.ex_name = ex_name;
		this.ex_producer = ex_producer;
		this.ex_detail = ex_detail;
		this.admin_id = admin_id;
		this.ex_cnt = ex_cnt;
		this.ex_filepath = ex_filepath;
		this.ex_url = ex_url;
		this.ex_category = ex_category;
	}

	public int getEx_seq() {
		return ex_seq;
	}

	public void setEx_seq(int ex_seq) {
		this.ex_seq = ex_seq;
	}

	public String getEx_name() {
		return ex_name;
	}

	public void setEx_name(String ex_name) {
		this.ex_name = ex_name;
	}

	public String getEx_producer() {
		return ex_producer;
	}

	public void setEx_producer(String ex_producer) {
		this.ex_producer = ex_producer;
	}

	public String getEx_detail() {
		return ex_detail;
	}

	public void setEx_detail(String ex_detail) {
		this.ex_detail = ex_detail;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getEx_cnt() {
		return ex_cnt;
	}

	public void setEx_cnt(String ex_cnt) {
		this.ex_cnt = ex_cnt;
	}

	public String getEx_filepath() {
		return ex_filepath;
	}

	public void setEx_filepath(String ex_filepath) {
		this.ex_filepath = ex_filepath;
	}

	public String getEx_url() {
		return ex_url;
	}

	public void setEx_url(String ex_url) {
		this.ex_url = ex_url;
	}

	public String getEx_category() {
		return ex_category;
	}

	public void setEx_category(String ex_category) {
		this.ex_category = ex_category;
	}

	@Override
	public String toString() {
		return "Extension [ex_seq=" + ex_seq + ", ex_name=" + ex_name + ", ex_producer=" + ex_producer + ", ex_detail="
				+ ex_detail + ", admin_id=" + admin_id + ", ex_cnt=" + ex_cnt + ", ex_filepath=" + ex_filepath
				+ ", ex_url=" + ex_url + ", ex_category=" + ex_category + "]";
	}
	
	
}

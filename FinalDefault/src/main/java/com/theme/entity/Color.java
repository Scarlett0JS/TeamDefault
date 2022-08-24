package com.theme.entity;

public class Color {
	private int color_seq;
	private String color_name;
	private String rgb_value;
	private String html_code;
	private String admin_id;
	
	public Color() {
		super();
	}

	public Color(int color_seq, String color_name, String rgb_value, String html_code, String admin_id) {
		super();
		this.color_seq = color_seq;
		this.color_name = color_name;
		this.rgb_value = rgb_value;
		this.html_code = html_code;
		this.admin_id = admin_id;
	}

	public int getColor_seq() {
		return color_seq;
	}

	public void setColor_seq(int color_seq) {
		this.color_seq = color_seq;
	}

	public String getColor_name() {
		return color_name;
	}

	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}

	public String getRgb_value() {
		return rgb_value;
	}

	public void setRgb_value(String rgb_value) {
		this.rgb_value = rgb_value;
	}

	public String getHtml_code() {
		return html_code;
	}

	public void setHtml_code(String html_code) {
		this.html_code = html_code;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	@Override
	public String toString() {
		return "Color [color_seq=" + color_seq + ", color_name=" + color_name + ", rgb_value=" + rgb_value
				+ ", html_code=" + html_code + ", admin_id=" + admin_id + "]";
	}
	
}

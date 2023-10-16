package com.theme.entity;

public class LangPage {
	private String lang;
	private int inputpage;
	
	public LangPage() {
		super();
	}

	public LangPage(String lang, int inputpage) {
		super();
		this.lang = lang;
		this.inputpage = inputpage;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public int getInputpage() {
		return inputpage;
	}

	public void setInputpage(int inputpage) {
		this.inputpage = inputpage;
	}

	@Override
	public String toString() {
		return "LangPage [lang=" + lang + ", inputpage=" + inputpage + "]";
	}
	
}

package com.theme.frontcontroller;

public class ViewResolver {
	public static String makeView(String nextPage) {
		return "WEB-INF/FinalView/" + nextPage + ".jsp"; 
	}
}

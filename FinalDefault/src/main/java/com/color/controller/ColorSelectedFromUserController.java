package com.color.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;

public class ColorSelectedFromUserController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String one = request.getParameter("0");
		String two = request.getParameter("1");
		String three = request.getParameter("2");
		String four = request.getParameter("3");
		String five = request.getParameter("4");
		
		return null;
	}

}

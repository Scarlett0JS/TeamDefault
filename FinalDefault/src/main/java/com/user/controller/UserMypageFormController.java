package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;

public class UserMypageFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		request.setAttribute("user_id", user_id);
		
		return "UserPage";
	}

}

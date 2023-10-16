package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;

public class UserPwUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		User user = new User();
		user.setUser_id(user_id);
		user.setUser_pw(user_pw);
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.UserPwUpdate(user);
		
		return null;
	}

}

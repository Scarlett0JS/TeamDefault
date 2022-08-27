package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;

public class UserNickUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		String user_nick = request.getParameter("user_nick");
		
		User user = new User();
		user.setUser_id(user_id);
		user.setUser_nick(user_nick);
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.UserNickUpdate(user);
		
		return null;
	}

}

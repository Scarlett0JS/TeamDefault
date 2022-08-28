package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;

public class UserDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = (User)request.getSession().getAttribute("userVo");
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.UserDelete(user.getUser_id());
		
		return null;
	}

}

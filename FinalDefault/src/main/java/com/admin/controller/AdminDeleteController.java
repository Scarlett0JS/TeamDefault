package com.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;

public class AdminDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		
		String user_id = request.getParameter("user_id");
		dao.Disable();
		dao.UserDelete(user_id);
		dao.Enable();
		return null;
	}

}

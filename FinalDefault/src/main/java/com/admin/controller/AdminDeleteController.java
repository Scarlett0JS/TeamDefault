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
		
		// User 관련 info 전부 삭제
		dao.UserPostDelete(user_id);
		dao.UserCommentDelete(user_id);
		dao.UserFavsThemeDelete(user_id);
		dao.UserDelete(user_id);
		
		dao.Enable();
		
		return null;
	}

}

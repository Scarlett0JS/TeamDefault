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
		
		dao.Disable();
		
		// User 관련 info 전부 삭제
		dao.UserPostDelete(user.getUser_id());
		dao.UserCommentDelete(user.getUser_id());
		dao.UserFavsThemeDelete(user.getUser_id());
		dao.UserDelete(user.getUser_id());
		
		dao.Enable();
		
		return null;
	}

}

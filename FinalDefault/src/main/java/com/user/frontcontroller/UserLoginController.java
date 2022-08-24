package com.user.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;

public class UserLoginController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("userEmail");
		String user_pw = request.getParameter("userPw");
		
		User user = new User(user_id, user_pw);
		MainMyBatisDAO dao = new MainMyBatisDAO();
		
		User userVo = dao.UserLogin(user);
		
		if (userVo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userVo", userVo);
			return "1";
		}else {
			return "0";			
		}
		
	}

}

package com.user.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;

public class UserRegisterController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("userEmail");
		String user_pw = request.getParameter("userPw");
		String user_pw_confirm = request.getParameter("userPw-confirm");
		String user_name = request.getParameter("userName");
		
		HashMap<String, String> errMap = new HashMap<String, String>();

		if (!user_pw.equals(user_pw_confirm)) {
			errMap.put("registerError", "checkPw");
			errMap.put("user_id", user_id);
			errMap.put("user_name", user_name);
			request.setAttribute("registerError", errMap);
			return "register";
		} else {
			User user = new User(user_id, user_pw, user_name);
			MainMyBatisDAO dao = new MainMyBatisDAO();
			try {
				dao.UserRegister(user);
				return "main";				
			} catch (Exception e) {
				errMap.put("registerError", "checkEmail");
				request.setAttribute("registerError", errMap);
				return "register";
			}
		}
	}

}

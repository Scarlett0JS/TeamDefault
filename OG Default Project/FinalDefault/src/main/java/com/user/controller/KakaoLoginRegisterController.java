package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;

public class KakaoLoginRegisterController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("email");
		String user_name = request.getParameter("nickname");

		MainMyBatisDAO dao = new MainMyBatisDAO();
		User user = new User(user_id, user_pw, user_name);
		int flag = dao.userCheck(user_id);
		
		if (flag == 0) {
			dao.KakaoRegister(user);
		}
				
		// 로그인한 상태로 메인으로 돌아간다
		HttpSession session = request.getSession();
		session.setAttribute("userVo", user);
		
		return "redirect:/index.do";
	}

}
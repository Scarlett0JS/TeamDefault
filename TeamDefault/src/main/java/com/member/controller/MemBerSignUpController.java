package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.theme.dao.ThemeMyBatisDAO;
import com.theme.entity.Member;

public class MemBerSignUpController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("SignUpEmail");
		String username = request.getParameter("SignUpUsername");
		String password = request.getParameter("SignUpPwd");
		
		Member vo = new Member(email, username, password);
		ThemeMyBatisDAO dao = new ThemeMyBatisDAO();
		
		dao.MemberSignUp(vo);
			
		return null;
	}
}

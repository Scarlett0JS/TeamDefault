package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.main.controller.Controller;
import com.member.entity.Member;
import com.theme.dao.ThemeMyBatisDAO;

public class MemberLoginController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String memId = request.getParameter("username");
		String memPwd = request.getParameter("password");
		
		Member vo = new Member(memId, memPwd);
		ThemeMyBatisDAO dao = new ThemeMyBatisDAO();
		
		Member memberDTO = dao.MemberLogin(vo);
		
		if (memberDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberDTO", memberDTO);
		}		
		return "redirect:/index.do";
	}

}

package com.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.theme.dao.ThemeMyBatisDAO;

public class MemberDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		ThemeMyBatisDAO dao = new ThemeMyBatisDAO();
		
		String memId = request.getParameter("memId");
		dao.memberDelete(memId);
		
		return null;
	}

}

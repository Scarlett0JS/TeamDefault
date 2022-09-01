package com.theme.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Theme;

public class ThemeDetailController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int theme_seq = Integer.parseInt(request.getParameter("seq"));
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		Theme themeVo = dao.Themeselect(theme_seq);
		
		request.setAttribute("themeVo", themeVo);
		
		return "ThemeDetail";
	}

}

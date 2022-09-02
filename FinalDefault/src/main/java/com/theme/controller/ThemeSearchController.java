package com.theme.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Theme;

public class ThemeSearchController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String keyword = request.getParameter("ThemeSearch");

		if (keyword == null) {
			return "redirect:/index.do";
		}else {
			MainMyBatisDAO dao = new MainMyBatisDAO();
			
			List<Theme> themeVo = dao.searchThemeName("%"+keyword+"%");
			
			request.setAttribute("themeVo", themeVo);
			
			return "ThemeSearch";
		}
		
	}

}

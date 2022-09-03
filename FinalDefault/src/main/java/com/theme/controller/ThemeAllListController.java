package com.theme.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Paging;
import com.theme.entity.Theme;

public class ThemeAllListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		
		if (page <= 0) {
			page = 1;
		}
		
		int totalArticleCount = dao.allThemeCount();
		Paging paging = new Paging(page, totalArticleCount, 16);
		
		List<Theme> themeVo = dao.allThemeList(16*page - 15);
		
		request.setAttribute("paging", paging);
		request.setAttribute("themeVo", themeVo);
		
		return "ThemeAll";
	}

}

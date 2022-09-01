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
		
		String page = request.getParameter("page");
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		
		if (page == null) {
			page = "1";
		}
		
		int totalArticleCount = dao.allThemeCount();
		
		int inputpage = Integer.parseInt(page);
		Paging paging = new Paging(inputpage, totalArticleCount, 16);

//		System.out.println(paging.toString());
		
		List<Theme> themeVo = dao.allThemeList(16*inputpage - 15);
		
		System.out.println(themeVo.toString());
		
		request.setAttribute("paging", paging);
		request.setAttribute("themeVo", themeVo);
		
		return "ThemeAll";
	}

}

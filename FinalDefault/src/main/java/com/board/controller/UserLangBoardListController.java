package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;
import com.theme.entity.LangPage;
import com.theme.entity.Paging;

public class UserLangBoardListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String lang = request.getParameter("lang");
		int page = Integer.parseInt(request.getParameter("page"));
		
		page = page <= 0 ? 1 : page;
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		int totalAriticleCount = dao.LangBoardCount(lang);
		
		LangPage lp = new LangPage(lang, page);
		List<Board> boardList = dao.LangBoardList(lp);
		
		Paging paging = new Paging(page, totalAriticleCount, 20);
		
		request.setAttribute("lang", lang);
		request.setAttribute("paging", paging);
		request.setAttribute("boardList", boardList);
		
		return "commuLang";
	}

}

package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;
import com.theme.entity.Paging;

public class UserBoardListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int page = Integer.parseInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		
		MainMyBatisDAO dao = new MainMyBatisDAO();		
		int totalArticleCount = dao.allBoardCount();
		Paging paging = new Paging(page, totalArticleCount, 20);
		List<Board> boardList = dao.allBoardList(20*page - 19);
		
		request.setAttribute("paging", paging);
		request.setAttribute("boardList", boardList);
		
		return "community";
	}

}

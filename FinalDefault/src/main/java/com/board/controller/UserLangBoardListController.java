package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;

public class UserLangBoardListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String lang = request.getParameter("lang");
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		List<Board> boardList = dao.LangBoardList(lang);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("lang", lang);
		
		return "commuLang";
	}

}

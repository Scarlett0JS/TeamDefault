package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;

public class UserBoardWriteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("summerTitle");
		String content = request.getParameter("summernote");
		String writer = request.getParameter("Writer");
		String lang = request.getParameter("Lang");
		
		Board vo = new Board(title, content, writer, lang);
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.BoardInsert(vo);
		
		return "redirect:/UserLangBoardList.do?lang=" + lang + "&" + "page=1";
	}

}

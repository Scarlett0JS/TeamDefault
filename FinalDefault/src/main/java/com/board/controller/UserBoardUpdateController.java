package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;

public class UserBoardUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String writer = request.getParameter("Writer");
		String title = request.getParameter("summerTitle");
		String content = request.getParameter("summernote");
		Board vo = new Board(board_num , title, content, writer);
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.BoardUpdate(vo);
		
		return "redirect:/UserBoardView.do?num=" + board_num;
	}

}
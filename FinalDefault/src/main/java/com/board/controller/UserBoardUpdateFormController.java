package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;

public class UserBoardUpdateFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));

		MainMyBatisDAO dao = new MainMyBatisDAO();
		Board board = dao.BoardSelect(board_num);
		
		System.out.println(board.toString());
		
		request.setAttribute("board", board);
		
		return "commuUpdate";
	}

}

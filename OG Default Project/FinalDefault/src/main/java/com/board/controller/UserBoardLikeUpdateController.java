package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;

public class UserBoardLikeUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.BoardLikeUpdate(board_num);
		
		return null;
	}

}

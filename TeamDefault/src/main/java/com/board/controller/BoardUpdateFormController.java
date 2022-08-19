package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMyBatisDAO;
import com.board.entity.Board;

public class BoardUpdateFormController implements Controller {
    public BoardUpdateFormController() {
        super();
    }

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		Board vo = dao.boardView(num);
		
		request.setAttribute("vo", vo);
		
		return "boardUpdate";
	}
}

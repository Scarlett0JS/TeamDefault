package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMyBatisDAO;

public class BoardDeleteController implements Controller {
  
    public BoardDeleteController() {
        super();
    }

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.boardDelete(num);
		
		return null;
	}
}

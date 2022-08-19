package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMyBatisDAO;
import com.board.entity.Board;

public class BoardUpdateController implements Controller{

    public BoardUpdateController() {
        super();
    }

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board vo = new Board(num, title, content);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		dao.boardUpdate(vo);
		
		return null;
	}

}

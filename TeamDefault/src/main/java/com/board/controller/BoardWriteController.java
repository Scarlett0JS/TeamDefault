package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMyBatisDAO;
import com.board.entity.Board;

public class BoardWriteController implements Controller{

    public BoardWriteController() {
        super();
    }

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		System.out.println(content);
		
		Board vo = new Board(title, content, writer);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		dao.boardWrite(vo);
		
		return null;
	}

}

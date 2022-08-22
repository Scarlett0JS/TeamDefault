package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.theme.dao.ThemeMyBatisDAO;
import com.theme.entity.Board;

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
		
		Board vo = new Board(title, content, writer);
		ThemeMyBatisDAO dao = new ThemeMyBatisDAO();
		
		dao.boardWrite(vo);
		
		return null;
	}

}

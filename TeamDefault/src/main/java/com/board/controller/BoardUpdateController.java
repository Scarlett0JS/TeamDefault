package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.theme.dao.ThemeMyBatisDAO;
import com.theme.entity.Board;

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
		ThemeMyBatisDAO dao = new ThemeMyBatisDAO();
		
		dao.boardUpdate(vo);
		
		return null;
	}

}

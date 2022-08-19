package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMyBatisDAO;
import com.board.entity.Board;
import com.google.gson.Gson;

public class BoardListController implements Controller{
    public BoardListController() {
        super();
    }

    public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		List<Board> board_list = dao.allList();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(board_list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(json);
		
		return null;
	}
}

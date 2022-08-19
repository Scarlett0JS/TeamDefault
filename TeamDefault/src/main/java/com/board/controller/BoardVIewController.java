package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMyBatisDAO;
import com.board.entity.Board;
import com.google.gson.Gson;

public class BoardVIewController implements Controller{
    public BoardVIewController() {
        super();
    }

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.countUpdate(num);
		Board vo = dao.boardView(num);
		
		Gson gson = new Gson();
		String json = gson.toJson(vo);
		
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}

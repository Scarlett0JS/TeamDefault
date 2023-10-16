package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;

public class UserPostedListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		List<Board> boardVo = dao.UserPostedselect(user_id);
		
		Gson gson = new Gson();
		String json = gson.toJson(boardVo);
		
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}

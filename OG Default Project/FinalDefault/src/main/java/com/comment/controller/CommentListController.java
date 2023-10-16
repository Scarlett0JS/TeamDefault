package com.comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Comment_nick;

public class CommentListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		List<Comment_nick> CommentList = dao.allCommentList(board_num);
		
		Gson gson = new Gson();
		String json = gson.toJson(CommentList);
		
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}

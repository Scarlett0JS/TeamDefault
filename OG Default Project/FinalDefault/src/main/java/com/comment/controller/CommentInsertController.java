package com.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Comment;

public class CommentInsertController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String comment = request.getParameter("comment");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String user_id = request.getParameter("user_id");
		
		Comment vo = new Comment(comment, board_num, user_id);
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		
		dao.CommentWrite(vo);
		
		return null;
	}

}

package com.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Comment;

public class CommentDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		Comment vo = new Comment(); 
		vo.setCmt_seq(comment_num);
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.CommentDelete(vo);
		
		return null;
	}

}

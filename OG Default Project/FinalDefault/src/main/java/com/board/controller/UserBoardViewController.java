package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Board;

public class UserBoardViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		MainMyBatisDAO dao = new MainMyBatisDAO();
		dao.BoardCntUpdate(num);
		
		Board vo = dao.BoardView(num);
		
		request.setAttribute("vo", vo);
		
		/* System.out.println(request.getSession().getAttribute("userVo")); */
		
		return "commuView";
	}

}

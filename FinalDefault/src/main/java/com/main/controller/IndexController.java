package com.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Extension;

public class IndexController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		List<Extension> allExList = dao.allExtension();
		List<Extension> otherExList = dao.otherExtension();
		
		request.setAttribute("allExList", allExList);
		request.setAttribute("otherExList", otherExList);
		
		return "main";
	}

}

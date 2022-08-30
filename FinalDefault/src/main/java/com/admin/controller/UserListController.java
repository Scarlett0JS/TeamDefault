package com.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;

public class UserListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		List<User> user_list = dao.userList();
		
		Gson gson = new Gson();
		String json = gson.toJson(user_list);
		
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(json);
		
		return null;
	}

}

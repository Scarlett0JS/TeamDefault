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
		
		String user_id = ((User) request.getSession().getAttribute("userVo")).getUser_id();
		request.setAttribute("user_id", user_id);
		
		return "adminPage";
	}

}

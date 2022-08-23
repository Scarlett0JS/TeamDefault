package com.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.main.controller.Controller;
import com.theme.dao.ThemeMyBatisDAO;
import com.theme.entity.Member;

public class MemberListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ThemeMyBatisDAO dao = new ThemeMyBatisDAO();
		List<Member> member_list = dao.memberList();
		
		Gson gson = new Gson();
		String json = gson.toJson(member_list);
		
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(json);
		
		return null;
	}

}

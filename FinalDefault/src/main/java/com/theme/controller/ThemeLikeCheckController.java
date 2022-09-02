package com.theme.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.User;
import com.theme.entity.User_Favs;

public class ThemeLikeCheckController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User)request.getSession().getAttribute("userVo");
		int theme_seq = Integer.parseInt(request.getParameter("theme_seq"));
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		Gson gson = new Gson();
		
		User_Favs uf = new User_Favs(theme_seq, user.getUser_id());
		HashMap<String, String> flagmap = new HashMap<String, String>();
		String json = null;
		
		int flag = dao.selectUserFavs(uf);
		
		if (flag == 0) {
			flagmap.put("flag", "full");
			json = gson.toJson(flagmap);
		} else {
			flagmap.put("flag", "empty");
			json = gson.toJson(flagmap);
		}
		
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}

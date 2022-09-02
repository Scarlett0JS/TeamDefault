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

public class ThemeLikeUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = (User)request.getSession().getAttribute("userVo");
		int theme_seq = Integer.parseInt(request.getParameter("theme_seq"));
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		Gson gson = new Gson();
		
		User_Favs uf = new User_Favs(theme_seq, user.getUser_id());
		
		int flag = dao.selectUserFavs(uf);
		
		if (flag == 0) {
			dao.InsertUserFavs(uf);	
			dao.ThemeUpdateLikeplus(theme_seq);
		} else {
			dao.DeleteUserFavs(uf);
			dao.ThemeUpdateLikeminus(theme_seq);
		}
		
		
		return null;
	}

}

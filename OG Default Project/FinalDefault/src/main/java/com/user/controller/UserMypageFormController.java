package com.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.theme.entity.Theme;

public class UserMypageFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		
		MainMyBatisDAO dao = new MainMyBatisDAO();
		
		List<Theme> themeVo = dao.UserLikeThemeSelect(user_id);
		
		request.setAttribute("user_id", user_id);
		request.setAttribute("themeVo", themeVo);
		
		return "UserPage";
	}

}

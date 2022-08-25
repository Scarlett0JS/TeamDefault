package com.theme.frontcontroller;

import java.util.HashMap;

import com.board.controller.UserBoardFormController;
import com.board.controller.UserBoardListController;
import com.board.controller.UserBoardViewController;
import com.main.controller.Controller;
import com.main.controller.IndexController;
import com.user.controller.UserLoginController;
import com.user.controller.UserLoginFormController;
import com.user.controller.UserLogoutController;
import com.user.controller.UserRegisterController;
import com.user.controller.UserRegisterFormController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/index.do", new IndexController());
		
		// User
		mappings.put("/UserRegisterForm.do", new UserRegisterFormController());
		mappings.put("/UserLoginForm.do", new UserLoginFormController());
		mappings.put("/UserLogin.do", new UserLoginController());
		mappings.put("/UserRegister.do", new UserRegisterController());
		mappings.put("/UserLogout.do", new UserLogoutController());
		
		// Board
		mappings.put("/UserBoardForm.do", new UserBoardFormController());
		mappings.put("/UserBoardList.do", new UserBoardListController());
		mappings.put("/UserBoardView.do", new UserBoardViewController());
		
	}
	
	public Controller getController(String command) {
		return mappings.get(command);
	}
}

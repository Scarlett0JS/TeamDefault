package com.theme.frontcontroller;

import java.util.HashMap;

import com.main.controller.Controller;
import com.main.controller.IndexController;
import com.user.frontcontroller.UserLoginController;
import com.user.frontcontroller.UserLoginFormController;
import com.user.frontcontroller.UserRegisterFormController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/index.do", new IndexController());
		
		// User
		mappings.put("/UserRegisterForm.do", new UserRegisterFormController());
		mappings.put("/UserLoginForm.do", new UserLoginFormController());
		mappings.put("/UserLogin.do", new UserLoginController());
		

	}
	
	public Controller getController(String command) {
		return mappings.get(command);
	}
}

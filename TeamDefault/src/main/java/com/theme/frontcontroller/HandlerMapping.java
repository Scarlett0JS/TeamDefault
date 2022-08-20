package com.theme.frontcontroller;

import java.util.HashMap;

import com.board.controller.BoardDeleteController;
import com.board.controller.BoardListController;
import com.board.controller.BoardMainController;
import com.board.controller.BoardUpdateController;
import com.board.controller.BoardVIewController;
import com.board.controller.BoardWriteController;
import com.main.controller.Controller;
import com.main.controller.IndexController;
import com.member.controller.MemBerSignUpController;
import com.member.controller.MemberLoginController;
import com.member.controller.MemberLogoutController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/boardList.do", new BoardListController());
		mappings.put("/boardWrite.do", new BoardWriteController());
		mappings.put("/boardVIew.do", new BoardVIewController());
		mappings.put("/boardDelete.do", new BoardDeleteController());
		mappings.put("/boardUpdate.do", new BoardUpdateController());
		mappings.put("/boardMain.do", new BoardMainController());
		mappings.put("/MemberSignUp.do", new MemBerSignUpController());
		mappings.put("/MemberLogin.do", new MemberLoginController());
		mappings.put("/MemberLogOut.do", new MemberLogoutController());
		mappings.put("/index.do", new IndexController());
	}
	
	public Controller getController(String command) {
		return mappings.get(command);
	}
}

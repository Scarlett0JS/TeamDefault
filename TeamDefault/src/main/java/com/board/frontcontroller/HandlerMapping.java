package com.board.frontcontroller;

import java.util.HashMap;

import com.board.controller.BoardDeleteController;
import com.board.controller.BoardListController;
import com.board.controller.BoardUpdateController;
import com.board.controller.BoardUpdateFormController;
import com.board.controller.BoardVIewController;
import com.board.controller.BoardWriteController;
import com.board.controller.Controller;
import com.board.controller.IndexController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/boardList.do", new BoardListController());
		mappings.put("/boardWrite.do", new BoardWriteController());
		mappings.put("/boardVIew.do", new BoardVIewController());
		mappings.put("/boardDelete.do", new BoardDeleteController());
		mappings.put("/boardUpdate.do", new BoardUpdateController());
		mappings.put("/boardUpdateForm.do", new BoardUpdateFormController());
		mappings.put("/index.do", new IndexController());
	}
	
	public Controller getController(String command) {
		return mappings.get(command);
	}
}

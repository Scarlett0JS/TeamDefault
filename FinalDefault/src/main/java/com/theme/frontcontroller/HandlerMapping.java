package com.theme.frontcontroller;

import java.util.HashMap;

import com.admin.controller.AdminDeleteController;
import com.admin.controller.AdminUserListController;
import com.admin.controller.UserListController;
import com.board.controller.UserBoardDeleteController;
import com.board.controller.UserBoardLikeUpdateController;
import com.board.controller.UserBoardListController;
import com.board.controller.UserBoardUpdateController;
import com.board.controller.UserBoardUpdateFormController;
import com.board.controller.UserBoardViewController;
import com.board.controller.UserBoardWriteController;
import com.board.controller.UserBoardWriteFormController;
import com.board.controller.UserLangBoardListController;
import com.color.controller.ColerListController;
import com.color.controller.ColorSelectController;
import com.color.controller.ColorSelectedFromUserController;
import com.comment.controller.CommentDeleteController;
import com.comment.controller.CommentInsertController;
import com.comment.controller.CommentListController;
import com.main.controller.Controller;
import com.main.controller.ErrorController;
import com.main.controller.IndexController;
import com.theme.controller.ThemeAllListController;
import com.theme.controller.ThemeDetailController;
import com.theme.controller.ThemeSearchController;
import com.user.controller.UserDeleteController;
import com.user.controller.UserDetailController;
import com.user.controller.UserLoginController;
import com.user.controller.UserLoginFormController;
import com.user.controller.UserLogoutController;
import com.user.controller.UserMypageFormController;
import com.user.controller.UserNickUpdateController;
import com.user.controller.UserPostedListController;
import com.user.controller.UserPwUpdateController;
import com.user.controller.UserRegisterController;
import com.user.controller.UserRegisterFormController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/index.do", new IndexController());
		mappings.put("/Error.do", new ErrorController());
		
		// User
		mappings.put("/UserRegisterForm.do", new UserRegisterFormController());
		mappings.put("/UserLoginForm.do", new UserLoginFormController());
		mappings.put("/UserLogin.do", new UserLoginController());
		mappings.put("/UserRegister.do", new UserRegisterController());
		mappings.put("/UserLogout.do", new UserLogoutController());
		mappings.put("/UserMypageForm.do", new UserMypageFormController());
		mappings.put("/UserDelete.do", new UserDeleteController());
		mappings.put("/UserDetailList.do", new UserDetailController());
		mappings.put("/UserNickUpdate.do", new UserNickUpdateController());
		mappings.put("/UserPwUpdate.do", new UserPwUpdateController());
		mappings.put("/UserPostedList.do", new UserPostedListController());

		// Board
		mappings.put("/UserBoardList.do", new UserBoardListController());
		mappings.put("/UserBoardView.do", new UserBoardViewController());
		mappings.put("/UserLangBoardList.do", new UserLangBoardListController());
		mappings.put("/UserBoardDelete.do", new UserBoardDeleteController());
		mappings.put("/UserBoardWriteForm.do", new UserBoardWriteFormController());
		mappings.put("/UserBoradWrite.do", new UserBoardWriteController());
		mappings.put("/UserBoardUpdateForm.do", new UserBoardUpdateFormController());
		mappings.put("/UserBoardUpdate.do", new UserBoardUpdateController());
		mappings.put("/UserBoardLikeUpdate.do", new UserBoardLikeUpdateController());
		
		// Comment
		mappings.put("/CommentList.do", new CommentListController());
		mappings.put("/CommentInsert.do", new CommentInsertController());
		mappings.put("/CommentDelete.do", new CommentDeleteController());
		
		// Color
		mappings.put("/ColorAllList.do", new ColerListController());
		mappings.put("/ColorSelect.do", new ColorSelectController());
		mappings.put("/ColorSelectedFromUser.do", new ColorSelectedFromUserController());
		
		// Admin
		mappings.put("/UserList.do", new UserListController());
		mappings.put("/AdminDelete.do", new AdminDeleteController());
		mappings.put("/AdminUserList.do", new AdminUserListController());
		
		// Themes
		mappings.put("/ThemeAllList.do", new ThemeAllListController());
		mappings.put("/ThemeDetail.do", new ThemeDetailController());
		mappings.put("/ThemeSearch.do", new ThemeSearchController());
	}
	
	public Controller getController(String command) {
		return mappings.get(command);
	}
}

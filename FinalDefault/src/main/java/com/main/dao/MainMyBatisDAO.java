package com.main.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.theme.entity.Board;
import com.theme.entity.Color;
import com.theme.entity.Comment;
import com.theme.entity.Comment_nick;
import com.theme.entity.Extension;
import com.theme.entity.LangPage;
import com.theme.entity.Theme;
import com.theme.entity.User;
import com.theme.entity.User_Favs;

public class MainMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "com/main/dao/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// User
	public User UserLogin(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		User uvo = session.selectOne("UserLogin", user);
		session.close();
		return uvo;
	}
	
	public int UserRegister(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.insert("UserRegister", user);
		session.commit();
		session.close();
		return flag;		
	}
	
	public void UserDelete(String user_id) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("UserDelete", user_id);			
		session.commit();
		session.close();
	}
	
	public User UserSelect(String user_id) {
		SqlSession session = sqlSessionFactory.openSession();
		User uvo = session.selectOne("UserSelect", user_id);
		session.close();
		return uvo;
	}
	
	public void UserNickUpdate(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("UserNickUpdate", user);
		session.commit();
		session.close();
	}
	
	public void UserPwUpdate(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("UserPwUpdate", user);
		session.commit();
		session.close();
	}
	
	public List<Board> UserPostedselect(String user_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> dto = session.selectList("UserPostedselect", user_id);
		session.close();
		return dto;
	}
	
	public void KakaoRegister(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("KakaoRegister", user);			
		session.commit();
		session.close();
	}
	
	public int userCheck(String user_id) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.selectOne("userCheck", user_id);
		session.close();
		return flag;
	}
	
	public List<Theme> UserLikeThemeSelect(String user_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Theme> themeVo = session.selectList("UserLikeThemeSelect", user_id);
		session.close();
		return themeVo;
	}
	
	// Board
	public List<Board> allBoardList(int inputpage) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> boardList = session.selectList("allBoardList", inputpage);
		session.close();
		return boardList;
	}
	
	public void BoardCntUpdate(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("BoardCntUpdate", num);
		session.commit();
		session.close();
	}
	
	public Board BoardView(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		Board bvo = session.selectOne("BoardView", num);
		session.close();
		return bvo;
	}
	
	public List<Board> LangBoardList(LangPage lp) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> boardList = session.selectList("LangBoardList", lp);
		session.close();
		return boardList;
	}
	
	public void BoardDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("BoardDelete", num);
		session.commit();
		session.close();
	}
	
	public void BoardInsert(Board vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("BoardInsert", vo);
		session.commit();
		session.close();
	}
	
	public Board BoardSelect(int board_num) {
		SqlSession session = sqlSessionFactory.openSession();
		Board vo = session.selectOne("BoardSelect", board_num);
		session.close();
		return vo;
	}
	
	public void BoardUpdate(Board vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("BoardUpdate", vo);
		session.commit();
		session.close();
	}
	
	public void BoardLikeUpdate(int board_num) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("BoardLikeUpdate", board_num);
		session.commit();
		session.close();
	}
	
	public int allBoardCount() {
		SqlSession session = sqlSessionFactory.openSession();
		int count = session.selectOne("allBoardCount");
		session.close();
		return count;
	}
	
	public int LangBoardCount(String lang) {
		SqlSession session = sqlSessionFactory.openSession();
		int count = session.selectOne("LangBoardCount", lang);
		session.close();
		return count;
	}

	// Comment
	public List<Comment_nick> allCommentList(int board_num) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Comment_nick> commentList = session.selectList("allCommentList", board_num);
		session.close();
		return commentList;
	}
	
	public void CommentWrite(Comment vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("CommentWrite", vo);
		session.commit();
		session.close();
	}
	
	public void CommentDelete(Comment vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("CommentDelete", vo);
		session.commit();
		session.close();
	}
	
	// Extension
	public List<Extension> allExtension() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Extension> exVo = session.selectList("allExtension");
		session.close();
		return exVo;
	}
	
	public List<Extension> otherExtension() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Extension> exVo = session.selectList("otherExtension");
		session.close();
		return exVo;
	}
	
	// Color
	public List<Color> allColor() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Color> colVo = session.selectList("allColor");
		session.close();
		return colVo;
	}
	
	// Admin
	public List<User> userList(){
		SqlSession session = sqlSessionFactory.openSession();
		List<User> userList = session.selectList("userList");
		session.close();
		return userList;
	}

	// constraint 
	public void Disable() {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("DisableBoard");
		session.update("DisableComment");
		//session.update("DisableUserFavs");
		session.update("DisableBoardComment");
		session.commit();
		session.close();
	}
	
	public void Enable() {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("EnableBoard");
		session.update("EnableComment");
		//session.update("EnableUserFavs");
		session.update("EnableBoardComment");
		session.commit();
		session.close();
	}

	// Theme
	public List<Theme> allThemeList(int inputpage) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Theme> themelist = session.selectList("allThemeList", inputpage);
		session.close();
		return themelist;
	}

	public Theme Themeselect(int seq) {
		SqlSession session = sqlSessionFactory.openSession();
		Theme vo = session.selectOne("Themeselect", seq);
		session.close();
		return vo;
	}

	public List<Theme> mostThemeSelect() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Theme> mostVo = session.selectList("mostThemeSelect");
		session.close();
		return mostVo;
	}

	public int allThemeCount() {
		SqlSession session = sqlSessionFactory.openSession();
		int allpage = session.selectOne("allThemeCount");
		session.close();
		return allpage;
	}

	public List<Theme> searchThemeName(String keyword) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Theme> themeVo = session.selectList("searchThemeName", keyword);
		session.close();
		return themeVo;
	}
	
	public void ThemeUpdateLikeplus(int theme_seq) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("ThemeUpdateLikeplus", theme_seq);
		session.commit();
		session.close();
	}
	
	public void ThemeUpdateLikeminus(int theme_seq) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("ThemeUpdateLikeminus", theme_seq);
		session.commit();
		session.close();
	}

	// UserFavs
	public int selectUserFavs(User_Favs uf) {
		SqlSession session = sqlSessionFactory.openSession();
		int flag = session.selectOne("selectUserFavs", uf);
		session.close();
		return flag;
	}

	public void InsertUserFavs(User_Favs uf) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("InsertUserFavs", uf);
		session.commit();
		session.close();
	}

	public void DeleteUserFavs(User_Favs uf) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("DeleteUserFavs", uf);
		session.commit();
		session.close();
	}




}

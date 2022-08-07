package kr.test.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.test.dao.TestDAO;
import kr.test.entity.TestDTO;

@WebServlet("/testLogin.do")
public class TestLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TestLoginController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("usrid");
		String userPwd = request.getParameter("usrpwd");
		
		TestDAO dao = new TestDAO();
		TestDTO vo = dao.checkLogin(userID, userPwd);
		
		request.setAttribute("user", vo);
		RequestDispatcher rd = request.getRequestDispatcher("testBoard/test_Check.jsp");
		rd.forward(request, response);
	}

}

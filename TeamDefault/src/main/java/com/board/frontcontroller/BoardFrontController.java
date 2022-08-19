package com.board.frontcontroller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.Controller;

@WebServlet("*.do")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardFrontController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String reqPath = request.getRequestURI();
		String cpath = request.getContextPath();
		String command = reqPath.substring(cpath.length());
		System.out.println(command);
		
		String nextPage = null;
		Controller controller = null;
		HandlerMapping mapping = new HandlerMapping();
		
		try {
			controller = mapping.getController(command);
			nextPage = controller.requestProcessor(request, response);
			
			if (nextPage != null) {
				if (nextPage.indexOf("redirect:")==-1) {
					RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(nextPage));
					rd.forward(request, response);				
				} else {
					response.sendRedirect(cpath + nextPage.split(":")[1]);
				}
			}			
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView("Error"));
			rd.forward(request, response);	
		}
	}

}

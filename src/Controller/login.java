package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bo.BookBO;

/**
 * Servlet implementation class checkLogin
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher r;
		
		String username = request.getParameter("username");
		if(username == null) {
//			new (or not login) user enter to the page
			r = request.getRequestDispatcher("pages/login.jsp");
			r.forward(request, response);
			return;
		}
		
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
//		validate login input
		if(username == null || password == null) {
			r = request.getRequestDispatcher("pages/login.jsp");
			request.setAttribute("error", "Chưa điền thông tin đăng nhập");
			r.forward(request, response);
			return;
		}
		
		if(username.equals("1") && password.equals("1")) {
			response.sendRedirect("/book_trading_servlet/");
//			r = request.getRequestDispatcher("pages/home.jsp");
//			r.forward(request, response);
			
		} else {
			r = request.getRequestDispatcher("pages/login.jsp");
			request.setAttribute("error", "Email hoặc mật khẩu không đúng");
			r.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher r = request.getRequestDispatcher("pages/login.jsp");
//		r.forward(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
////		doGet(request, response);
//		RequestDispatcher r;
//		
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		
////		validate login input
//		if(username == null || password == null) {
//			r = request.getRequestDispatcher("pages/login.jsp");
//			request.setAttribute("error", "Chưa điền thông tin đăng nhập");
//			r.forward(request, response);
//			return;
//		}
//		
//		if(username.equals("1") && password.equals("1")) {
////			response.sendRedirect("/");
//			r = request.getRequestDispatcher("pages/home.jsp");
//			r.forward(request, response);
//		} else {
//			r = request.getRequestDispatcher("pages/login.jsp");
//			request.setAttribute("error", "Email hoặc mật khẩu không đúng");
//			r.forward(request, response);
//		}
//	}
}

package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.UserBEAN;
import Bo.BookBO;
import Dao.UserDAO;

/**
 * Servlet implementation class checkLogin
 */
@WebServlet("/user")
public class user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		System.out.println(op);
		switch (op) {
		case "login":
			login(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		
		default:
			throw new IllegalArgumentException("Unexpected value: " + op);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher r;
		HttpSession session = request.getSession();
//		check login session
		boolean isLogin = session.getAttribute("isLogin") != null
				? true
				: false;
		request.setAttribute("isLogin", isLogin);
		if(isLogin) {
			response.sendRedirect("/book-store/");
			return;
		}
		UserDAO userdao = new UserDAO();

//		validate input params
		String email = request.getParameter("email");
		if(email == null) {
//			new (or not login) user enter to the page
			r = request.getRequestDispatcher("pages/login.jsp");
			r.forward(request, response);
			return;
		}
		
		String password = request.getParameter("password");
		
		if(email == null || password == null) {
			r = request.getRequestDispatcher("pages/login.jsp");
			request.setAttribute("error", "Chưa điền đầy đủ thông tin đăng nhập");
			r.forward(request, response);
			return;
		}

//		login
		UserBEAN user = userdao.login(email, password);
		if(user != null) {
			session.setAttribute("isLogin", true);
			session.setAttribute("user", user);
			response.sendRedirect("/book-store/");
		} else {
			r = request.getRequestDispatcher("pages/login.jsp");
			request.setAttribute("error", "Email hoặc mật khẩu không đúng");
			r.forward(request, response);
		}
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		session.setAttribute("isLogin", null);
		session.setAttribute("user", null);
		response.sendRedirect("/book-store/");
	}
}

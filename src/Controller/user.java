package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.OrderHistoryBEAN;
import Bean.UserBEAN;
import Bo.BookBO;
import Bo.OrderHistoryBO;
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

		switch (op) {
		case "login":
			login(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		case "orderhistory":
			directOrderHistory(request, response);
			break;
		
		default:
			throw new IllegalArgumentException("Unexpected value: " + op);
		}
	}

	private void directOrderHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher r;
		HttpSession session = request.getSession();
		
		UserBEAN user = session.getAttribute("user") != null ? (UserBEAN) session.getAttribute("user") : null;
		request.setAttribute("email", user != null ? user.getEmail() : null);

		r = request.getRequestDispatcher("pages/orderHistory.jsp");
		OrderHistoryBO bo = new OrderHistoryBO();
		ArrayList<OrderHistoryBEAN> lst = bo.getOrderHistory(user.getId());
		request.setAttribute("lstOrderHistory", lst);

		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher r;
		HttpSession session = request.getSession();
//		check login session
		UserBEAN user = session.getAttribute("user") != null ? (UserBEAN) session.getAttribute("user") : null;
		request.setAttribute("email", user != null ? user.getEmail() : null);

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
		UserDAO userdao = new UserDAO();
		UserBEAN userLogin = userdao.login(email, password);
		if(userLogin != null) {
			session.setAttribute("user", userLogin);
			response.sendRedirect("/book-store/");
			return;
		} else {
			r = request.getRequestDispatcher("pages/login.jsp");
			request.setAttribute("error", "Email hoặc mật khẩu không đúng");
			r.forward(request, response);
			return;
		}
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		response.sendRedirect("/book-store/");
	}
}

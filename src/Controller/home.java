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
import Bo.singletonTest;

/**
 * Servlet implementation class home
 */
@WebServlet("")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher r;
		HttpSession session = request.getSession();
		
		UserBEAN user = session.getAttribute("user") != null ? (UserBEAN) session.getAttribute("user") : null;
		request.setAttribute("email", user != null ? user.getEmail() : null);
		request.setAttribute("role", user != null ? user.getRole() : null);
		
		r = request.getRequestDispatcher("pages/home.jsp");
		BookBO bookBo = new BookBO();
		request.setAttribute("books", bookBo);
		
		r.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

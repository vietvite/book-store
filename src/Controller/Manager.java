package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.BookBEAN;
import Bean.UserBEAN;
import Bo.BookBO;
import Bo.CategoryBO;

/**
 * Servlet implementation class Manager
 */
@WebServlet("/manager")
public class Manager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		UserBEAN user = session.getAttribute("user") != null ? (UserBEAN) session.getAttribute("user") : null;
		request.setAttribute("email", user != null ? user.getEmail() : null);
		request.setAttribute("role", user != null ? user.getRole() : null);

		String op = request.getParameter("op");
		if(op == null) op = "";
		
		switch (op) {
		case "delete":
			deleteBook(request, response);
			break;
		case "editpage":
			directEditPage(request, response);
			break;
		case "submitedit":
			editBook(request, response);
			break;
		
		default:
			directList(request, response);
			return;
		}
	}

	private void directEditPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher r;
		r = request.getRequestDispatcher("pages/editBook.jsp");
		BookBO bookBo = new BookBO();
		String bookId = request.getParameter("bookId");
		BookBEAN book = bookBo.findById(bookId);
		
		CategoryBO bo = new CategoryBO();
		request.setAttribute("categories", bo.getAllCategories());
		
		request.setAttribute("book", book);
		r.forward(request, response);
	}

	private void editBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Vooo submit editt");
		BookBO bo = new BookBO();
		String bookId = request.getParameter("bookId");
		String bookName = request.getParameter("bookName");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String categoryId = request.getParameter("categoryId");
		long coverPrice = Long.parseLong(request.getParameter("coverPrice"));
		long price = Long.parseLong(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String imageUrl = request.getParameter("imageUrl");
		System.out.println("bookId: " + bookId);
		if(bookId == null) {
			return;
		}
		BookBEAN book = new BookBEAN(bookId, bookName, author, description, categoryId, coverPrice, price, quantity, imageUrl);
		System.out.println("Book: " + book.getBookName());
		bo.editBook(book);
		RequestDispatcher r;
		r = request.getRequestDispatcher("pages/bookManager.jsp");
		BookBO bookBo = new BookBO();
		request.setAttribute("books", bookBo.getBooks());
		r.forward(request, response);
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookBO bo = new BookBO();
		String bookId = request.getParameter("bookId");
		if(bookId == null) {
			return;
		}
		bo.deleteBook(bookId);
		RequestDispatcher r;
		r = request.getRequestDispatcher("pages/bookManager.jsp");
		BookBO bookBo = new BookBO();
		request.setAttribute("books", bookBo.getBooks());
		r.forward(request, response);
	}

	private void directList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher r;
		r = request.getRequestDispatcher("pages/bookManager.jsp");
		BookBO bookBo = new BookBO();
		request.setAttribute("books", bookBo.getBooks());
		
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

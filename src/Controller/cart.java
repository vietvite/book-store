package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.CartBEAN;
import Bo.CartBO;

/**
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("id");
		String operation = request.getParameter("op");
		HttpSession session = request.getSession();
		
		if(bookId != null && operation == null) {
			String bookName = request.getParameter("bookname");
			String author = request.getParameter("author");
			long price = Long.parseLong(request.getParameter("price"));
			String imageUrl = request.getParameter("imageUrl");

			CartBO cart = null;
			
			// Check exist cart session, if not, create new
			if(session.getAttribute("cart") == null) {
				cart = new CartBO();
				session.setAttribute("cart", cart);
			}
			// b1: save session to: cart variable
			cart = (CartBO) session.getAttribute("cart");
			
			// b2: change cart var when addCart called
			boolean exist = false;
			for(CartBEAN c: cart.cartList) {
				if(c.getBookId().equals(bookId)) {
					c.setQuantity(c.getQuantity() + 1);
					exist = true;
				}
			}
			
			if(!exist) {
				cart.addCart(bookId, bookName, author, price, 1, imageUrl);
			}
			
			// b3: save cart var into session
			session.setAttribute("cart", cart);
			// Show cart
			response.sendRedirect("/book_trading_servlet/cart");
		} else {
			RequestDispatcher r = request.getRequestDispatcher("pages/cart.jsp");
			r.forward(request, response);
		}
		
//		handle process in cart pages
		if(bookId != null && operation != null) {
			if(operation.equals("down1")) {
				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId)) {
						c.setQuantity(c.getQuantity() - 1);
					}
				}
				
				// b3: save cart var into session
				session.setAttribute("cart", cart);
				// Show cart
				response.sendRedirect("cart.jsp");
			}
			
			if(operation.equals("up1")) {
				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId)) {
						c.setQuantity(c.getQuantity() + 1);
					}
				}
				
				// b3: save cart var into session
				session.setAttribute("cart", cart);
				// Show cart
				response.sendRedirect("cart.jsp");
			}
			
			if(operation.equals("update")) {
				String quantity = request.getParameter("quantity");
				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId)) {
						c.setQuantity(Integer.parseInt(quantity));
					}
				}
				
				// b3: save cart var into session
				session.setAttribute("cart", cart);
				// Show cart
				response.sendRedirect("cart.jsp");
			}
			
			if(operation.equals("delete")) {
				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId)) {
						cart.cartList.remove(c);
						if(cart.cartList.isEmpty()) {
							response.sendRedirect("home.jsp");
							return;
						}
					}
				}
				
				// b3: save cart var into session
				session.setAttribute("cart", cart);
				// Show cart
				response.sendRedirect("cart.jsp");
			}
			
			if(operation.equals("deletemany")) {
				String[] t = request.getParameterValues("");

				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId)) {
						cart.cartList.remove(c);
						if(cart.cartList.isEmpty()) {
							response.sendRedirect("home.jsp");
							return;
						}
					}
				}
				
				// b3: save cart var into session
				session.setAttribute("cart", cart);
				// Show cart
				//response.sendRedirect("cart.jsp");
			}
			
			if(operation.equals("deleteall")) {
				session.setAttribute("cart", null);
				response.sendRedirect("home.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

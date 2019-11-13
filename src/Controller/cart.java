package Controller;

import java.io.IOException;
import java.util.Iterator;

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

    public cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("id");
		String operation = request.getParameter("op");
		HttpSession session = request.getSession();
		
		System.out.println("bookId: " + bookId + " - operation: " + operation);
		
//		handle process in cart page
		if(bookId != null && operation != null) {
			System.out.println("Vo process");
			if(operation.equals("down1")) {
				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId) && c.getQuantity() > 1) {
						c.setQuantity(c.getQuantity() - 1);
					}
				}
				
				// b3: save cart var into session
				session.setAttribute("cart", cart);
				// Show cart
				response.sendRedirect("/book_trading_servlet/cart");
//				return;
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
				response.sendRedirect("/book_trading_servlet/cart");
//				return;
			}
			
			if(operation.equals("update")) {
				int quantity = Integer.parseInt(request.getParameter("quantity")) ;
				if(quantity < 1) {
					return;
				}
				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId)) {
						c.setQuantity(quantity);
					}
				}
				
				// b3: save cart var into session
				session.setAttribute("cart", cart);
				// Show cart
				response.sendRedirect("/book_trading_servlet/cart");
				return;
			}
			
			if(operation.equals("delete")) {
				CartBO cart = null;
				
				cart = (CartBO) session.getAttribute("cart");
				
				// b2: change cart var when addCart called
				for(CartBEAN c: cart.cartList) {
					if(c.getBookId().equals(bookId)) {
						System.out.println(c);
						cart.cartList.remove(c);  
						break;
					}
				}
				
				// Show cart
				if(cart.cartList.isEmpty()) {
					// b3: save cart var into session
					session.setAttribute("cart", null);
					response.sendRedirect("/book_trading_servlet/");
				} else {
					// b3: save cart var into session
					session.setAttribute("cart", cart);
					response.sendRedirect("/book_trading_servlet/cart");
				}
				
				return;
			}
			
			if(operation.equals("justadd")) {
				addCart(request);
				return;
			}
			
			if(operation.equals("deleteall")) {
				session.setAttribute("cart", null);
				response.sendRedirect("/book_trading_servlet/");
				return;
			}
			System.out.println("END: Vo process");
		}
		
//		init cart session
		if(bookId != null && operation == null) {
			System.out.println("Vo init");
			
			
			addCart(request);
			// Show cart
			response.sendRedirect("/book_trading_servlet/cart");
			System.out.println("END: Vo init");
			return;
		}
		
		if(bookId == null && operation == null){
			System.out.println("Vo cart page");
			RequestDispatcher r = request.getRequestDispatcher("pages/cart.jsp");
			r.forward(request, response);
			System.out.println("END: Vo cart page");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void addCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String bookId = request.getParameter("id");
		String bookName = request.getParameter("bookname");
		String author = request.getParameter("author");
		long price = Long.parseLong(request.getParameter("price"));
		String imageUrl = request.getParameter("imageUrl");
		
		CartBO cart = null;
		
		// check exist cart session, if not, create new
		if(session.getAttribute("cart") == null) {
			cart = new CartBO();
			session.setAttribute("cart", cart);
		}
		// save session to: cart variable
		cart = (CartBO) session.getAttribute("cart");
		
		// change cart variable when addCart called
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
	}

}

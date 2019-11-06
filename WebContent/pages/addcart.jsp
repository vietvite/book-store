<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Bean.CartBEAN"%>
<%@page import="Bo.CartBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

/* String bookId = request.getParameter("id");
String bookName = request.getParameter("bookname");
String author = request.getParameter("author");
String priceStr = request.getParameter("price");
String imageUrl = request.getParameter("imageUrl");

if(priceStr != null) {
	long price = Long.parseLong(priceStr);
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
		out.print("Loop: " + c.getBookId() + "vs" + bookId + "\n");
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
	response.sendRedirect("cart.jsp");
} */

%>
</body>
</html>
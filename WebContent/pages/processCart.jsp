<%@page import="Bean.CartBEAN"%>
<%@page import="Bo.CartBO"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Insert title here</title>
</head>
<body>
<%

String bookId = request.getParameter("bookId");
String operation = request.getParameter("op");

if(operation.equals("down1")) {
	CartBO cart = null;
	
	cart = (CartBO) session.getAttribute("cart");
	
	// b2: change cart var when addCart called
	boolean exist = false;
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

if(operation.equals("deleteall")) {
	session.setAttribute("cart", null);
	response.sendRedirect("home.jsp");
}

%>
</body>
</html>
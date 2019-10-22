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

if(session.getAttribute("cart") != null) {
	CartBO cart  = (CartBO) session.getAttribute("cart");

	for(CartBEAN g: cart.cartList) {
		out.print(g.getBookId() + " - " + g.getBookName() + " - " + g.getPrice() + " - " + g.getQuantity());
		out.print("<hr>");
	}
}



%>
</body>
</html>
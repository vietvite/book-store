<%@page import="Bean.CartBEAN"%>
<%@page import="Bo.CartBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" integrity="sha256-zmfNZmXoNWBMemUOo1XUGFfc0ihGGLYdgtJS3KCr/l0=" crossorigin="anonymous" />
</head>
<body>

<div class="container">
    <div class="sticky-top">
      <%@include file="../components/header.jsp" %>
      <%@include file="../components/navbar.jsp" %>
    </div>

    <div class="px-3">
    <a href="processCart.jsp?op=deleteall" class="d-flex justify-content-end"><button>Xóa hết</button></a>
    <hr>
      <%
		if(session.getAttribute("cart") != null) {
			CartBO cart = (CartBO) session.getAttribute("cart");
		%>
			<%for(CartBEAN g: cart.cartList) {  %>
				<div class="d-flex justify-content-between">
					<p class="d-inline-block"><%= g.getBookId() + " - " + g.getBookName() + " - " + g.getPrice() + " - " + g.getQuantity() %></p>
					<a href="processCart.jsp?op=down1&bookId=<%= g.getBookId()%>" class=""><button>Giảm 1</button></a>
				</div>
				<hr>
			<%}
		}
		%>
    </div>
	
    <footer class="py-4 border-top">
	  <p class="text-center">Footer</p>
	</footer>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="script/main.js"></script>
<!--  
<%
if(session.getAttribute("cart") != null) {
	CartBO cart  = (CartBO) session.getAttribute("cart");

	for(CartBEAN g: cart.cartList) {
		out.print(g.getBookId() + " - " + g.getBookName() + " - " + g.getPrice() + " - " + g.getQuantity());

		out.print("<hr>");
	}
}
%>-->
</body>
</html>
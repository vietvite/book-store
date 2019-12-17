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
<body class="bg-light">

<div class="container">
    <div class="sticky-top">
      <%@include file="../components/header.jsp" %>
      <%@include file="../components/navbar.jsp" %>
    </div>

    <div class="px-3">
    <h2 class="mb-3">Giỏ hàng</h2>

    <% if(session.getAttribute("cart") != null) {
		CartBO cart = (CartBO) session.getAttribute("cart");
	%>
    <div class="row">
		<div class="col-md-9">
			<form>
			<% for(CartBEAN g: cart.cartList) {  %>
			<div class="d-flex justify-content-between bg-white p-4 ml-n3 mb-3">
				<div class="d-flex flex-col">
					<img style="width: 26%;" alt="bookimg" src="<%= g.getImageUrl() %>">
					<div>
						<h5><%= g.getBookName() %></h5>
						<p class="text-danger"><%= String.format("%,d", g.getPrice()).replace(',', '.') %>đ</p>
					</div>
				</div>
				
				<div class="d-flex flex-row">
					<h5 class="mr-4"><%= String.format("%,d", g.getTotalPrice()).replace(',', '.') %>đ</h5>
					<div style="width: 79px;">
						<div class="input-group input-group-sm">
						  <div class="input-group-prepend">
					    	<a class="btn btn-outline-secondary" href="cart?op=down1&id=<%= g.getBookId()%>">
					    		 -
				    		</a>
						  </div>
						  <input id="quantity<%= g.getBookId() %>" type="text" class="form-control" placeholder="" value="<%= g.getQuantity() %>">
						  <div class="input-group-append">
				    		<a class="btn btn-outline-secondary" href="cart?op=up1&id=<%= g.getBookId()%>">
				    			+
				    		</a>
						  </div>
						</div>
						<button class="btn btn-sm btn-light mt-2" onclick="update(event,'<%= g.getBookId()%>');">Cập nhật</button>
					</div>
					<div>
						<a class="text-decoration-none m-3 text-dark" href="cart?op=delete&id=<%= g.getBookId()%>"><i class="far fa-trash-alt"></i></a>
					</div>
				</div>
			</div>
			<% }%>
			</form>
    	</div>
    	<div class="col-md-3 bg-white p-3">
    		<div class="d-flex flex-row justify-content-between">
    			<h4 class="font-weight-light">Thành tiền:</h4>
    			<h4 class="font-weight-light"><%= String.format("%,d", cart.sum()).replace(',', '.') %>đ</h4>
    		</div>
    		<a href="/book-store/cart?op=checkout"><button style="width: 100%" class="d-block btn btn-danger mt-4">Đặt hàng</button></a>
    	</div>
    </div>
    <% } else { %>
   		<div class="">
   			<img class="rounded mx-auto d-block mr-n5 mb-5" src="images/empty-cart.png">
   		</div>
   	<% } %>
    
    </div>
	
    <footer class="py-4 border-top">
	  <p class="text-center">Footer</p>
	</footer>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script>
  
  function update(event, bookId) {
	  event.preventDefault();
	  let quantity = document.getElementById("quantity" + bookId).value;
	  window.location.href= 'cart?op=update&id=' + bookId + '&quantity=' + quantity;
  }
	
  </script>
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
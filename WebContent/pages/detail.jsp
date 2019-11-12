<%@page import="Bean.BookBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Detail book - Book Store</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" integrity="sha256-zmfNZmXoNWBMemUOo1XUGFfc0ihGGLYdgtJS3KCr/l0=" crossorigin="anonymous" />
  <link rel="stylesheet" href="css/main.css">
</head>

<body>
  <div class="container">
    <div class="sticky-top">
      <%@include file="../components/header.jsp" %>
      <%@include file="../components/navbar.jsp" %>
    </div>
    
      <%
      BookBEAN book = (BookBEAN) request.getAttribute("book");
      %>

	<div class="row">
	  <!-- Book image -->
	  <div class="col-12 col-md-4">
	    <div class="text-center">
	      <img src="<%= book.getImageUrl() %>" class="img-fluid" alt="img">
	    </div>
	  </div>
	  
	  <!-- Book detail -->
	  <div class="col-12 col-md-8">
	    <div class="px-0 px-md-3">
	      <h4 class="h4 mt-2"><%= book.getBookName() %></h4>
	      <p><%= book.getAuthor() %></p>
	      <p class="text-muted d-inline align-top" style="text-decoration: line-through; font-size: 0.75rem"><%= book.getCoverPrice() %>đ</p>
	      <p class="text-danger font-weight-bold"><%= book.getPrice() %>đ</p>
	      <!-- <label for="quantity">Số lượng:</label>
	      <input type="text" name="quantity" id="quantity"> -->
	      <button class="btn btn-sm btn-outline-danger mr-2"><i class="fas fa-cart-plus"></i> Thêm vào giỏ</button>
	      <a href="cart?id=<%= book.getId() %>&bookname=<%= book.getBookName() %>&price=<%= book.getPrice() %>&imageUrl=<%= book.getImageUrl() %>"><button class="btn btn-sm btn-danger mx-1">Thanh toán</button></a>
	      <button class="btn btn-sm border-0" title="Yêu thích"><i class="fas fa-heart text-danger"></i></button>
	    </div>
	  </div>
	</div>
	
	<!-- Book description -->
	<div class="mt-2 mt-md-5">
	  <h3 class="h3">Mô tả:</h3>
	  <hr>
	  <p><%= book.getDescription() %></p>
	</div>

<!--     <div class="px-3">

    </div> -->

    <footer class="py-4 border-top">
	  <p class="text-center">Footer</p>
	</footer>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="script/main.js"></script>
  
</body>
</html>
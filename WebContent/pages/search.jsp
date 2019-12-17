<%@page import="Bo.BookBO"%>
<%@page import="Bean.BookBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Search - Book Store</title>

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
    
	<a href="#" class="text-decoration-none"><h3 class="h3 d-inline text-dark">Kết quả</h3></a>
	 <hr>
	 <div class="row">
	   <%
	   BookBO bookBo = (BookBO) request.getAttribute("books");
	   %>
	   
	   <% for(BookBEAN book: bookBo.getBooks()) { %>
	   <div class="col-12 col-md-3 pb-1 pb-md-3">
	      <div class="hover-shadow card border-0" style="width: 15rem;">
	       <a href="detail?id=<%= book.getId() %>" class="text-decoration-none text-dark">
	         <img src="<%= book.getImageUrl() %>" class="card-img-top" alt="img">
	         <div class="card-body text-center pt-0">
	           <h6 class="card-title mb-1" title="<%= book.getBookName() %>"><%= book.getBookName() %></h6>
	           <p class="mb-1 text-muted"><%= book.getAuthor() %></p>
	           <p class="text-muted d-inline align-top" style="text-decoration: line-through; font-size: 0.75rem"><%= book.getCoverPrice() %> đ</p>
	           <!-- <p class="font-weight-bold d-inline pl-2 pl-md-4">{{ round((($book->price - $book->coverPrice)/$book->coverPrice)*100) }}%</p> -->
	           <p class="font-weight-bold d-inline pl-2 pl-md-4">20%</p>
	
	           <p class="text-danger font-weight-bold mb-1"><%= book.getPrice() %> đ</p>
	           <a href="cart?id=<%= book.getId() %>&bookname=<%= book.getBookName() %>&price=<%= book.getPrice() %>&imageUrl=<%= book.getImageUrl() %>" class="btn btn-danger btn-sm"><i class="px-2 fas fa-shopping-cart"></i></a>
	           <a href="#" class="btn btn-danger btn-sm"><i class="px-2 fas fa-plus"></i></a>
	           <%-- <a href="cart?op=justadd&id=<%= book.getId() %>&bookname=<%= book.getBookName() %>&price=<%= book.getPrice() %>&imageUrl=<%= book.getImageUrl() %>" class="btn btn-danger btn-sm"><i class="px-2 fas fa-plus"></i></a> --%>
	         </div>
	         </a>
	      </div>
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
  
</body>
</html>
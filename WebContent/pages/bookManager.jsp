<%@page import="Bean.BookBEAN"%>
<%@page import="Bean.OrderHistoryBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Trang chủ - Book Store</title>

  <link href="https://fonts.googleapis.com/css?family=Comfortaa:300,400,700&display=swap&subset=vietnamese" rel="stylesheet">
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
	ArrayList<BookBEAN> lst = (ArrayList<BookBEAN>) request.getAttribute("books");
	%>
	<% if(lst != null) { %>
	  <div class="px-3">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">Mã sách</th>
		      <th scope="col">Tên sách</th>
		      <th scope="col">Tác giả</th>
		      <th scope="col">Số lượng</th>
		      <th scope="col">Mã loại</th>
		      <th scope="col">Giá bìa</th>
		      <th scope="col">Quản lý</th>
		    </tr>
		  </thead>
		  <tbody>
		  <% for(BookBEAN item : lst) { %>
		    <tr>
		      <th scope="row"><%= item.getId() %></th>
		      <td><%= item.getBookName() %></td>
		      <td><%= item.getAuthor() %></td>
		      <td><%= item.getQuantity() %></td>
		      <td><%= item.getCategoryId() %></td>
		      <td><%= item.getCoverPrice() %></td>
		      <td class="d-flex flex-col">
		      	<a href="/book-store/manager?op=editpage&bookId=<%= item.getId() %>"><button class="mx-1 btn btn-sm btn-info">Sửa</button></a>
		      	<button class="mx-1 btn btn-sm btn-danger" onclick="deleteBook(event,'<%= item.getId() %>')">Xóa</button>
		      </td>
		    </tr>
		    <% } %>
		  </tbody>
		</table>
	</div>
	<% } else { %>
		<h1>Chưa có sách</h1>
	<% } %>
	</div>
	
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
	
	<script type="text/javascript">
		function deleteBook(event, bookId) {
			let ok = confirm("Chắc chắn muốn xóa sách này?");
			if(ok) {
				window.location.href="http://localhost:8080/book-store/manager?op=delete&bookId="+bookId;
			}
		}
	</script>
</body>
</html>
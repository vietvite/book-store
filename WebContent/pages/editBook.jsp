<%@page import="java.util.ArrayList"%>
<%@page import="Bean.BookBEAN"%>
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
    
	<div class="px-3">
	  	<%
	  	BookBEAN item = (BookBEAN) request.getAttribute("book");
	  	ArrayList<CategoryBEAN> categories = (ArrayList<CategoryBEAN>) request.getAttribute("categories");
		%>
		<form action="/book-store/manager?op=submitedit" method="POST">
		  <input type="hidden" name="bookId" value="<%= item.getId() %>" class="form-control" id="bookId">
		  <div class="form-group">
		    <label for="bookName">Tên sách</label>
		    <input type="text" name="bookName" value="<%= item.getBookName() %>" class="form-control" id="bookName">
		  </div>
		  <div class="form-group">
		    <label for="author">Tác giả</label>
		    <input type="text" name="author" value="<%= item.getAuthor() %>" class="form-control" id="author">
		  </div>
		  
		  <div class="form-group">
		    <label for="desc">Mô tả</label>
		    <textarea class="form-control" name="description" id="desc" rows="3"><%= item.getDescription() %></textarea>
		  </div>
  
		  <div class="form-group">
		    <label for="cateId">Email address</label>
		    <select class="custom-select" name="categoryId">
		      <% for(CategoryBEAN c: categories) { 
		    	  String isSelected = item.getCategoryId().equals(c.getId()) ? "selected" : "";
		      %>
			  <option value="<%= c.getId() %>" <%=isSelected %>><%= c.getCategoryName() %></option>
			  <% } %>
			</select>
		  </div>
		  <div class="form-group">
		    <label for="coverPrice">Giá bìa</label>
		    <input type="text" name="coverPrice" value="<%= item.getCoverPrice() %>" class="form-control" id="coverPrice">
		  </div>
		  
		  <div class="form-group">
		    <label for="price">Giá</label>
		    <input type="text" name="price" value="<%= item.getPrice() %>" class="form-control" id="price">
		  </div>
		  <div class="form-group">
		    <label for="quantity">Số lượng kho</label>
		    <input type="text" name="quantity" value="<%= item.getQuantity() %>" class="form-control" id="quantity">
		  </div>
		  <div class="form-group">
		    <label for="imageurl">URL ảnh</label>
		    <input type="text" name="imageUrl" value="<%= item.getImageUrl() %>" class="form-control" id="imageurl">
		  </div>
		  <%-- <div class="custom-file">
			  <input type="file" class="custom-file-input" id="customFile">
			  <label class="custom-file-label" for="customFile"><%= item.getImageUrl() %></label>
			</div> --%>
		  
		  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
	
	</div>
  </div>
</body>
</html>
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
	  	ArrayList<CategoryBEAN> lstCates = (ArrayList<CategoryBEAN>) request.getAttribute("categories");
		%>
		<form action="/book-store/manager?op=submitaddbook" method="POST">
		  <div class="form-group">
		    <label for="bookId">Mã sách</label>
		    <input type="text" name="bookId" class="form-control" id="bookId">
		  </div>
		  <div class="form-group">
		    <label for="bookName">Tên sách</label>
		    <input type="text" name="bookName" class="form-control" id="bookName">
		  </div>
		  <div class="form-group">
		    <label for="author">Tác giả</label>
		    <input type="text" name="author" class="form-control" id="author">
		  </div>
		  
		  <div class="form-group">
		    <label for="desc">Mô tả</label>
		    <input type="text" name="description" class="form-control" id="desc">
		  </div>
		  <div class="form-group">
		    <label for="cateId">Thể loại</label>
		    <select class="custom-select" name="categoryId">
		      <% for(CategoryBEAN c: lstCates) { %>
			  <option value="<%= c.getId() %>"><%= c.getCategoryName() %></option>
			  <% } %>
			</select>
		  </div>
		  <div class="form-group">
		    <label for="coverPrice">Giá bìa</label>
		    <input type="number" name="coverPrice" class="form-control" id="coverPrice">
		  </div>
		  
		  <div class="form-group">
		    <label for="price">Giá</label>
		    <input type="number" name="price" class="form-control" id="price">
		  </div>
		  <div class="form-group">
		    <label for="quantity">Số lượng kho</label>
		    <input type="number" name="quantity" class="form-control" id="quantity">
		  </div>
		  <div class="form-group">
		    <label for="imageurl">URL ảnh</label>
		    <input type="text" name="imageUrl" class="form-control" id="imageurl">
		  </div>
		  <!-- <div class="custom-file">
			  <input type="file" class="custom-file-input" name="imageUrl" id="imageUrl">
			  <label class="custom-file-label" for="imageUrl">Chọn ảnh</label>
			</div> -->
		  
		  
		  <button type="submit" class="btn btn-primary mt-3">Submit</button>
		</form>
	
	</div>
  </div>
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
</body>
</html>
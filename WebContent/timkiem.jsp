<%@page import="java.util.ArrayList"%>
<%@page import="nguyenvanvietbean.vietbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm</title>
<link rel="stylesheet" href="vendor/bootstrap-4.3.1/css/bootstrap.min.css">
</head>
<body>
		
<div class="container">
	<nav class="navbar navbar-expand-lg navbar-light bg-light d-flex justify-content-between">
	  <a class="navbar-brand" href="http://localhost:8080/book-store/vietcontroller">Cửa hàng</a>
	
	  <!-- Account button -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#account" aria-controls="account" aria-expanded="false" aria-label="Toggle navigation">
	    <i class="fas fa-user"></i>
	  </button>
	
	  <!-- Nav button -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
	    <i class="fas fa-search"></i>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbar">
	      <form class="input-group my-3 my-md-0" action="/book-store/viettimkiem" method="post">
			<input type="text" class="form-control" name="keyword" value="" placeholder="Tìm kiếm" aria-label="Tìm kiếm" aria-describedby="button-addon2">
			<div class="input-group-append">
			  <button class="btn border-top border-right border-bottom" type="submit" id="button-addon2">Tìm kiếm</button>
			</div>      
	     </form>
	  </div>
	</nav>
		
	<div class="px-3 mt-3">
	  <a href="#" class="text-decoration-none"><h3 class="h3 d-inline text-dark">Kết quả tìm kiếm</h3></a>
	  <hr>
	  <div class="row">
	  <% ArrayList<vietbean> lstHang = (ArrayList<vietbean>) request.getAttribute("hang"); %>
	    <% if(lstHang != null) { %>
	    <% for(vietbean item: lstHang) { %>
	    <div class="col-12 col-md-3 pb-1 pb-md-3">
	       <div class="hover-shadow card border-0" style="width: 15rem;">
	        <a href="detail?id=<%= item.getMahang() %>" class="text-decoration-none text-dark">
	          <img src="<%= item.getAnhmathang() %>" class="card-img-top" alt="img">
	          <div class="card-body text-center pt-0">
	            <h6 class="card-title mb-1" title="<%= item.getTenhang() %>"><%= item.getTenhang() %></h6>
	            <p class="mb-1 text-muted"><%= item.getTenncc() %></p>
	            <p class="mb-1 text-muted" style="font-size: 12px;">ID: <%= item.getMahang() %></p>
	            <p class="text-danger font-weight-bold mb-1"><%= item.getGia() %> đ</p>
	            <p class="mb-1 text-muted" style="font-size: 12px;">Chỉ còn: <%= item.getSoluong() %></p>
	          </div>
	          </a>
	       </div>
	    </div>
	    <% } %>
	  <% } else { %>
	  	<!-- <h6 class="px-3 text-muted">Không có kết quả tìm kiếm</h6> -->
	  <% } %>
	  </div>
	</div>
</div>

</body>
</html>
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
	ArrayList<OrderHistoryBEAN> lst = (ArrayList<OrderHistoryBEAN>) request.getAttribute("lstOrderHistory");
	%>
	<% if(lst != null) { %>
	  <div class="px-3">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">Mã đơn</th>
		      <th scope="col">Mã sách</th>
		      <th scope="col">Tên sách</th>
		      <th scope="col">Số lượng</th>
		      <th scope="col">Ngày đặt</th>
		      
		    </tr>
		  </thead>
		  <tbody>
		  <% for(OrderHistoryBEAN item : lst) { %>
		    <tr>
		      <th scope="row"><%= item.getOrderHistoryId() %></th>
		      <td><%= item.getBookId() %></td>
		      <td><%= item.getBookName() %></td>
		      <td><%= item.getQuantity() %></td>
		      <td><%= item.getDate() %></td>
		    </tr>
		    <% } %>
		  </tbody>
		</table>
	</div>
	<% } else { %>
		<h1>Chưa có lịch sử giao dịch</h1>
	<% } %>
	</div>
</body>
</html>
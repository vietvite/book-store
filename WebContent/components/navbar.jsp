<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Bo.CategoryBO"%>
<%@page import="Bean.CategoryBEAN"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light pt-0 mb-4">
  <div class="dropdown">
    <button class="btn btn-sm btn-light dropdown-toggle ml-n2 mr-4 font-weight-bold" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Thể loại
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <%
      CategoryBO category = new CategoryBO();
      %>
      <% for(CategoryBEAN item: category.getAllCategories()) { %>
      <a class="dropdown-item" href="home.jsp?category=<%= item.getId() %>"><%= item.getCategoryName() %></a>
      <% } %>
    </div>
  </div>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb m-0 p-0 bg-light">
      <li class="breadcrumb-item active" aria-current="page">Home</li>
    </ol>
  </nav>

  <div class="ml-auto">
  	<a href="http://localhost:8080/book_trading_servlet/pages/cart.jsp">
    	<button class="btn btn-sm btn-light btn-outline-danger"><i class="fas fa-cart-arrow-down"></i> Giỏ hàng <span class="text-dark" id="cartQuantity"></span></button>
    </a>
  </div>

</nav>
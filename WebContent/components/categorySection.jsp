<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="Bean.BookBEAN"%>
<%@page import="Bo.BookBO"%>
<div class="mt-3">

<!-- @foreach($booksGroupByCategory as $category) -->
<%-- <% for() { %> --%>
  <a href="#" class="text-decoration-none"><h3 class="h3 d-inline text-dark">Thể loại</h3></a>
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
<%-- <% } %> --%>

</div>
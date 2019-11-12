<%@page import="Bean.BookBEAN"%>
<%@page import="Bo.BookBO"%>

<div class="mt-5">
	<h3 class="h3 d-inline text-dark">Bestsale</h3>
	<hr>
	<div class="owl-carousel owl-theme">
	<%
    BookBO bestsale = (BookBO) request.getAttribute("books");
    %>
	<% for(BookBEAN book: bestsale.getBooks()) { %>
		<div class="item bg-primary"><img src="<%= book.getImageUrl() %>" class="card-img-top" alt="img"></div>
	<% } %>
	</div>
</div>
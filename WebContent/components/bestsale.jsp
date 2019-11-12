<%@page import="Bean.BookBEAN"%>
<%@page import="Bo.BookBO"%>

<div class="mt-5">
	<h3 class="h3 d-inline text-dark">Best Sale</h3>
	<hr>
	<div class="owl-carousel owl-theme">
	<%
    BookBO bestsale = (BookBO) request.getAttribute("books");
    %>
	<% for(BookBEAN book: bestsale.getBooks()) { %>
	<a href="detail?id=<%= book.getId() %>">
		<div class="item bg-primary"><img src="<%= book.getImageUrl() %>" class="card-img-top" alt="img"></div>
	</a>
	<% } %>
	</div>
</div>
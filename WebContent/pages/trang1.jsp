<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
<%

if(session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp");
}

%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="trang1.jsp">Trang1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="trang2.jsp">Trang2</a>
      </li>
      <%if(session.getAttribute("user") != null) { %>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">Hi there!</a>
      </li>
      <% } else { %>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">Dang nhap</a>
      </li>
      <% } %>
      <li class="nav-item ml-auto">
        <a class="nav-link" href="dangxuat.jsp"><i class="fas fa-sign-out-alt"></i> Dang xuat</a>
      </li>
      </ul>
  </div>
</nav>
Trang 1

</body>
</html>
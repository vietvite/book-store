<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String role = request.getParameter("role");
	
	
	/* Cách 2: trả về url có tham số query, dùng response.sendRedirect("login.jsp?error=false") */
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
	<div class="container">
		<div class="row mt-5">
			<div class="col-4 offset-4">
				<h1 class="text-center">Login</h1>
				<p class="text-danger text-sm"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
				<form action="check.jsp" method="post">
				  <div class="form-group">
				    <label for="username">Email address</label>
				    <input type="text" name="username" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Username">
				  </div>
				  <div class="form-group">
				    <label for="password">Password</label>
				    <input type="password" name="password" class="form-control" id="password" placeholder="Password">
				  </div>
				  <div class="form-group">
				    <label for="role">Vai trò</label>
				    <select class="form-control" id="role">
				      <option value="1">Giáo viên</option>
				      <option value="2">Sinh viên</option>
				    </select>
				  </div>
				  <div class="form-group form-check">
				    <input type="checkbox" class="form-check-input" id="saveLogin">
				    <label class="form-check-label" for="saveLogin">Lưu đăng nhập</label>
				  </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
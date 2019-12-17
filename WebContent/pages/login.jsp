<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login - Book Store</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" integrity="sha256-zmfNZmXoNWBMemUOo1XUGFfc0ihGGLYdgtJS3KCr/l0=" crossorigin="anonymous" />
</head>

<body>
	<div class="container">
	
		<div class="sticky-top">
	      <%@include file="../components/header.jsp" %>
	      <%@include file="../components/navbar.jsp" %>
	    </div>
    
		<div class="row mt-5">
			<div class="col-4 offset-4">
				<h1 class="text-center">Đăng nhập</h1>
				<p class="text-danger text-sm text-center"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
				<form action="user?op=login" method="POST" onsubmit="return checkLogin()">
				  <div class="form-group">
				    <label for="email">Email</label>
				    <input type="text" name="email" value="" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Email">
				  </div>
				  <div class="form-group">
				    <label for="password">Mật khẩu</label>
				    <input type="password" name="password" value="" class="form-control" id="password" placeholder="Password">
				  </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		function checkLogin() {
	        const username = document.getElementById("username").value;
	        const password = document.getElementById("password").value;
	        if (!username) {
	            alert("You must enter your user name!");
	            return false;
	        }
	        if (!password) {
	            alert("You must enter your password!");
	            return false;
	        }
	        return true;
	    }
	</script>
</body>
</html>

























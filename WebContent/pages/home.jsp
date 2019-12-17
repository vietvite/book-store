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
  <link rel="stylesheet" href="vendor/OwlCarousel2-2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="vendor/OwlCarousel2-2.3.4/assets/owl.theme.default.min.css">
  
  <link rel="stylesheet" href="css/main.css">
</head>

<body>
  <div class="container">
    <div class="sticky-top">
      <%@include file="../components/header.jsp" %>
      <%@include file="../components/navbar.jsp" %>
    </div>

    <div class="px-3">
      <%@include file="../components/carousel.jsp" %>
      
      <%@include file="../components/bestsale.jsp" %>
      
      <%@include file="../components/categorySection.jsp" %>
    </div>

    <footer class="py-4 border-top">
	  <p class="text-center">Book store © Văn Việt</p>
	</footer>
  </div>

  <script
  src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
  integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  <script type="text/javascript" src="vendor/OwlCarousel2-2.3.4/owl.carousel.min.js"></script>
  <script type="text/javascript">
  $('.owl-carousel').owlCarousel({
      items:4,
      loop:true,
      margin:10,
      autoplay:true,
      autoplayTimeout:2000,
      autoplayHoverPause:true
  });
  
  /* $("#login-form").submit(function( event ) {
	  event.preventDefault();
	  
	  if (!$("#loginEmail").val()) {
			$("p#loginError").text("Chưa nhập email.")
	      return false;
	  }
	  if (!$("#loginPassword").val()) {
	  	$("p#loginError").text("Chưa nhập mật khẩu.")
	      return false;
	  }
	  
	  var posting = $.post({
		  type: "POST",
		  url: "/book-store/login",
		  data: {
			  email: $("#loginEmail").val(),
			  password: $("#loginPassword").val()
		  }
		})
	  posting.done(function() {
			alert("login ok")
		}).fail(function() {
			alert("login fail")
		})
	}); */
  </script>
</body>
</html>
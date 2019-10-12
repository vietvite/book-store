<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

int n = Integer.parseInt(request.getParameter("txtn"));
if(session.getAttribute("asd") == null) {
	session.setAttribute("asd", null);
}

int s = (int) session.getAttribute("asd");
s += n;

session.setAttribute("asd", s);
out.print("Tong: " + session.getAttribute("asd"));
%>
</body>
</html>
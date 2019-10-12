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
	String param1 = request.getParameter("param1");
	String param2 = request.getParameter("param2");
	String op = request.getParameter("op");

	Long p1 = null, p2 = null, result = null;
	
	if(param1 != null || param2 != null) {
		p1 = Long.parseLong(param1);
		p2 = Long.parseLong(param2);
		
		if(op.equals("+")){
			result = p1 + p2;
		} else if(op.equals("-")) {
			result = p1 - p2;
		} else if(op.equals("*")) {
			result = p1 * p2;
		} else {
			result = p1 / p2;	
		}
	}
	%>
	<form method="post" action="test.jsp">
		<label for="param1">Param</label>
		<input type="number" name="param1" id="param1" value="<%= p1 != null ? p1 : "" %>">
		<label for="param2">Param</label>
		<input type="number" name="param2" id="param2" value="<%= p2 != null ? p2 : "" %>">
		<label for="result">Result</label>
		<input type="number" name="result" id="result" value="<%= result != null ? result : "" %>">
		
		<button type="submit" name="op" value="+">+</button>
		<button type="submit" name="op" value="-">-</button>
		<button type="submit" name="op" value="*">*</button>
		<button type="submit" name="op" value="/">/</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>나는 forward 페이지</h2>
	<%
	 	request.setCharacterEncoding("UTF-8");
	 	
	 	String id = request.getParameter("id");
	 	String pass = request.getParameter("pass");
	 %>
	 <h3>당신의 아이디는 <%= id %> 이고, 당신의 비밀번호는 <%= pass %> 입니다.</h3>
</body>
</html>
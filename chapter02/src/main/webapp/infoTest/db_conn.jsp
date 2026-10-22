<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
		String user = "root"; // DB 계정
		String password = "1234"; // DB 계정의 비밀번호	
	%>
</body>
</html>
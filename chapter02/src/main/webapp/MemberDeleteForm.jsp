<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		// Connection con = null;
		// PrepareStatement pstmt = null;
		// ResultSet rs = null;
		
		String id = request.getParameter("id");
	%>
	<form action="MemberDeleteProc.jsp" method="post">
		<input type="hidden" name="id" value="<%= id %>">
		<table border="1" style="margin: 0 auto">
			<tr>
				<td>아이디</td>
				<td><%= id %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pass">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">회원 삭제하기</button>
					<button onclick="location.href='main.jsp?page=MemberList'">회원 전체보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
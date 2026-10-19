<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" errorPage="Error.jsp" %>
<%-- <%@ page import=java.util.* %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	HelloWorld ~ 반가워 JSP
	<% 
		// 스크립트릿 내부의 코드는, language 에 넣은 언어 => 이경우 Java여서 // 로 주석처리 가능
		Date day = new Date();
		int i = 10;
		System.out.println(i); // 콘솔에 출력됨 
	%>
</body>
</html>
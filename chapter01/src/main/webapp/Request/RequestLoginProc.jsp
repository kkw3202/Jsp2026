<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
</head>
<body>
	<!-- RequestLoginProc.jsp 는 프로시저다. -->
	 <%
	 	// post 방식으로 정보를 전달 할 떄 한글의 깨짐현상 방지 코드(자바 코드이므로 스크립트릿 이용해야함!)
	 	request.setCharacterEncoding("UTF-8");
	 	
	 	// request 내장객체의 getParameter("name") 메소드를 이용하여 from 에 입력된 정보를 꺼내 올 수 있다.
	 	// 단, request.getParamater("name")에서 반환되는 데이터 타입은 String 이다.
	 	// => 해당 방법으로 가져온 값은 세션으로 유지하거나, get 방식으로 가져가가지 않는 한, 이번 페이지에서만 사용가능.
	 	
	 	
	 	String id = request.getParameter("id");
	 	// => name 값이 "id" 인 input의 정보를 getParameter 로 꺼내와서 변수 id에 저장
	 	String pass = request.getParameter("pass");
	 %>
	 <h3>당신의 아이디는 <%= id %> 이고, 당신의 비밀번호는 <%= pass %> 입니다.</h3>
	 <a href="RequestForward.jsp">다음 페이지</a>
</body>
</html>
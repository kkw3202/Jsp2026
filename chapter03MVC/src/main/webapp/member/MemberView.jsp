<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${msg != null}">
			<p>${msg}</p>
		</c:when>
		<c:otherwise>
			<p>아이디 : ${mt.id}</p>
			<p>이메일 : ${mt.email}</p>
			<p>전화번호 : ${mt.tel}</p>
			<p>취미 : ${mt.hobby}</p>
			<p>직업 : ${mt.job}</p>
			<p>나이 : ${mt.age}</p>
			<p>남기는 말 : ${mt.info}</p>
		</c:otherwise>
	</c:choose>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Test</title>
</head>
<body>
	<c:if test="${4 > 3}">
		<p>응 ~ 맞아</p>
	</c:if>
	<c:set var="name">홍길동</c:set>
	<c:set var="age" value="25"></c:set>
	
	<!-- EL 표현식을 이용하여 화면에 name 변수 출력 가능 -->
	<p>나의 이름은 ${name} 입니다. <c:out value="${age}"></c:out></p>
	
	<c:remove var="name"/>
	<c:out value="${name}"></c:out>
	
	<!-- forEach => 자바스크립트에서 본거... == 확장for문 -->
	
	<c:forEach var="i" begin="1" end="10" step="1"> <!-- 1~10 쓰는 for문 -->
	
	<c:set var="sum" value="${sum + i}"></c:set>
	
	${i}
	</c:forEach>
	<br/> 전부 더하면 : ${sum}
	
	<h2>문자열 분리</h2>
	<c:forTokens var="car" items="소나타-그랜저-아우디" delims="-">
		${car}
	</c:forTokens>
	
	<!-- 다중 if문 -->
	<h2>다중 if문</h2>
	<c:set var="color" value="red,green,black,yellow,white"></c:set>
	<c:forEach var="arr" items="${color}">
		 <c:choose>
		 	<c:when test="${arr == 'red'}">빨강</c:when>
		 	<c:when test="${arr == 'green'}">초록</c:when>
		 	<c:when test="${arr == 'black'}">검정</c:when>
		 	<c:when test="${arr == 'yellow'}">노랑</c:when>
		 	<c:otherwise>파랑</c:otherwise>
		 </c:choose>
	</c:forEach>
	
</body>
</html>
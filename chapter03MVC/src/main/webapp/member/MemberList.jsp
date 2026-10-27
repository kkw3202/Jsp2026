<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록</title>
</head>
<body>
	<div id="listwrap">
		<h2 align="center">모든 회원 보기</h2>
		<table class="listtable">
			<tr height="40">
				<td align="center" width="50">아이디</td>
				<td align="center" width="200">이메일</td>
				<td align="center" width="150">전화</td>
				<td align="center" width="150">취미</td>
				<td align="center" width="150">직업</td>
				<td align="center" width="100">나이</td>
			</tr>
			<c:forEach var="allMember" items="${allMember}">
			<tr height="40">
				<td align="center" width="50">${allMember.id }</td> <!-- .id 로 MemberDTO 의 getId() 처럼 뽑아 올 수 있다 -->
				<td align="center" width="200"><a href="">${allMember.email }</a></td>
				<td align="center" width="150">${allMember.tel }</td>
				<td align="center" width="150">${allMember.hobby }</td>
				<td align="center" width="150">${allMember.job }</td>
				<td align="center" width="100">${allMember.age }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
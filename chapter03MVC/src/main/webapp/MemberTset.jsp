<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 없는 회원 가입</title>
</head>
<body>
	<div id="testwrap" align="center" style="margin-top: 100px;">
		<h2>기본 회원가입</h2>
		<form action="Mproc.do" method="post"> <!-- .do 는 실제로 만드는 파일이 아닌, 서블릿 매핑 주소 -->
			<table width="400" border="1">
				<tr height="40">
					<td width="100">아이디</td>
					<td><input type="text" name="id"/> </td>
				</tr>
				<tr height="40">
					<td>비밀번호</td>
					<td><input type="password" name="pass"/> </td>
				</tr>
				<tr height="40">	
					<td>이메일</td>
					<td><input type="email" name="email"/> </td>
				</tr>
				<tr height="40">	
					<td>전화번호</td>
					<td><input type="tel" name="tel"/> </td>
				</tr>
				<tr height="40">	
					<td>주소</td>
					<td><input type="text" name="address"/> </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
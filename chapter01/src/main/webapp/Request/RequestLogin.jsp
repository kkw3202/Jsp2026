<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Login</title>
<style type="text/css">
	.container{
		width: 600px;
		margin: 20px auto;
	}
</style>
</head>
<body>
	<div class="container">
		<h2>로그인 페이지</h2>
		<!-- 
			from 내부의 action 가 하는 역할
			해당 폼 내에 **작성한 정보**를 액션이 지정한 파일로 넘겨주는 기술공간.
			
			from 내부의 method : 전송 방식. get / post
			get 방식 : 웹 페이지에서 입력받은 정보를 URL에 값이 출력되게 함 => type 을 hidden 방식으로 가져가면 숨길 수 있음
				=> http://localhost:8080/chapter01/Request/RequestLoginProc.jsp?id=aaa&pass=1234
			post 방식: 웹 페이지에서 입력받은 정보를 URL에 숨겨서 출력되게 함
				=> http://localhost:8080/chapter01/Request/RequestLoginProc.jsp
			~~
			submit : 전송버튼 클릭 시 action 의 파일이 실행됨
		 -->
		<!-- action 의 경로에는 반드시 확장자까지 들어가야함. -->
		<form action="RequestLoginProc.jsp" method="post">
			<table width="600" border="1">
				<tr height="60">
					<td align="center" width="150">아이디</td>
					<td align="center" width="350">
						<input type="text" name="id"/>
					</td>
				</tr>
				<tr height="60">
					<td align="center" width="150">비밀번호</td>
					<td align="center" width="350">
						<input type="password" name="pass"/>
					</td>
				</tr>		
				<tr height="60">
					<td colspan="2" align="center" width="150">
						<input type="submit" value="전송"/>
					</td>
				</tr>		
			</table>
		</form>
	
	</div>
</body>
</html>
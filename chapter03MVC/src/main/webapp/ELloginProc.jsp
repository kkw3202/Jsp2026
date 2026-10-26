<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 로그인 Proc</title>
</head>
<body>

	<%-- 
		EL 표현식 ${} : 자바의 변수를 호출하여 사용. 단, 변수명 그대로 사용 불가능.
		request.setAttribute("변수명 작명", value); => MVC방식에서 사용하려면 메소드 만들어야함!
		or
		${param.변수(input의 name 값)} == String id = request.getParameter("id") 
	--%>
	
	 <p>아이디: ${param.id}</p>
	 <p>패스워드: ${param.pass}</p>
	 
</body>
</html>
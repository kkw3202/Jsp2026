<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/index02.css">
	
</head>
<body>
	<%
		String section = request.getParameter("section");
		if(section == null) section = "section.jsp";
	%>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
			<section>
				<jsp:include page="<%= section %>"></jsp:include>
			</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 주행 관리 프로그램</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		// nav.jsp 의 a태그 : main.jsp?page = driveInsert.jsp
		String pageName = request.getParameter("page");
		
		// 메뉴 클릭 전에는 home.jsp
		String contentPage = "home.jsp";
		
		// 클릭한 메뉴의 page의 이름을 section에 보인다.
		if("carlist".equals(pageName)){
			contentPage = "carlist.jsp";
		}
	%>
	
	<div id="wrap">
		<!-- include -->
		<%@ include file="header.jsp" %>
		
		<%@ include file="nav.jsp" %>
		
		<section>
			<jsp:include page="<%= contentPage %>"></jsp:include>
		</section>
		
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
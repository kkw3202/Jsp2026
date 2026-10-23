<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸딩팩토리</title>
<link rel="stylesheet" href="style/fooding.css">
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String pageName = request.getParameter("page");
		String contentPage = "main.jsp";
		
		if("MemberJoin".equals(pageName)){
			contentPage = "MemberJoin.jsp";
		}else if("login".equals(pageName)){
			contentPage = "login.jsp";
		}else if("MemberList".equals(pageName)){
			contentPage = "MemberList.jsp";
		}else if("MemberDetail".equals(pageName)){
			contentPage = "MemberDetail.jsp";
		}else if("MemberUpadteForm".equals(pageName)){
			contentPage = "MemberUpadteForm.jsp";
		}else if("MemberDeleteForm".equals(pageName)){
			contentPage = "MemberDeleteForm.jsp";
		}else if("MemberDeleteProc".equals(pageName)){
			contentPage = "MemberDeleteProc.jsp";
		}
		
	%>
	<%@ include file="header.jsp" %>
	<section>
		<% if(contentPage != "main.jsp"){ %> <jsp:include page="<%= contentPage %>"></jsp:include>
		<% }else out.print("<p>여기는 메인화면 입니다.</p>");%>
	</section>
	<%@ include file="footer.jsp" %>
	
</body>
</html>
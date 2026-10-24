<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<nav>
		<a href="index.jsp?page=joinForm">회원등록</a>
		<a href="index.jsp?page=memberForm">회원목록조회/수정</a>
		<a href="index.jsp?page=saleForm">회원매출조회</a>
		<a href="index.jsp?page=index">홈으로</a>
	</nav>
	<section>
		<% 
		request.setCharacterEncoding("UTF-8");
		
		String pageName = request.getParameter("page");
		String currentPage = "index.jsp";
		
		if(pageName == null || pageName.equals("index")){
			out.print("<h2>쇼핑몰회원관리 프로그램</h2>");
			out.print("<p>쇼핑몰 회원정보와 회원매출 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.</p>");
			out.print("<p>프로그램 작성 순서</p>");
			out.print("<p>1. 회원정보 테이블을 작성한다.</p>");
			out.print("<p>2. 매출정보 테이블을 작성한다.</p>");
			out.print("<p>3. 회원정보, 매출정보 테이블에 제시된 문제의 참조데이터를 추가 생성한다.</p>");
			out.print("<p>4. 회원정보 입력 화면 프로그램을 작성한다.</p>");
			out.print("<p>5. 회원정보 조회 프로그램을 작성한다.</p>");
			out.print("<p>6. 회원매출정보 조회 프로그램을 작성한다.</p>");
			
		}else if(pageName != null || !pageName.isEmpty()){
			
			if(pageName.equals("joinForm")) currentPage = "joinForm.jsp";
			if(pageName.equals("memberForm")) currentPage = "memberForm.jsp";
			if(pageName.equals("saleForm")) currentPage = "saleForm.jsp";		
			if(pageName.equals("modForm")) currentPage = "modForm.jsp";			
			%>
			<jsp:include page="<%= currentPage %>"></jsp:include>
			<%
		}
		%>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
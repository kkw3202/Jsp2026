<%@page import="org.apache.jasper.compiler.Node.IncludeAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량주행관리프로그램</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<div id="wrap">
		<%@ include file="header.jsp" %>
		<nav>
			<ul>
				<li><a href="index.jsp?page=carList">차량조회</a></li>
				<li><a href="index.jsp?page=driveForm">주행내역등록</a></li>
				<li><a href="index.jsp?page=driveList">주행내역조회</a></li>
				<li><a href="index.jsp?page=deptStat">부서별주행통계</a></li>
				<li><a href="index.jsp?page=carDrive">차량별주행통계</a></li>
				<li><a href="index.jsp?page=companyStat">제조사별주행통계</a></li>
				<li><a href="index.jsp?page=index">홈으로</a></li>
			</ul>
		</nav>
		<section>
			<%
			String pageName = "index.jsp";
			
			if(request.getParameter("page") != null){
				 String currentPage = request.getParameter("page");
				 pageName = currentPage +".jsp";
			}
			
			if(pageName.equals("index.jsp")){
				out.print("<h3>과정평가형 자격 CBQ</h3>");
				out.print("<p>국가직무능력표준(NCS:National Competency Standards)으로 설계된 교육·훈련과정을 충실히 이수한 후, 내부·외부 평가를 거쳐 일정 합격 기준을 충족하는 교육·훈련생에게 국가기술자격을 부여하는 제도</p>");
				out.print("<p class='bold'>산업현장 중심의 교육평가로 더 커지는 능력!</p>");
				out.print("<p class='bold'>알고 있는 것에 할 수 있는 것을 더하는</p>");
				out.print("<p class='bold'>과정평가형 자격은</p>");
				out.print("<p class='bold'>현장 중심형 인재육성을 지원합니다.</p>");
			}else{
			%>
			
			<jsp:include page="<%=pageName%>"></jsp:include>
			
			<%
			}
			%>
		</section>
		<%@ include file="footer.jsp" %>
	</div>
	
	
</body>
</html>
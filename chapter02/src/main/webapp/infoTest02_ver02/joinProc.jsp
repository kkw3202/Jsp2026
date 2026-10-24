<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	boolean msgChk = false;
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "insert into member_tbl_02 values(null, ?, ?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("CUSTNAME"));
		pstmt.setString(2, request.getParameter("PHONE"));
		pstmt.setString(3, request.getParameter("ADDRESS"));
		pstmt.setString(4, request.getParameter("JOINDATE"));
		pstmt.setString(5, request.getParameter("GRADE"));
		pstmt.setString(6, request.getParameter("CITY"));
		
		msgChk = pstmt.executeUpdate() > 0; // boolean 이어서 값이 맞으면 true 반환됨!

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(con!=null) con.close();
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
		}catch(Exception e){e.printStackTrace();}
	}
%>

<script type="text/javascript">
	<% if(msgChk){%>
		alert("회원등록 완료");
		location.href="memberForm.jsp"
	<%}else{%>
		alert("회원등록 실패");
		history.go(-1);
	<%}%>
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
	<%@ include file="db_conn.jsp" %>
	<h2>회원목록조회/수정</h2>
	
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
	<% 
		request.setCharacterEncoding("UTF-8");
	
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from member_tbl_02";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String num = rs.getString("CUSTNO");
				
				out.print("<tr>");
				out.print("<td><a href='index.jsp?page=modForm&CUSTNO="+num+"'>"+ num +"</a></td>");
				out.print("<td>"+ rs.getString("CUSTNAME") +"</td>");
				out.print("<td>"+ rs.getString("PHONE") +"</td>");
				out.print("<td>"+ rs.getString("ADDRESS") +"</td>");
				out.print("<td>"+ rs.getString("JOINDATE") +"</td>");
				out.print("<td>"+ rs.getString("GRADE") +"</td>");
				out.print("<td>"+ rs.getString("CITY") +"</td>");
				out.print("</tr>");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if (rs != null) rs.close();
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		}
	
	%>
	</table>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="java.sql.*"%>
    <table class="list">
    <tr>
    	<th>차량번호</th>
    	<th>모델</th>
    	<th>제조사</th>
    	<th>구매일</th>
    </tr>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
	String user = "root"; // DB 계정
	String password = "1234"; // DB 계정의 비밀번호	
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select * from TBL_CAR";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString("CAR_NO")+"</td>");
			out.print("<td>"+rs.getString("CAR_MODEL")+"</td>");
			out.print("<td>"+rs.getString("CAR_COMPANY")+"</td>");
			out.print("<td>"+rs.getString("CAR_DATE")+"</td>");
			out.print("</tr>");
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(con != null){
			try {con.close();}
			catch (Exception e){}
		}
		if(pstmt != null){
			try {pstmt.close();}
			catch (Exception e){}
		}
		if(rs != null){
			try {rs.close();}
			catch (Exception e){}
		}
	}
	%>
	</table>
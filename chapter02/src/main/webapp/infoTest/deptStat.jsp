<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>

<table class="list">
	    <tr>
	    	<th>부서코드</th>
	    	<th>부서명</th>
	    	<th>총운행거리</th>
	    	<th>총주유금액</th>
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
			
			String sql = "";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
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
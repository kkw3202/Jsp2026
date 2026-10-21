<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
    
	<table class="list">
	    <tr>
	    	<th>주행일자</th>
	    	<th>차량번호</th>
	    	<th>모델</th>
	    	<th>출발km</th>
	    	<th>도착km</th>
	    	<th>부서명</th>
	    	<th>주유금액</th>
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
			
			String sql = "select dr.DRV_DATE as DRV_DATE, dr.CAR_NO as CAR_NO, ca.CAR_MODEL as CAR_MODEL, dr.DRV_START as DRV_START, dr.DRV_END as DRV_END, de.DEPT_NAME as DEPT_NAME, dr.DRV_MONEY as DRV_MONEY from TBL_DRIVE dr inner join TBL_CAR ca on ca.CAR_NO = dr.CAR_NO inner join TBL_DEPT de on de.DEPT_CODE = dr.DEPT_CODE";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			DecimalFormat de = new DecimalFormat("#,##0");
			
			
			
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>" + rs.getString("DRV_DATE") + "</td>");
				out.print("<td>" + rs.getString("CAR_NO") + "</td>");
				out.print("<td>" + rs.getString("CAR_MODEL") + "</td>");
				
				int start = Integer.parseInt(rs.getString("DRV_START"));
				out.print("<td>" + de.format(start) + "</td>");
				int end = Integer.parseInt(rs.getString("DRV_END"));
				out.print("<td>" + de.format(end) + "</td>");
				
				out.print("<td>" + rs.getString("DEPT_NAME") + "</td>");
				
				int money = Integer.parseInt(rs.getString("DRV_MONEY"));
				out.print("<td>￦" + de.format(money) + "</td>");
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
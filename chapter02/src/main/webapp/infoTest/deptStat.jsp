<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.*"%>
<h3>(부서별)주행통계</h3>
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
			
			String sql = "select de.DEPT_CODE DEPT_CODE, de.DEPT_NAME DEPT_NAME, SUM(dr.DRV_END-dr.DRV_START) total_km, SUM(DRV_MONEY) total_money from TBL_DEPT de inner join TBL_DRIVE dr on dr.DEPT_CODE = de.DEPT_CODE group by de.DEPT_CODE";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			DecimalFormat de = new DecimalFormat("￦#,##0");
			
			
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>" + rs.getString("DEPT_CODE") + "</td>");
				out.print("<td>" + rs.getString("DEPT_NAME") + "</td>");
				out.print("<td>" + rs.getString("total_km") + "</td>");
				int money = Integer.parseInt(rs.getString("total_money"));
				out.print("<td>" + de.format(money) + "</td>");
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
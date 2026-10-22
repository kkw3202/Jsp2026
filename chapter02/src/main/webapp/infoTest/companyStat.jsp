<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>

	<h3>(제조사별) 주행통계</h3>
	<table class="list">
		<tr>
			<th>제조사</th>		
			<th>차량수</th>		
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
		
		DecimalFormat de = new DecimalFormat("￦#,##0");
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select ca.CAR_COMPANY CAR_COMPANY, count(distinct ca.CAR_NO) count, sum(dr.DRV_END - dr.DRV_START) sum_move, sum(dr.DRV_MONEY) sum_money "
						+ "from TBL_CAR ca "
						+ "inner join TBL_DRIVE dr on ca.CAR_NO = dr.CAR_NO "
						+ "group by ca.CAR_COMPANY "
						+ "order by sum_money desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>" + rs.getString("CAR_COMPANY") + "</td>");
				out.print("<td>" + rs.getString("count") + "</td>"); // 차량수
				out.print("<td>" + rs.getString("sum_move") + "</td>"); // 총운행거리
				out.print("<td>" + de.format(rs.getInt("sum_money")) + "</td>"); // 총주유금액
				out.print("</tr>");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con != null){
				try{con.close();}
				catch(Exception e){}
			}
			if(rs != null){
				try{rs.close();}
				catch(Exception e){}
			}
			if(pstmt != null){
				try{pstmt.close();}
				catch(Exception e){}
			}
		}
		
		%>
		
		
		
	</table>
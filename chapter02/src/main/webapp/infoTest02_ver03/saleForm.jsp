<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>

	<jsp:include page="header.jsp"/>
	<%@ include file="db_conn.jsp" %>
	<section>
		<h2>회원매출조회</h2>
		
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
		<% 
			request.setCharacterEncoding("UTF-8");
		
			DecimalFormat de = new DecimalFormat("￦#,##0");
		
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
				
				String sql ="select me.CUSTNO CUSTNO, me.CUSTNAME CUSTNAME, me.GRADE GRADE, sum(mo.PRICE) as PRICE "
							+"from member_tbl_02 me "
							+"right join money_tbl_02 mo on me.CUSTNO = mo.CUSTNO "
							+"group by me.CUSTNO "
							+"order by PRICE desc";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				
				while(rs.next()){
					String gradePrt = rs.getString("GRADE").equals("A") ? "VIP" :
										rs.getString("GRADE").equals("B") ? "일반" :
										rs.getString("GRADE").equals("C") ? "직원" : null;
					
					out.print("<tr>");
					out.print("<td>"+ rs.getInt("CUSTNO") +"</td>");
					out.print("<td>"+ rs.getString("CUSTNAME") +"</td>");
					out.print("<td>"+ gradePrt +"</td>");
					// out.print("<td>"+ de.format(rs.getInt("PRICE"))+"</td>");
					out.print("<td>"+ String.format("￦%,d", rs.getInt("PRICE"))+"</td>");
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
	</section>
	<jsp:include page="footer.jsp"/>
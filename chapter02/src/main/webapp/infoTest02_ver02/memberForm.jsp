<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>
	<jsp:include page="header.jsp" />
	<section>
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
			
			
			try{
				String gradeName = "";
				String grade = "";
				
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
				
				String sql = "select * from member_tbl_02";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					grade = rs.getString("GRADE");
					gradeName = grade.equals("A") ? "VIP" : 
									grade.equals("B") ? "일반" : "직원";
			%>
				<tr>
					<td><a class="link" href="modForm.jsp?CUSTNO=<%=rs.getInt("CUSTNO")%>"><%=rs.getInt("CUSTNO") %></a></td>
					<td><%=rs.getString("CUSTNAME") %></td>
					<td><%=rs.getString("PHONE") %></td>
					<td><%=rs.getString("ADDRESS") %></td>
					<td><%=rs.getString("JOINDATE") %></td>
					<td><%= gradeName %></td>
					<td><%=rs.getString("CITY") %></td>
				</tr>
			<%		
				}
				
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
		</table>
		
	</section>
	<jsp:include page="footer.jsp" />
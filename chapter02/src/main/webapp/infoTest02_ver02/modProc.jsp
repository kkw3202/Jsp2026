<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>

	<%@ include file="db_conn.jsp"  %>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String CUSTNO = request.getParameter("CUSTNO2");
		String CUSTNAME = request.getParameter("CUSTNAME");
		String PHONE = request.getParameter("PHONE");
		String ADDRESS = request.getParameter("ADDRESS");
		String JOINDATE = request.getParameter("JOINDATE");
		String GRADE = request.getParameter("GRADE");
		String CITY = request.getParameter("CITY");
		String msg = "";
	
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "update member_tbl_02 set CUSTNAME=?,PHONE=?,ADDRESS=?,JOINDATE=?,GRADE=?,CITY=? where CUSTNO =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, CUSTNAME);
			pstmt.setString(2, PHONE);
			pstmt.setString(3, ADDRESS);
			pstmt.setString(4, JOINDATE);
			pstmt.setString(5, GRADE);
			pstmt.setString(6, CITY);
			pstmt.setString(7, CUSTNO);
			
			int result = pstmt.executeUpdate();
			
			if(result > 0 ){
				msg = "회원정보 수정이 완료되었습니다!";
			}else{
				msg = "회원정보 수정에 실패하였습니다.";
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
	
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="index.jsp?page=memberForm";
	</script>
	
	
	
	
	
	=
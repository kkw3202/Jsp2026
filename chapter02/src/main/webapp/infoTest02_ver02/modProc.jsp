<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>

	<%@ include file="db_conn.jsp"  %>
	<%
		request.setCharacterEncoding("UTF-8");
		
		/* DB와 데이터 타입 맞추기!! (request 혹은 set~ 에서 맞추기) */
		String CUSTNO = request.getParameter("CUSTNO");
		String CUSTNAME = request.getParameter("CUSTNAME");
		String PHONE = request.getParameter("PHONE");
		String ADDRESS = request.getParameter("ADDRESS");
		String JOINDATE = request.getParameter("JOINDATE");
		String GRADE = request.getParameter("GRADE");
		String CITY = request.getParameter("CITY");
		String msg = "";
		int result = 0;
	
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "UPDATE member_tbl_02 SET CUSTNAME=?, PHONE=?, ADDRESS=?, JOINDATE=?, GRADE=?, CITY=? WHERE CUSTNO=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, CUSTNAME);
			pstmt.setString(2, PHONE);
			pstmt.setString(3, ADDRESS);
			pstmt.setString(4, JOINDATE);
			pstmt.setString(5, GRADE);
			pstmt.setString(6, CITY);
			pstmt.setInt(7, Integer.parseInt(CUSTNO));
			
			result = pstmt.executeUpdate();
			
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
		if(<%=result%> > 0){
			location.href="memberForm.jsp";			
		}else{
			history.go(-1);
		}
	</script>
	
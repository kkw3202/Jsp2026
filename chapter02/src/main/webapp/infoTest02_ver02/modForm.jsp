<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>

	<%@ include file="db_conn.jsp" %>
	
	<% 
		request.setCharacterEncoding("UTF-8");
	
		String CUSTNO = request.getParameter("CUSTNO");
		String CUSTNAME = "";
		String PHONE = "";
		String ADDRESS = "";
		String JOINDATE = "";
		String GRADE = "";
		String CITY = "";
	
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from member_tbl_02 where CUSTNO=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, CUSTNO);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				CUSTNAME = rs.getNString("CUSTNAME");
				PHONE = rs.getString("PHONE");
				ADDRESS = rs.getString("ADDRESS");
				JOINDATE = rs.getString("JOINDATE");
				GRADE = rs.getString("GRADE");
				CITY = rs.getString("CITY");
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
	<form name="form" action="modProc.jsp" method="post">
		<table class="form">
			<tr>
				<th>회원번호(자동생성)</th>
				<td>
					<input type="text" disabled="disabled" value="<%= CUSTNO %>" name="CUSTNO">
					<input type="hidden" value="<%= CUSTNO %>" name="CUSTNO2">
				</td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td>
					<input type="text" name="CUSTNAME" value="<%= CUSTNAME %>">
				</td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td>
					<input type="tel" name="PHONE" value="<%= PHONE %>">
				</td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td>
					<input type="text" name="ADDRESS" value="<%= ADDRESS %>">
				</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>
					<input type="text" name="JOINDATE" value="<%= JOINDATE %>"><span>예) 20151202</span>
				</td>
			</tr>
			<tr>
				<th>고객등급</th>
				<td>
					<select name="GRADE">
						<option value="A" <%= GRADE.equals("A") ? "selected='selected'" : ""%>>[A]VIP</option>
						<option value="B" <%= GRADE.equals("B") ? "selected='selected'" : ""%>>[B]일반</option>
						<option value="C" <%= GRADE.equals("C") ? "selected='selected'" : ""%>>[C]직원</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td>
					<input type="text" name="CITY" value="<%= CITY %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="goChk()">수정</button>
					<button type="button" onclick="location.href='index.jsp?page=memberForm'">조회</button>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		function goChk(){
			let f = document.form
			
			/* if((document.CUSTNAME) == null){
				alert("회원성명이 입력되지 않았습니다!");
				document.CUSTNAME.focus();
				return;
			}
			if(document.PHONE == null){
				alert("회원전화가 입력되지 않았습니다!");
				document.PHONE.focus;
				return;
			}
			if(document.ADDRESS == null){
				alert("회원주소가 입력되지 않았습니다!");
				document.ADDRESS.focus;
				return;
			}
			if(document.JOINDATE==null){
				alert("가입일자가 입력되지 않았습니다!");
				document.JOINDATE.focus;
				return;
			}
			if(document.GRADE==null){
				alert("고객등급이 입력되지 않았습니다!");
				document.GRADE.focus;
				return;
			}
			if(document.CITY==null){
				alert("도시코드가 입력되지 않았습니다!");
				document.CITY.focus;
				return;
			} */
			
			f.submit();
		}
	</script>

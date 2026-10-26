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
			pstmt.setInt(1, Integer.parseInt(CUSTNO));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				CUSTNAME = rs.getString("CUSTNAME");
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
	<jsp:include page="header.jsp" />
	<section>
		<form name="form" action="modProc.jsp" method="post">
			<table class="form">
				<tr>
					<th>회원번호</th>
					<td>
						<input type="text" readonly="readonly" value="<%= CUSTNO %>" name="CUSTNO">
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
						<input type="text" name="JOINDATE" value="<%= JOINDATE %>">
					</td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td>
						<select name="GRADE">						
							<option value="">선택</option>
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
						<button type="button" onclick="goChk()">수 정</button>
						<button type="button" onclick="location.href='memberForm.jsp'">조 회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function goChk(){
			let f = document.form;
			
			if((f.CUSTNAME.value) == ""){
				alert("회원성명이 입력되지 않았습니다!");
				document.CUSTNAME.focus();
				return;
			}
			if(f.PHONE.value == ""){
				alert("회원전화가 입력되지 않았습니다!");
				f.PHONE.focus();
				return;
			}
			if(f.ADDRESS.value == ""){
				alert("회원주소가 입력되지 않았습니다!");
				f.ADDRESS.focus();
				return;
			}
			if(f.JOINDATE.value==""){
				alert("가입일자가 입력되지 않았습니다!");
				f.JOINDATE.focus();
				return;
			}
			if(f.GRADE.value==""){
				alert("고객등급이 입력되지 않았습니다!");
				f.GRADE.focus();
				return;
			}
			if(f.CITY.value==""){
				alert("도시코드가 입력되지 않았습니다!");
				f.CITY.focus();
				return;
			}
			
			f.submit();
		}
	</script>
	<jsp:include page="footer.jsp" />
	
	
	
	
	

<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>

	<%@ include file="db_conn.jsp" %>
	
	<% 
		request.setCharacterEncoding("UTF-8");
	
		int newNum = 0;
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select CUSTNO from member_tbl_02 order by CUSTNO desc limit 1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				newNum = rs.getInt("CUSTNO") + 1;
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
	<h2>홈쇼핑 회원등록</h2>
	<form name="form" action="joinProc.jsp" method="post">
		<table class="form">
			<tr>
				<th>회원번호(자동생성)</th>
				<td>
					<input type="text" disabled="disabled" value="<%= newNum %>" name="CUSTNO">
				</td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td>
					<input type="text" name="CUSTNAME">
				</td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td>
					<input type="tel" name="PHONE">
				</td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td>
					<input type="text" name="ADDRESS">
				</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>
					<input type="text" name="JOINDATE"><span>예) 20151202</span>
				</td>
			</tr>
			<tr>
				<th>고객등급</th>
				<td>
					<select name="GRADE">
						<option value="A">[A]VIP</option>
						<option value="B">[B]일반</option>
						<option value="C">[C]직원</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td>
					<input type="text" name="CITY">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="goChk()">등록</button>
					<button type="button" onclick="location.href='index.jsp?page=memberForm'">조회</button>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		function goChk(){
			let f = document.form;
			
			if(f.CUSTNAME.value.trim() == ""){
				alert("회원성명이 입력되지 않았습니다!");
				f.CUSTNAME.focus();
				return;
			}
			if(f.PHONE.value.trim() == ""){
				alert("회원전화가 입력되지 않았습니다!");
				f.PHONE.focus();
				return;
			}
			if(f.ADDRESS.value.trim() == ""){
				alert("회원주소가 입력되지 않았습니다!");
				f.ADDRESS.focus();
				return;
			}
			if(f.JOINDATE.value.trim() == ""){
				alert("가입일자가 입력되지 않았습니다!");
				f.JOINDATE.focus();
				return;
			}
			if(f.GRADE.value.trim() == ""){
				alert("고객등급이 입력되지 않았습니다!");
				f.GRADE.focus();
				return;
			}
			if(f.CITY.value.trim() == ""){
				alert("도시코드가 입력되지 않았습니다!");
				f.CITY.focus();
				return;
			} 
			
			
			f.submit();
		}
	</script>
	
	
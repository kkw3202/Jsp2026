<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>  

<%
	int nextNo = 0;

	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select ifnull(max(CUSTNO),100000)+1 as cust from member_tbl_02";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		// rs 는 .next() 하기 전 까지는 가져온 값의 앞 칸에 커서가 가있는 상태.
		if(rs.next()){
			nextNo = rs.getInt("cust");
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




<jsp:include page="header.jsp" />
<section>
  <h2>홈쇼핑 회원등록</h2>
  <form action="joinProc.jsp" method="post" name="jform">
  	<table class="form">
  		<tr>
  			<th>회원번호(자동생성)</th>
  			<td><input type="text" name="CUSTNO" value="<%= nextNo %>" readonly="readonly"></td>
  		</tr>
  		<tr>
  			<th>회원성명</th>
  			<td><input type="text" name="CUSTNAME"></td>
  		</tr>
  		<tr>
  			<th>회원전화</th>
  			<td><input type="tel" name="PHONE"></td>
  		</tr>
  		<tr>
  			<th>회원주소</th>
  			<td><input type="text" name="ADDRESS"></td>
  		</tr>
  		<tr>
  			<th>가입일자</th>
  			<td><input type="text" name="JOINDATE">예)20151202</td>
  		</tr>
  		 <tr>
  			<th>고객등급[A:VIP, B:일반, C:직원]</th>
  			<td>
  				<select name="GRADE">
  					<option value="">선택</option>
  					<option value="A">[A]VIP</option>
  					<option value="B">[B]:일반</option>
  					<option value="C">[C]:직원</option>
  				</select>
			</td>
  		</tr>
  		<tr>
  			<th>도시코드</th>
  			<td><input type="text" name="CITY"></td>
  		</tr>
  		<tr>
  			<td colspan="2">
	  			<input type="button" value="등 록" onclick="checkFrom()">
	  			<input type="button" value="조 회" onclick="location.href='memberForm.jsp'">
  			</td>
  		</tr>
  	</table>
  </form>
  
</section>
<script type="text/javascript">
	function checkFrom(){
		let f = document.jform;

		if(f.CUSTNAME.value == ""){
			alert("이름 입력 안됨");
			f.CUSTNAME.focus();
			return;
		}
		if(f.PHONE.value == ""){
			alert("전화 입력 안됨");
			f.PHONE.focus();
			return;
		}
		if(f.ADDRESS.value == ""){
			alert("주소 입력 안됨");
			f.ADDRESS.focus();
			return;
		}
		if(f.JOINDATE.value == ""){
			alert("가입일 입력 안됨");
			f.JOINDATE.focus();
			return;
		}
		if(f.GRADE.value == ""){
			alert("등급 입력 안됨");
			f.GRADE.focus();
			return;
		}
		if(f.CITY.value == ""){
			alert("도시 입력 안됨");
			f.CITY.focus();
			return;
		}
		
		f.submit();
	}
</script>



<jsp:include page="footer.jsp" />
	
	
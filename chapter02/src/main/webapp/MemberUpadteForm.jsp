<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	String email = "";
	String tel = "";
	/* 넘겨온 id가 DB와 일치하는지 체크하는 체크키 */
	boolean idChk = false;
	
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
		
		String sql = "select id, email, tel from member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			idChk = true;
			email = rs.getString("email");
			tel = rs.getString("tel");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(con != null){
			try {con.close();}
			catch(Exception e){}
		}
		if(rs != null){
			try {rs.close();}
			catch(Exception e){}
		}
		if(pstmt != null){
			try {pstmt.close();}
			catch(Exception e){}
		}
	}
%>
	<h3>개인 회원 정보 수정</h3>
	<form action="MemberUpdateProc.jsp" method="post" style="margin: 10px auto; width: fit-content">
	<!-- id 를 넘겨주는 hidden이 없다! => 하나 만들어 줘야 함 -->
	<input name="id" type="hidden" value="<%= id %>">
		<table width="400" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<!-- 넘겨받은 id는 수정대상이 아님! -->
				<td width="250"><%= id %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250">
					<input type="email" name="email" value="<%= email %>">	
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="250">
					<input type="tel" name="tel" value="<%= tel %>">	
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250">
					<input type="password" name="pass2" placeholder="본인 비밀번호 입력">	
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="회원 수정하기">&nbsp;
					<input type="button" value="회원 전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
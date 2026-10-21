<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원 정보</title>
</head>
<body>
	<table width="700" border="1" style="margin: 100px auto;">
		<thead>
			<tr height="50" align="center">
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>관심분야</th>
				<th>직업</th>
				<th>연령</th>
				<th>남기는 말</th>
			</tr>
		</thead>
		<tbody>
	<%
	request.setCharacterEncoding("UTF-8");
	
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
		
		String id = request.getParameter("id"); // 직전 페이지에서 get 방식으로 id 라는 이름으로 넘긴 값 받아오기 
		
		String sql = "select * from member where id =?";
		pstmt = con.prepareStatement(sql);
		// setString 의 인덱스 번호 => ? 의 순서
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			out.print("<tr height='50' align='center'>");
			out.print("<td>"+rs.getString("id")+"</td>");
			out.print("<td>"+rs.getString("email")+"</td>");
			out.print("<td>"+rs.getString("tel")+"</td>");
			out.print("<td>"+rs.getString("hobby")+"</td>");
			out.print("<td>"+rs.getString("job")+"</td>");
			out.print("<td>"+rs.getString("age")+"</td>");
			out.print("<td>"+rs.getString("info")+"</td>");
			out.print("</tr>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(con != null){
			try {con.close();}
			catch (Exception e){};
		}
		if(pstmt != null){
			try {pstmt.close();}
			catch (Exception e){};
		}
		if(rs != null){
			try {rs.close();}
			catch (Exception e){};
		}
	}
	
	%>
		</tbody>
	</table>
	<a href="MemberList.jsp">회원목록으로</a>
</body>
</html>
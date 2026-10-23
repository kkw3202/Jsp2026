<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String pass = request.getParameter("pass");
		String id = request.getParameter("id");
		
		String msg = "";
		boolean passChk = false;
		
		String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
		String user = "root"; // DB 계정
		String password = "1234"; // DB 계정의 비밀번호
		
		if(pass.trim().isEmpty() || pass == null){
			msg = "비밀번호를 입력해 주세요";
		}else{
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
				
				String sql = "select id from member where id=? and pass=?";
				pstmt= con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					rs.close();
					pstmt.close();
					
					sql = "delete from member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					int result = pstmt.executeUpdate();
					
					if(result > 0) {
						msg="탈퇴 성공";
						passChk = true;
					}
					else msg="탈퇴 실패";
				}else{
					msg = "비밀번호를 확인해 주세요";
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con!=null){
					try{con.close();}
					catch(Exception e){}
				}
				if(pstmt!=null){
					try{pstmt.close();}
					catch(Exception e){}
				}
				if(rs!=null){
					try{rs.close();}
					catch(Exception e){}
				}
			}
		}
	%>
	
	<script type="text/javascript">
		alert("<%= msg %>");
	<% if(passChk){%>
		location.href="main.jsp?page=MemberList"
	<% }else{%>
		history.go(-1);
	<%}%>
	</script>
</body>
</html>
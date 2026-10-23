<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String pass2 = request.getParameter("pass2");
		
		String msg = null;
		boolean pass2Chk = false;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
		String user = "root"; // DB 계정
		String password = "1234"; // DB 계정의 비밀번호
		
		ResultSet rs = null;
		
		// 비밀번호 일치여부 판단
		if(pass2 == null || pass2.trim().isEmpty()){
			
			msg = "비밀번호를 입력하세요";
		}else{
			
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
				
				String sql = "select id, email, tel from member where id=? and pass=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass2);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					// 아이디/비밀번호 조회에 사용한 pstmt의 자원 반납
					pstmt.close();
					rs.close();
					
					sql = "update member set email=?, tel=? where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, email);
					pstmt.setString(2, tel);
					pstmt.setString(3, id);
					
					int result = pstmt.executeUpdate();
					
					if(result > 0) msg = "업데이트 성공";
					else msg = "업데이트 실패";
				}else{
					msg = "비밀번호를 확인하세요";
					pass2Chk = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con != null){
					try{ con.close(); }
					catch(Exception e){}
				}
				if(rs != null){
					try{ rs.close(); }
					catch(Exception e){}
				}
				if(pstmt != null){
					try{ pstmt.close(); }
					catch(Exception e){}
				}
			}
		}
	%>
	<script type="text/javascript">
		alert("<%= msg%>");
	<%if(!pass2Chk){ %>
		location.href="main.jsp?page=MemberList";
	<%}else{ %>
		history.go(-1);
	<%} %>
	</script>
</body>
</html>
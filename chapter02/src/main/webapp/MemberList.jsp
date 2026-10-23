<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td,
	th{
		border: 1px solid #222;
	}
</style>
</head>
<body>
	<table width="700" style="margin: 100px auto; border-collapse: collapse; border: 1px solid #222 ">
		<thead>
			<tr height="50" align="center">
				<th>번호</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>관심분야</th>
				<th>직업</th>
				<th>연령</th>
				<th>남기는 말</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<%! 
			// 테이블 만드는 횟수 저장용 체크키
			int tableMakeCnt = 1;
			
			%>
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
				Class.forName(driver); // 드라이버 접속
				con = DriverManager.getConnection(url, user, password); // DB 연결
				
				String sql = "select * from member";
				pstmt = con.prepareStatement(sql);
				// prepareStatement 객체에 setString(), setInt() 등.. 의 메소드가 존재함. set~() 메소드는 sql문을 저장하겠다는 의미.
				rs = pstmt.executeQuery();
				// pstmt = con.prepareStatement(sql); 의 실행 결과를 rs(Result 객체)에 담음
				
				while(rs.next()){
					out.print("<tr height='50' align='center'>");
					out.print("<td>"+tableMakeCnt+"</td>");
					out.print("<td>"+rs.getString("id")+"</td>");
					out.print("<td>"+rs.getString("email")+"</td>");
					out.print("<td>"+rs.getString("tel")+"</td>");
					out.print("<td>"+rs.getString("hobby")+"</td>");
					out.print("<td>"+rs.getString("job")+"</td>");
					out.print("<td>"+rs.getString("age")+"</td>");
					out.print("<td>"+rs.getString("info")+"</td>");
					//get 방식으로 a 태그의 링크가 넘어가는 곳으로 id의 정보를 떠넘김.
					// out.print("<td><a href='MemberDetail.jsp?id="+rs.getString("id")+"'>상세보기</a></td>");  
					out.print("<td><a href='main.jsp?id="+rs.getString("id")+"&page=MemberDetail'>상세보기</a></td>");  
					out.print("</tr>");
					tableMakeCnt++;
				}
				
				tableMakeCnt = 1;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con != null){
					try{
						con.close();
					}catch(Exception e){}
				}
				if(pstmt != null){
					try{
						pstmt.close();
					}catch(Exception e){}
				}
				if(rs != null){
					try{
						rs.close();
					}catch(Exception e){}
				}
			}
			%>
		</tbody>
	</table>
	<a href="main.jsp?page=MemberJoin">회원가입으로 돌아가기</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<h3>차량조회</h3>
    <table class="list">
    <tr>
    	<th>차량번호</th>
    	<th>모델</th>
    	<th>제조사</th>
    	<th>구매일</th>
    </tr>
	<%
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
		
		String sql = "select * from TBL_CAR";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat prtDate = new SimpleDateFormat("yyyy년MM월dd일");
		
		while(rs.next()){ // 다음 항목이 있으면 true, 없으면 false 반환 => while로 돌리면 있는만큼 실행
			out.print("<tr>");
			out.print("<td>"+rs.getString("CAR_NO")+"</td>");
			out.print("<td>"+rs.getString("CAR_MODEL")+"</td>");
			out.print("<td>"+rs.getString("CAR_COMPANY")+"</td>");
			
			// format()은 Date 형식, DB 는 String => parse()해야 사용 가능 
			// => "20230101" => 20230101 Date 객체로 바뀜
			// format() => 20230101 Date 객체 => 2023년01월01일
			Date date = simpleDate.parse(rs.getString("CAR_DATE"));
			
			out.print("<td>"+ prtDate.format(date) +"</td>");
			out.print("</tr>");
		}
	}catch(Exception e){
		e.printStackTrace();
		// 제출 시에 지워야 할 DB 연동 오류 문구
		out.print("DB 연결 실패");
	}finally{
		if(con != null){
			try {con.close();}
			catch (Exception e){}
		}
		if(pstmt != null){
			try {pstmt.close();}
			catch (Exception e){}
		}
		if(rs != null){
			try {rs.close();}
			catch (Exception e){}
		}
	}
	%>
	</table>
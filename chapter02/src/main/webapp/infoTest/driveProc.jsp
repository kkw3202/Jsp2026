<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! String msg = ""; %>
	<% 
	request.setCharacterEncoding("UTF-8");
	
	String DRV_DATE = request.getParameter("DRV_DATE");
	String CAR_NO = request.getParameter("CAR_NO");
	String DRV_START = request.getParameter("DRV_START");
	String DRV_END = request.getParameter("DRV_END");
	String DEPT_CODE = request.getParameter("DEPT_CODE");
	String DRV_MONEY = request.getParameter("DRV_MONEY");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
	String user = "root"; // DB 계정
	String password = "1234"; // DB 계정의 비밀번호
	
	if(DRV_DATE.isEmpty() || DRV_DATE == null) msg = "주행일자가 입력되지 않았습니다!";
	else if(CAR_NO.isEmpty() || CAR_NO == null) msg = "차량번호가 입력되지 않았습니다!";
	else if(DRV_START.isEmpty() || DRV_START == null) msg = "시작km가 입력되지 않았습니다!";
	else if(DRV_END.isEmpty() || DRV_END == null) msg = "도착km가 입력되지 않았습니다!";
	else if(DEPT_CODE.isEmpty() || DEPT_CODE == null) msg = "부서코드가 입력되지 않았습니다!";
	else if(DRV_MONEY.isEmpty() || DRV_MONEY == null) msg = "주유금액이 입력되지 않았습니다!";
	
	else{
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url);
			
			String sql = "insert into TBL_DRIVE value(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, DRV_DATE);
			pstmt.setString(2, CAR_NO);
			pstmt.setString(3, DRV_START);
			pstmt.setString(4, DRV_END);
			pstmt.setString(5, DEPT_CODE); // 수정 필요
			pstmt.setString(6, DRV_MONEY);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con != null){
				try {con.close();}
				catch (Exception e){}
			}
			if(pstmt != null){
				try {pstmt.close();}
				catch (Exception e){}
			}
		}
	}
	
	if(msg != ""){
	%>
	
	<script type="text/javascript">
		alert("<%= msg %>");
		history.go(-1);
	</script>
	
	<%}else{%>
	<script type="text/javascript">
		alert("주행 내역이 정상적으로 등록 되었습니다!");
		history.go(-2);
	</script>
	<%} %>
	
	
</body>
</html>
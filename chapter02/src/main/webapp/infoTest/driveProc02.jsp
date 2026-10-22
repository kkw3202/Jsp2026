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
	int result = 0;
	
	String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
	String user = "root"; // DB 계정
	String password = "1234"; // DB 계정의 비밀번호
	
	
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "insert into TBL_DRIVE values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// pstmt 객체에 입력받은 값을 저장, sql의 ? 를 채워서 실행 가능한 상태로 만든다.
			pstmt.setString(1, DRV_DATE);
			pstmt.setString(2, CAR_NO);
			int START = Integer.parseInt(DRV_START); // 위에서 받아 올 때 parse()해도 됨. 단, 이경우 예외처리 조건도 바뀜
			pstmt.setInt(3, START);
			int END = Integer.parseInt(DRV_END);
			pstmt.setInt(4, END);
			pstmt.setString(5, DEPT_CODE);
			int MONEY = Integer.parseInt(DRV_MONEY);
			pstmt.setInt(6, MONEY);
			
			result = pstmt.executeUpdate();
			
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
	
	if(result>=1){%>
	<script type="text/javascript">
		alert("주행 내역이 정상적으로 등록 되었습니다!"); 
		/* history.go(-2); */
		location.href = "index.jsp";
		/* "index.jsp" 에 해당하는 주소로 이동 */
	</script>
	<%}else{ %>
	<script type="text/javascript">
		alert("등록에 실패하였습니다"); 
		history.go(-1);
	</script>
	<%} %>
</body>
</html>
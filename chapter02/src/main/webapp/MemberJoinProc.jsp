<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <!-- 아래 페이지 지시자 없으면 db 연동 안됨! -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원 가입 하기</h1>
	
	<% 
	request.setCharacterEncoding("UTF-8"); 
	// requestJoin.jsp에 입력된 정보를 Request객체를 통해 정보를 꺼내오시오.
	%>
	
	<%! String msg =""; %>
	
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String passchk = request.getParameter("passchk");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String[] hobby = request.getParameterValues("hobby");
	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");
	
	String prtHobby = "";
	for(String i : hobby)prtHobby += i + " ";
	
	/* request 로 가져온 값이 없다면 null 이 된다. */
	
	// DB 연동 시작----------------------------------------------
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	boolean idChkKey = false;
	
	// DB 접속 정보
	String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
	String user = "root"; // DB 계정
	String password = "1234"; // DB 계정의 비밀번호
	
	// DB 는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다. 고로, try{}catch(){}문을 이용해 작성하는것이 원칙. 
	try{
		// 드라이버 로딩
		Class.forName(driver);
		// DB 연결
		con = DriverManager.getConnection(url, user, password);
		
		// 아이디 체크
		String chkid = "select id from member where id =?";
		pstmt = con.prepareStatement(chkid);
		pstmt.setString(1, id);
		// select 문을 ResultSet 객체에 담는다.
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			// rs.next() == true 라면, select 해온 값이 하나라도 존재한다는것
			idChkKey = true;
		}else{
			// insert문 작성
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			// prepareStatement 객체에 setString(), setInt() 등.. 의 메소드가 존재함. set~() 메소드는 sql문을 저장하겠다는 의미.
			pstmt.setString(1, id); // 1번 필드에 id 값을 넣는다. 단, 이 때 Index 번호는 1부터 시작
			pstmt.setString(2, pass);
			pstmt.setString(3, email);
			pstmt.setString(4, tel);
			pstmt.setString(5, prtHobby);
			pstmt.setString(6, job);
			pstmt.setString(7, age);
			pstmt.setString(8, info);
			
			// insert, delete, update 쿼리는 executeUpdate(),
			// select 쿼리는 executeQuery() 메소드를 이용하여 실행. 단, select의 결과는 resultSet 객체에 담긴다.
			
			// insert는 executeUpdate() 를 통해 실행
			pstmt.executeUpdate(); // insert 에 성공하면 1을 반환
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		// 이하 자원 해제. 반드시 작성해야함!!!!!!
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(Exception e){}
		}
		if(con != null){
			try{
				con.close();
			}catch(Exception e){}
		}
		if(rs != null){
			try{
				rs.close();
			}catch(Exception e){}
		}
	};
	
	// DB 연동 종료----------------------------------------------
	
	
	// 예외처리
	if(id == null || id.isEmpty()) msg = "아이디를 입력하세요";
	else if(pass == null || pass.isEmpty()) msg = "비밀번호를 입력하세요";
	else if(passchk == null || passchk.isEmpty()) msg = "비밀번호 확인을 입력하세요"; 
	else if(email == null || email.isEmpty()) msg = "이메일을 입력하세요"; 
	else if(tel == null || tel.isEmpty()) msg = "전화번호를 입력하세요"; 
	else if(hobby == null || hobby.length == 0) msg = "취미를 입력하세요"; 
	else if(job == null || job.isEmpty()) msg = "직업을 입력하세요"; 
	else if(age == null || age.isEmpty()) msg = "나이를 입력하세요"; 
	else if(info == null || info.isEmpty()) msg = "남기는 말을 입력하세요";
	else if(idChkKey) msg = "이미 존재하는 아이디 입니다.";
	else{
		if(!pass.equals(passchk)){
			msg = "비밀번호가 일치하지 않습니다.";
		}else
			msg = "회원가입되셨습니다. 로그인 후 이용해주세요";
	}
	%>
	
	<%
	if(msg.length()!=0){
	%>
	<script type="text/javascript">
		alert("<%= msg %>");
		history.go(-1);
	</script>
	<% } %>
</body>
</html>
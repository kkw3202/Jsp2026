<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

		<% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selected = "10가0001";
		String sel = request.getParameter("sel");
		
		String driver = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; // DB URL(스키마 이름 : jspdb)
		String user = "root"; // DB 계정
		String password = "1234"; // DB 계정의 비밀번호
		%>

	<h3>차량별주행조회</h3>
	<form name="form" action="index.jsp" method="get" style="display: flex; width: 250px; margin: 10px auto; justify-content: space-around;">
		<!-- input을 hidden으로 주고, name="page" value="carDrive" 로 index.jsp?page="carDrive" 로 이동하게 함 -->
		<input type="hidden" name="page" value="carDrive">
		<select name="sel" style="height: 50px; font-size: 20px; padding: 5px;">
			<option <%=sel==null ? "selected='seleceted'" : "disabled='disabled'" %>>차량선택</option>
			<option value="10가0001" <%="10가0001".equals(sel) ? "selected='seleceted'" : "" %>>[10가0001] 소나타</option>
			<option value="10가0002" <%="10가0002".equals(sel) ? "selected='seleceted'" : "" %>>[10가0002] K5</option>
			<option value="10가0003" <%="10가0003".equals(sel) ? "selected='seleceted'" : "" %>>[10가0003] SM5</option>
			<option value="10가0004" <%="10가0004".equals(sel) ? "selected='seleceted'" : "" %>>[10가0004] 그랜저</option>
			<option value="10가0005" <%="10가0005".equals(sel) ? "selected='seleceted'" : "" %>>[10가0005] K5</option>
		</select>
		<button onclick="search()" type="button" style="width: 50px">조회</button>
	</form>
	<table class="list">
		<tr>
			<th>주행일자</th>		
			<th>출발km</th>		
			<th>도착km</th>		
			<th>운행거리</th>		
			<th>부서명</th>		
			<th>주유금액</th>		
		</tr>

		<%
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			
			String sql = "select dr.CAR_NO CAR_NO, dr.DRV_DATE DRV_DATE, dr.DRV_START DRV_START, dr.DRV_END DRV_END, (dr.DRV_END - dr.DRV_START) total_run, de.DEPT_NAME DEPT_NAME, dr.DRV_MONEY DRV_MONEY "
						+ "from TBL_DRIVE dr "
						+ "inner join TBL_DEPT de on dr.DEPT_CODE = de.DEPT_CODE ";
			if(sel!=null){
				selected = sel;
				sql += "where CAR_NO = '" + selected + "'";
			}
						
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			SimpleDateFormat sDate = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat prtDate = new SimpleDateFormat("yyyy년MM월dd일");
			DecimalFormat de = new DecimalFormat("#,##0");
			
			while(rs.next()){
				//if(rs.getString("CAR_NO").equals(sel)){
					out.print("<tr>");
					out.print("<td>" + prtDate.format(sDate.parse(rs.getString("DRV_DATE"))) +"</td>");
					out.print("<td>" + de.format(rs.getInt("DRV_START")) +"</td>");
					out.print("<td>" + de.format(rs.getInt("DRV_END")) +"</td>");
					out.print("<td>" + rs.getString("total_run") +"</td>");
					out.print("<td>" + rs.getString("DEPT_NAME") +"</td>");
					out.print("<td>￦" + de.format(rs.getInt("DRV_MONEY")) +"</td>");	
					out.print("</tr>");
				//}
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con != null){
				try{con.close();}
				catch(Exception e){}
			}
			if(rs != null){
				try{rs.close();}
				catch(Exception e){}
			}
			if(pstmt != null){
				try{pstmt.close();}
				catch(Exception e){}
			}
		}
		
		%>
	</table>
	
	<script>
		function search(){
			let f = document.form;
			f.submit();
		}
	</script>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! 
	String msg = ""; 
	int payNum;
	%>
	
	<% 
	request.setCharacterEncoding("UTF-8");
	
	String menu = request.getParameter("menu");
	
	String count = request.getParameter("count");
	int countNum;
	String pay = request.getParameter("pay");
	
	
	
	int[] price = {3000, 3300, 2500, 3500};
	String[] menues = {"아메리카노", "카페라떼", "에스프레소", "얼그레이티"};
	
	int totalPrice = 0;
	int indexNum = 0;
	
	
	if(menu.isEmpty() || menu == null) msg="메뉴를 골라주세요";
	else if(count.isEmpty() || count == null) msg="수량이 입력되지 않았습니다.";
	else if(pay.isEmpty() || pay == null) msg="금액이 입력되지 않았습니다.";
	else{
		countNum = Integer.parseInt(count);
		payNum = Integer.parseInt(pay);
		for(int i=0; i<menues.length; i++){
			if(menues[i].equals(menu)){
				indexNum = i;
			}
		}
		
		totalPrice = price[indexNum]*countNum;
		
		if(totalPrice>payNum) msg="투입된 금액이 부족합니다.";
	}
	
	DecimalFormat comma = new DecimalFormat("#,##0");
	
	%>
	
	
	<div class="container">
		<ul>
			<li>커피 종류 : <%=menu%></li>
			<li>1개 가격 : <%=comma.format(price[indexNum])%></li>
			<li>수량 : <%=count%></li>
			<li>총금액 : <%=comma.format(totalPrice)%></li>
			<li>입금액 : <%=comma.format(payNum)%></li>
			<li>거스름 돈 : <%=comma.format(payNum-totalPrice)%></li>
		</ul>
	</div>
	
	
	<% 
	if(!msg.equals("")){ 
	%>
		<script type="text/javascript">
			alert("<%=msg%>");
			history.go(-1);
		</script>
	<%
	msg="";
	indexNum = 0;
	} %>
</body>
</html>
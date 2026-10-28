<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
	<link rel="stylesheet" href="style/MemberList.css">
	<div id="listwrap">
		<h2 align="center">모든 회원 보기</h2>
		
		<form action="MemberListCon.do" method="get" class="searchbox" name="btnForm">
			<select name="searchType">
				<option value="id" ${searchType=='id' ? 'selected' : ""}>아이디</option>
				<option value="email" ${searchType=='email' ? 'selected' : ""}>이메일</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어를 입력하세요" value='${keyword}'>
			<input type="button" value="검색" class="btn-search" onclick="doSearch()">
			<input type="button" value="전체보기" class="btn-all" onclick="location.href='MemberListCon.do?searchType=all'">
		</form>
		
		<table class="listtable">
			<tr height="40">
				<td align="center" width="50">아이디</td>
				<td align="center" width="200">이메일</td>
				<td align="center" width="150">전화</td>
				<td align="center" width="150">취미</td>
				<td align="center" width="150">직업</td>
				<td align="center" width="100">나이</td>
			</tr>
			<c:choose>
				<c:when test="${empty allMember}">
					<td align="center" width="100" colspan="6"><p>${msg }</p></td>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="allMember" items="${allMember}">
						<tr height="40">
							<td align="center" width="50">${allMember.id }</td> <!-- .id 로 MemberDTO 의 getId() 처럼 뽑아 올 수 있다 -->
							<td align="center" width="200"><a href="">${allMember.email }</a></td>
							<td align="center" width="150">${allMember.tel }</td>
							<td align="center" width="150">${allMember.hobby }</td>
							<td align="center" width="150">${allMember.job }</td>
							<td align="center" width="100">${allMember.age }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</table>
	</div>
	
	<script type="text/javascript">
		function doSearch() {
			let f = document.btnForm;
			if(f.keyword.value == ""){
				alert("검색어가 비어있습니다.");
				f.keyword.focus();
				return;
			}
			f.submit();
		}
		
		if(${msg!="" && isMsg}){
			//alert("${msg}");
		}
	</script>
	
	
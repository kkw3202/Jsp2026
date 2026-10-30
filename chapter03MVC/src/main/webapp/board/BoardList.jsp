<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/BoardList.css">

	<div class="boardwrap">
		<h2>전체 게시글 보기</h2>
		<table width="700" border="1">
		
			<tr height="40">
				<td colspan="5" align="right">
					<c:if test="${not empty sessionScope.id }">
						<button onclick="location.href='index.jsp?section=board/BoardWriteForm.jsp'">글 작성</button>
					</c:if>
					<c:if test="${empty sessionScope.id }">
						<button onclick="plzlogin()">글 작성</button>						
					</c:if>
				</td>
			</tr>
			
			<tr height="40" class="tag">
				<td width="50" align="center">번호</td>
				<td width="50" align="center">제목</td>
				<td width="50" align="center">작성자</td>
				<td width="50" align="center">작성일</td>
				<td width="50" align="center">조회수</td>
			</tr>
			
			<c:set var="number" value="${number }" />
			<c:forEach var="blist" items="${blist }">
				<tr height="40">
					<td width="50" align="center">${number }</td>
					<td width="320" align="left">
						<c:if test="${blist.re_step != 0 }">
							
						</c:if>
						<a href="BoardInfoControl.do?num=${blist.num }">${blist.subject }</a>
					</td>
					<td width="50" align="center">${blist.writer }</td>
					<td width="50" align="center">${blist.reg_date }</td>
					<td width="50" align="center">${blist.readcount }</td>
				</tr>
				<c:set var="number" value="${number-1 }"></c:set>
			</c:forEach>
		</table>
		
		<!-- 페이징 -->
		<div class="pageing">

			<!-- 이전 버튼 생성 조건 -->
			<c:if test="${startPage != 1 }">
				<a href="BoardListCon.do?pageNum=${startPage - pageBlock }">이전</a>
			</c:if>
			
			<!-- 현재 상황에서, 1,2,3 에서 게시글 수가 모자람. 즉, 2페이지까지만 뜨고 3은 없어야함 -->
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="BoardListCon.do?pageNum=${i }">${i }</a>				
			</c:forEach>
			
			<!-- 다음 버튼 생성 조건 -->
			<c:if test="${endPage < pageCount }">
				<a href="BoardListCon.do?pageNum=${startPage + pageBlock }">다음</a>
			</c:if>
			
		</div>
	</div>
	
	<script type="text/javascript">
	function plzlogin() {
		alert('로그인이 필요합니다.');
		location.href='index.jsp?section=login/loginForm.jsp';
	}
		
	</script>
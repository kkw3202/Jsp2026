<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
	<h3>주행내역등록</h3>
	<form action="driveProc.jsp" method="get">
		<table class="form">
			<tr>
				<th>주행일자</th>
				<td>
					<input type="text" name="DRV_DATE"><span class="hint">2023년01월01일 예)20230101</span> 
				</td>
			</tr>
			<tr>
				<th>차량번호</th>
				<td>
					<input type="text" name="CAR_NO"><span class="hint">예)10가0001</span> 
				</td>
			</tr>
			<tr>
				<th>출발Km</th>
				<td>
					<input type="text" name="DRV_START"><span class="hint">km</span> 
				</td>
			</tr>
			<tr>
				<th>도착km</th>
				<td>
					<input type="text" name="DRV_END"><span class="hint">km</span> 
				</td>
			</tr>
			<tr>
				<th>부서코드</th>
				<td>
					<select name="DEPT_CODE">
						<option disabled="disabled">부서</option>
						<option>[10]영업부</option>
						<option>[20]총무부</option>
						<option>[30]구매부</option>
						<option>[40]개발부</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주유금액</th>
				<td>
					<input type="text" name="DRV_MONEY"><span class="hint">원</span> 
				</td>
			</tr>
			<tr>
				<td></td>
				<td class="btn">
					<button type="submit">주행내역등록</button>
					<button id="resetBtn" onclick="resetal()" type="reset">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		resetBtn = document.getElemnetById("resetBtn");
	
		function resetal(){
			alert("정보를 지우고 처음부터 다시 입력 합니다!");
		}
	</script>
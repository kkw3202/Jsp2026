<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
	<h3>주행내역등록</h3>
	<form action="driveProc02.jsp" method="get" name="driveFrm">
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
						<option value="10">[10]영업부</option>
						<option value="20">[20]총무부</option>
						<option value="30">[30]구매부</option>
						<option value="40">[40]개발부</option>
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
					<button type="button" onclick="chkform()">주행내역등록</button>
					<button id="resetBtn" onclick="resetform()" type="button">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
	<!-- 자바스크립트를 통한 유효성검사 -->
	<script type="text/javascript">
		function resetform(){
			let f = document.driveFrm;
			alert("정보를 지우고 처음부터 다시 입력 합니다!");
			f.reset();
			f.DRV_DATE.focus();
		}
		function chkform(){
			let f = document.driveFrm;
			if(f.DRV_DATE.value == ""){
				alert("주행일자가 입력되지 않았습니다!");
				/* 주행입력에 포커스 주기 */
				f.DRV_DATE.focus();
				return;
			}
			if(f.CAR_NO.value == ""){
				alert("차량번호가 입력되지 않았습니다!");
				/* 주행입력에 포커스 주기 */
				f.CAR_NO.focus();
				return;
			}
			if(f.DRV_START.value == ""){
				alert("시작km가 입력되지 않았습니다!");
				/* 주행입력에 포커스 주기 */
				f.DRV_START.focus();
				return;
			}
			if(f.DRV_END.value == ""){
				alert("도착km가 입력되지 않았습니다!");
				/* 주행입력에 포커스 주기 */
				f.DRV_END.focus();
				return;
			}
			if(f.DRV_MONEY.value == ""){
				alert("주유금액이 입력되지 않았습니다!");
				/* 주행입력에 포커스 주기 */
				f.DRV_MONEY.focus();
				return;
			}
			if(f.DEPT_CODE.value == ""){
				alert("부서코드가 입력되지 않았습니다!");
				/* 주행입력에 포커스 주기 */
				f.DEPT_CODE.focus();
				return;
			}
			// 마지막에 submit() 하는거 잊지않기!
			f.submit();
		}
	</script>
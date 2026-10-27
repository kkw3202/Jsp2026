<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="joinwrap">
		<h2>회원가입</h2>
		<form action="MProc.do" method="post" name="mfrm">
			<table width="500" border="1">
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td width="350">
						<input type="text" name="id" placeholder="아이디를 입력하세요"/>
					</td>
				</tr>	
				<tr height="50">
					<td align="center" width="150">비밀번호</td>
					<td width="350">
						<input type="password" name="pass" placeholder="영문/숫자로만 입력하세요"/>
					</td>
				</tr>	
				<tr height="50">
					<td align="center" width="150">비밀번호</td>
					<td width="350">
						<input type="password" name="passchk" placeholder="영문/숫자로만 입력하세요"/>
					</td>
				</tr>	
				<tr height="50">
					<td align="center" width="150">이메일</td>
					<td width="350">
						<input type="email" name="email" placeholder="@를 포함하여 입력하세요"/>
					</td>
				</tr>	
				<tr height="50">
					<td align="center" width="150">전화번호</td>
					<td width="350">
						<input type="tel" name="tel" placeholder="010-0000-0000 형식으로 입력하세요"/>
					</td>
				</tr>
				<tr height="50">
					<td align="center" width="150">관심분야</td>
					<td width="350">
						<input type="checkbox" name="hobby" value="캠핑" id="campping"/>
						<label for="campping">캠핑</label>&nbsp;&nbsp;					
						<input type="checkbox" name="hobby" value="등산" id="mount"/>
						<label for="mount">등산</label>&nbsp;&nbsp;					
						<input type="checkbox" name="hobby" value="영화" id="movie"/>
						<label for="movie">영화</label>&nbsp;&nbsp;					
						<input type="checkbox" name="hobby" value="독서" id="book"/>
						<label for="book">독서</label>&nbsp;&nbsp;					
					</td>
				</tr>
				<tr height="50">
					<td align="center" width="150">직업</td>
					<td width="350" align="center">
						<select name="job">
							<option value="교사">교사
							<option value="변호사">변호사
							<option value="의사">의사
							<option value="기술사">기술사
						</select>
					</td>
				</tr>
				<tr height="50">
					<td align="center" width="150">연령</td>
					<td width="350">
						<input type="radio" name="age" value="10대" id="teenage"/>
						<label for="teenage">10대</label>&nbsp;&nbsp;					
						<input type="radio" name="age" value="20대" id="twenty"/>
						<label for="twenty">20대</label>&nbsp;&nbsp;					
						<input type="radio" name="age" value="30대" id="thirty"/>
						<label for="thirty">30대</label>&nbsp;&nbsp;					
						<input type="radio" name="age" value="40대" id="forty"/>
						<label for="forty">40대</label>&nbsp;&nbsp;					
					</td>
				</tr>
				<tr height="50">
					<td align="center" width="150">남기는 말</td>
					<td width="350">
						<textarea rows="5" cols="40" name="info"></textarea>
					</td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center">
						<input type="button" onclick="checkform()" value="회원가입">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		<!-- <a href="main.jsp?page=MemberList">회원 목록 보기</a> -->
		
		<p align="center" style="margin-top: 10px">
			<input type="button" value="회원 전체 보기" onclick="location.href='main.jsp?page=MemberList'">
		</p>
	</div>
	
	<script type="text/javascript">
		function checkform(){
			let f = document.mfrm;
			let hobbyChk = true;
			
			for(let i =0; i<f.hobby.length; i++){
				if(f.hobby[i].checked){
					hobbyChk = false;
					break;
				}
			}
			
			if(f.id.value == ""){
				alert("아이디를 입력하세요");
				f.id.focus();
				return;
			}
			if(f.pass.value == ""){
				alert("비밀번호를 입력하세요");
				f.pass.focus();
				return;
			}
			if(f.passchk.value == ""){
				alert("비밀번호확인을 입력하세요");
				f.passchk.focus();
				return;
			}
			if(f.email.value == ""){
				alert("이메일을 입력하세요");
				f.email.focus();
				return;
			}
			if(f.tel.value == ""){
				alert("전화번호를 입력하세요");
				f.tel.focus();
				return;
			}
			if(hobbyChk){
				alert("취미를 선택하세요");
				hobbyChk = true;
				f.hobby[0].checked = 'checked';
				return;
			}
			if(f.job.value == ""){
				alert("직업을 선택하세요");
				f.job.focus();
				return;
			}
			if(f.age.value == ""){
				alert("나이를 선택하세요");
				return;
			}
			if(f.info.value == ""){
				alert("남기는말을 입력하세요");
				f.info.focus();
				return;
			}
			f.submit();
		}
	
	
	</script>
	
	
	
</body>
</html>
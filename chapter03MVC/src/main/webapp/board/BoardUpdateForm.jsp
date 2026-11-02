<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="style/boardwrite.css">

<div class="boardwrap">
    <h2> 게시글 수정 </h2>
    <form action="BoardUpdateProcCon.do" method="post">
        <table width="600" border="1">
            <tr height="40">
                <td align="center" width="120">작성자</td>
                <td align="center" width="180">${bdto.writer }</td>
                <td align="center" width="120">작성일</td>
                <td align="center" width="180">${bdto.reg_date }</td>
            </tr>
            <tr height="40">
                <td align="center" width="120">제목</td>
                <td align="left" width="480" colspan="3">
                    <input type="text" name="subject" value="${bdto.subject}">
                </td>
            </tr>
            <tr height="40">
                <td align="center" width="120">패스워드</td>
                <td align="left" width="480" colspan="3">
                    <input type="password" name="userPw">
                </td>
            </tr>
            <tr height="40">
                <td align="center" width="120">글내용</td>
                <td width="480" colspan="3">
                    <textarea rows="10" cols="60" name="content">${bdto.content}</textarea>
                </td>
            </tr>
            <tr height="40">
                <td align="center" colspan="4">
                    <input type="hidden" name="num" value="${bdto.num}">
                    <!-- BoardDAO를 이용하지 않고 바로 비밀번호를 비교할 수 있도록 password를 hidden으로 넘겨준다. -->
                    <input type="hidden" name="dbPw" value="${bdto.password}">
                    <input type="submit" value="글수정">
                    <input type="button" onclick="location.href='BoardListCon.do'" value="전체글보기">
                </td>
            </tr>
        </table>
    </form>
</div>

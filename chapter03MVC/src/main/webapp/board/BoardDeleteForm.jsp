<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style/boardwrite.css">

<div class="boardwrap">
    <h2> 게시글 삭제 </h2>
    <form action="BoardDeleteProcCon.do" method="post">
        <table width="600" border="1">
            <tr height="40">
                <td width="120" align="center">작성자</td>
                <td width="180" align="center">${bdto.writer }</td>
                <td width="120" align="center">작성일</td>
                <td width="180" align="center">${bdto.reg_date }</td>
            </tr>
            <tr height="40">
                <td width="120" align="center">제목</td>
                <td width="480" align="left" colspan="3">${bdto.subject }</td>
            </tr>
            <tr height="40">
                <td width="120" align="center">패스워드</td>
                <td width="480" align="left" colspan="3"><input type="password" name="userPw"></td>
            </tr>
            <tr height="40">
                <td align="center" colspan="4">
                    <input type="hidden" name="num" value="${bdto.num}">
                    <input type="hidden" name="dbPw" value="${bdto.password}">
                    <input type="submit" value="글삭제">&nbsp;&nbsp;
                    <input type="button" onclick="location.href='BoardListCon.do'" value="목록보기">
                </td>
            </tr>
        </table>
    </form>
</div>

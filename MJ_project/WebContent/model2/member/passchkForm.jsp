<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<style type="text/css">
	table {
	width: 60%;
		margin: 50px; 
		margin-top: 5px
	}
</style>
</head>
<body>
<form action="passchk.me" method="post" name="f" onsubmit="return inchk(this)">
<input type="hidden" name="id" value="${param.id}">
	<table>
		<caption>회원 정보 수정</caption>
		<tr><td>현재 비밀번호</td>
		<td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2"><input class="button" type="submit" value="확인"></td></tr>
	</table>
</form>
</body>
</html>
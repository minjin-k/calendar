<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ Ȯ��</title>
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
<form name="f" action="delete.me" method="post">
<input type="hidden" name="id" value="${param.id }">
<table>
	<caption>ȸ�� ���� ��й�ȣ �Է�</caption>
	<tr><td>��й�ȣ</td>
		<td><input type="password" name="pass"></td></tr>
	<tr><td colspan="2"><input class="button" type="submit" value="Ż���ϱ�"></td></tr>
</table>
</form>
</body>
</html>
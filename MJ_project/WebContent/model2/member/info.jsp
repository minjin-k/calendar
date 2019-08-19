<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<style type="text/css">
	table {
		border: 1px solid #333333;
		width : 60%;
		margin: 60px;
	}
	th,td { 
		border-bottom: 0px;
	}
</style>
</head>
<body>
<table style="font-weight:bold">
	<caption>ȸ�� ����</caption>
</table>
<p>
<table>
	<tr><td rowspan="3">
		<img src="img/${mem.picture}" width="150" height="150" style="border-radius: 50%;"></td>
		<td><a style="font-weight:bold">${mem.id}</a>&nbsp;&nbsp;��</td></tr>
		<tr><td><a style="font-weight:bold">${mem.nick}</a>�� �ݰ����ϴ�.</td></tr>
		<tr><td>
			<c:if test="${mem.id == 'admin'}">
			<a href="list.me">[ȸ������]</a>
			</c:if>
			
			<a href="passchkForm.me?id=${mem.id}">[����]</a>
			
			<c:if test="${mem.id != 'admin'}">
			<a href="deleteForm.me?id=${mem.id}">[Ż��]</a>
			</c:if>
		</td></tr>
		
</table>
</body>
</html>
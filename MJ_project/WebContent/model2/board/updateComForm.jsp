<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ȭ��</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
</head>
<body>
<form action="updateCom.do" method="post" name="f">
	<input type="hidden" name="no" value="${param.no}">
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="code" value="${param.code}">
	<table>
		<caption>��ۼ���</caption>
		<tr><td>���̵�</td> <td><input type="text" name="id" value="${sessionScope.login}" readonly></td></tr>
		 <tr><td>�̸�</td> <td><input type="text" name="name" value="${param.name}"></td></tr>
		 <tr><td>����</td> <td ><textarea rows="15" name="content">${param.content}</textarea></td></tr>
		 <tr><td colspan="2"><input type="submit" value="��ۼ���"></td></tr>
	</table>
</form>
</body>
</html>
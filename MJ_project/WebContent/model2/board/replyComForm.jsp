<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	�亯 �� ���� ȭ��
    		- �Է� ȭ�� ǥ��
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ��� ����</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
</head>
<body>
<form action="replyCom.do" method="post" name="f">
	<input type="hidden" name="no" value="${param.no}">
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="code" value="${param.code}">
	<input type="hidden" name="ref" value="${param.ref}">
	<input type="hidden" name="reflevel" value="${param.reflevel}">
	<input type="hidden" name="refstep" value="${param.refstep}">
	<table>
		<caption>�� ����ۼ�</caption>
		<tr><td>���̵�</td> <td><input type="text" name="id" value="${sessionScope.login}" readonly></td></tr>
		 <tr><td>�̸�</td> <td><input type="text" name="name"></td></tr>
		 <tr><td>����</td> <td ><textarea rows="15" name="content"></textarea></td></tr>
		 <tr><td colspan="2"><a href="javascript:document.f.submit()">[��۵��]</a></td></tr>
	</table>
</form>
</body>
</html>
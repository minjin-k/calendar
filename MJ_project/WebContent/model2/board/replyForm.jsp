<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--
    	�亯 �� ���� ȭ��
    		- �Է� ȭ�� ǥ��
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
</head>
<body>
<form action="reply.do" method="post" name="f">
	<input type="hidden" name="num" value="${b.num}">
	<input type="hidden" name="ref" value="${b.ref}">
	<input type="hidden" name="reflevel" value="${b.reflevel}">
	<input type="hidden" name="refstep" value="${b.refstep}">
	<input type="hidden" name="code" value="${param.code}">
	<table><caption>�Խ��� ��� ���</caption>
		<tr><td>���̵�</td> <td><input type="text" name="id" value="${sessionScope.login}" readonly></td></tr>
		<tr><td>�۾���</td><td><input type="text" name="name"></td></tr>
		<tr><td>�Խ���</td> <td><input type="text" 
		<c:if test="${param.code==1}"> value="��������"</c:if> 
		<c:if test="${param.code==2}"> value="���ǻ���"</c:if> 
		<c:if test="${param.code==3}"> value="�����Ͱ��߹� �����Խ���"</c:if> 
		<c:if test="${param.code==4}"> value="��Ʈ��ũ�� �����Խ���"</c:if> 
		<c:if test="${param.code==5}"> value="����Ʈ���� �����Խ���"</c:if> 
		<c:if test="${param.code==6}"> value="�����͹� �����Խ���"</c:if> 
		<c:if test="${param.code==7}"> value="c���� �����Խ���"</c:if> 
		readonly></tr>
		<tr><td >����</td><td><input type="text" name="subject" value="RE:${b.subject}"></td></tr>
		<tr><td>����</td><td><textarea name="content" rows="15"></textarea></td></tr>
		<tr><td colspan="2"><a href="javascript:document.f.submit()">[�亯�۵��]</a></td></tr>
	</table>
</form>
</body>
</html>
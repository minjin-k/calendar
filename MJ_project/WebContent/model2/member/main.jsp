<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	logout.me ��û  :
		session ���� clear�ϰ�, 
		�α׾ƿ� �Ǿ����ϴ�. �޼��� ���, loginForm.jsp ������ �̵�.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���α׷�</title>
</head>
<body>
<h3> ${sessionScope.login} ȸ���� �ݰ����ϴ�.</h3>
<h3></h3>
</body>
</html>
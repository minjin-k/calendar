<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	logout.me 요청  :
		session 정보 clear하고, 
		로그아웃 되었습니다. 메세지 출력, loginForm.jsp 페이지 이동.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리 프로그램</title>
</head>
<body>
<h3> ${sessionScope.login} 회원님 반갑습니다.</h3>
<h3></h3>
</body>
</html>
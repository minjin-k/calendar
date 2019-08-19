<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보보기</title>
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
	<caption>회원 정보</caption>
</table>
<p>
<table>
	<tr><td rowspan="3">
		<img src="img/${mem.picture}" width="150" height="150" style="border-radius: 50%;"></td>
		<td><a style="font-weight:bold">${mem.id}</a>&nbsp;&nbsp;님</td></tr>
		<tr><td><a style="font-weight:bold">${mem.nick}</a>님 반갑습니다.</td></tr>
		<tr><td>
			<c:if test="${mem.id == 'admin'}">
			<a href="list.me">[회원관리]</a>
			</c:if>
			
			<a href="passchkForm.me?id=${mem.id}">[수정]</a>
			
			<c:if test="${mem.id != 'admin'}">
			<a href="deleteForm.me?id=${mem.id}">[탈퇴]</a>
			</c:if>
		</td></tr>
		
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
�̸�: ${param.name }<br>
����: ${param.age }<br>
����: ${(param.gender == 1)?"��":"��" }<br>
����⵵: ${param.year }<br>
���� : ��${2019-param.year}
</body>
</html>
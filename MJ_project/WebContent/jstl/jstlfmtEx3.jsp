<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 문제</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
	이름: <input type="text" name="name" value="${parse.name}"><br>
	입사일: <input type="text" name="hiredate" value="${parse.hiredate}">
	(yyyy-MM-dd 형태로 입력)<br>
	급여: <input type="text" name="salary" value="${parse.salary}"><br>
	<script type="text/javascript">
		document.f.salary.value = 
			'<fmt:formatNumber value="${param.salary}" pattern="#,###,###" />';
	</script>
	<input type="submit" value="전송">
</form>
<hr>
이름: ${param.name}<br>
입사일: ${param.hiredate}<br>
급여: ${param.salary}<br>
<h3>문제: 입사일은 yyyy년 MM월 dd일 E요일 형태로 출력<br>
	급여는 세자리마다 ,를 출력.<br>
	급여*12로 연봉을 계산하고, 세자리마다 ,를 출력하기</h3>
이름:${param.name}<br>
<fmt:parseDate var="date" value="${param.hiredate}" pattern="yyyy-MM-dd"/>
입사일: <fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일 E요일 "/><br>
급여: <fmt:formatNumber value="${param.salary}" pattern="#,###,###"/> <br>
연봉: <fmt:formatNumber value="${param.salary * 12}" pattern="#,###,###"/><br>
</body>
</html>
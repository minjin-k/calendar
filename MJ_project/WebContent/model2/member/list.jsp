<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록 조회</title>
<link rel="stylesheet" href ="/MJ_project/css/main.css">
<script type="text/javascript">
	function del(id){
		if(confirm(id + "님을 탈퇴하시겠습니까?")){
			location.href="delete.me?id=" + id;
		}
	}
	function accept(id) {
		if(confirm(id + "님을 승인하시겠습니까?")){
			location.href="accept.me?id=" + id;
		}
	}
</script>
</head>
<body>
<table>
	<caption>회원 목록</caption>
	<tr><th>사진</th> <th>아이디</th> <th>이름</th> <th>닉네임</th> <th>과정명</th> <th>휴대전화</th> <th>승인</th> <th>&nbsp;</th>
	
	<c:forEach var="m" items="${list}">
	<tr>
	<td><img src="img/${m.picture}" width="30" height="32"></td>
	<td><a href="info.me?id=${m.id}">${m.id}</a></td> <td>${m.name}</td> <td>${m.nick}</td> 
		<td>${m.major}</td> <td>${m.tel}</td> 
		<td>
		<c:if test="${m.accept != 1}">
			<a href="javascript:accept('${m.id}')">[승인]</a>
		</c:if>
		
		</td> 
	<td><a href="passchkForm.me?id=${m.id}">[수정]</a>
	<c:if test="${m.id != 'admin'}">
		<a href="javascript:del('${m.id}')">[탈퇴]</a>
	</c:if></td></tr>
	</c:forEach>
</table>
<form action="search.me" method="post" name="sf">
	<table><tr><td style="boader-width: 0px;">
		<select name="column"><option value="">선택하세요</option>
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="tel">전화</option>
		</select>
		<script>
			document.sf.column.value = "${param.column}"
		</script>
		<input type="text" name="find" value="${param.find}" style="width:300px;">
		<input type="submit" value="검색"></td></tr>
	</table>
</form>
</body>
</html>
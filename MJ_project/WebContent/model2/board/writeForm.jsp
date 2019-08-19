<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<script type="text/javascript">
	function board_submit() {
		f = document.f;
		if(f.name.value==""){
			alert("글쓴이를 입력하세요.");
			f.name.focus();
			return;
		}
		if(f.subject.value==""){
			alert("제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		if(f.content.value==""){
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="code" value="${param.code}">
	<table>
		<caption>게시판 글쓰기</caption>
		<tr><td>아이디</td> <td><input type="text" name="id" value="${sessionScope.login}" readonly></td></tr>
		<tr><td>이름</td> <td><input type="text" name="name" value="${sessionScope.login}"></td></tr>
		<tr><td>게시판</td> <td><input type="text" 
		<c:if test="${param.code==1}"> value="공지사항"</c:if> 
		<c:if test="${param.code==2}"> value="건의사항"</c:if> 
		<c:if test="${param.code==3}"> value="빅데이터개발반 자유게시판"</c:if> 
		<c:if test="${param.code==4}"> value="네트워크반 자유게시판"</c:if> 
		<c:if test="${param.code==5}"> value="스마트웹반 자유게시판"</c:if> 
		<c:if test="${param.code==6}"> value="빅데이터반 자유게시판"</c:if> 
		<c:if test="${param.code==7}"> value="c샵반 자유게시판"</c:if> 
		readonly></tr>
		 <tr><td>제목</td> <td><input type="text" name="subject"></td></tr>
		 <tr><td>내용</td> <td ><textarea rows="15" name="content"></textarea></td></tr>
		 <tr><td>첨부파일</td> <td><input type="file" name="file1"></td></tr>
		 <tr><td colspan="2"><a href="javascript:board_submit()">[게시물등록]</a></td></tr>
	</table>
</form>
</body>
</html>
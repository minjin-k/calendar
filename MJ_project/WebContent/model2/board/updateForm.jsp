<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">

<script type="text/javascript">
	function file_delete() {
		document.f.file2.value="";
		file_desc.style.display="none";
	}
</script>
</head>
<body>
<form action="update.do" method="post" enctype="multipart/form-data" name="f">
	<input type="hidden" name="num" value="${b.num}">
	<input type="hidden" name="code" value="${b.code}">
	<input type="hidden" name="file2" value="${b.file1}">
	<table>
		<caption>�Խ��� ���� ȭ��</caption>
		<tr><td>�۾���</td>
			<td><input type="text" name="name" value="${b.name}"></td></tr>
			
		<tr><td>����</td>
			<td><input type="text" name="subject" value="${b.subject}"></td></tr>
			
		<tr><td>����</td>
			<td><textarea rows="15" name="content">${b.content}</textarea></tr>
			
		<tr><td>÷������</td>
		<td>
		<c:if test="${!empty b.file1}">
			<div id="file_desc">${b.file1}
				<a href="javascript:file_delete()">[÷������ ����]</a></div>			
		</c:if>
			<input type="file" name="file1" value="${b.file1}"></td></tr>
		<tr><td colspan="2">
			<a href="javascript:document.f.submit()">[�Խù�����]</a>
			</td></tr>
	</table>
</form>
</body>
</html>
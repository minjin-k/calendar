<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ��� ��ȸ</title>
<link rel="stylesheet" href ="/MJ_project/css/main.css">
<script type="text/javascript">
	function del(id){
		if(confirm(id + "���� Ż���Ͻðڽ��ϱ�?")){
			location.href="delete.me?id=" + id;
		}
	}
	function accept(id) {
		if(confirm(id + "���� �����Ͻðڽ��ϱ�?")){
			location.href="accept.me?id=" + id;
		}
	}
</script>
</head>
<body>
<table>
	<caption>ȸ�� ���</caption>
	<tr><th>����</th> <th>���̵�</th> <th>�̸�</th> <th>�г���</th> <th>������</th> <th>�޴���ȭ</th> <th>����</th> <th>&nbsp;</th>
	
	<c:forEach var="m" items="${list}">
	<tr>
	<td><img src="img/${m.picture}" width="30" height="32"></td>
	<td><a href="info.me?id=${m.id}">${m.id}</a></td> <td>${m.name}</td> <td>${m.nick}</td> 
		<td>${m.major}</td> <td>${m.tel}</td> 
		<td>
		<c:if test="${m.accept != 1}">
			<a href="javascript:accept('${m.id}')">[����]</a>
		</c:if>
		
		</td> 
	<td><a href="passchkForm.me?id=${m.id}">[����]</a>
	<c:if test="${m.id != 'admin'}">
		<a href="javascript:del('${m.id}')">[Ż��]</a>
	</c:if></td></tr>
	</c:forEach>
</table>
<form action="search.me" method="post" name="sf">
	<table><tr><td style="boader-width: 0px;">
		<select name="column"><option value="">�����ϼ���</option>
			<option value="id">���̵�</option>
			<option value="name">�̸�</option>
			<option value="tel">��ȭ</option>
		</select>
		<script>
			document.sf.column.value = "${param.column}"
		</script>
		<input type="text" name="find" value="${param.find}" style="width:300px;">
		<input type="submit" value="�˻�"></td></tr>
	</table>
</form>
</body>
</html>
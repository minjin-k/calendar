<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ۼ�</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<script type="text/javascript">
	function comment_submit() {
		f = document.f;
		if(f.content.value==""){
			alert("������ �Է��ϼ���.");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
<form action="writeCom.do" method="post" name="f">
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="code" value="${param.code}">
	<table>
		<caption>����ۼ�</caption>
		<tr><td>���̵�</td> <td><input type="text" name="id" value="${sessionScope.login}" readonly></td></tr>
		 <tr><td>�̸�</td> <td><input type="text" name="name"></td></tr>
		 <tr><td>����</td> <td ><textarea rows="15" name="content"></textarea></td></tr>
		 <tr><td colspan="2"><a href="javascript:comment_submit()">[��۵��]</a></td></tr>
	</table>
</form>
</body>
</html>
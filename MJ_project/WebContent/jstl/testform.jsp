<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<form action="test.jsp" method="post">
	이름: <input type="text" name="name" value="홍길동"><br>
	나이: <input type="text" name="age" value="10"><br>
	성별: <input type="radio" name="gender" value="1" checked>남
		<input type="radio" name="gender" value="2" >여<br>
	출생년도: <select name="year">
	<% for(int i=1981; i<= 2010;i++) {%>
	<option><%=i %></option>
	<%} %>
	</select><br>
	<input type="submit" value="전송">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
</head>
<body id="LoginForm">
   <div class=" w3-container " style="width:1300px; height:500px; margin-top: 80px;" >
      <div class="login-form" style="margin-left: 10px;">
         <div class="main-div w3-card-4">
			<form action="login.me" method="post">
				<table>
					<caption>�α���</caption>
					<tr><td class="login"><input type="text" name="id" placeholder="���̵�" ></td></tr>
					<tr><td class="login"><input type="password" name="pass" placeholder="��й�ȣ"></td></tr>
					<tr><td class="login">
						<input class="button" type="submit" value="�α���" style="width: 80%; font-size: 18px;"></td></tr>
					<tr><td class="login" style="font-size: 13px">GOODEE�� ó���̽Ű���?&nbsp;&nbsp;&nbsp;<a href="joinForm.jsp" style="color: blue; font-size: 17px">join us</a></td></tr>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>
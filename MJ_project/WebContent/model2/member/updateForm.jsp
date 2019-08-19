<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<style type="text/css">
	table {
	width: 60%;
		margin: 50px; 
		margin-top: 5px
	}
</style>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
   function input_check(f) {
	   if(f.name.value == ""){
	    	  alert("이름을 입력하세요.");
	          f.pass.focus();
	          return false;
	      }
	   if(f.pass.value == ""){
	    	  alert("비밀번호를 입력하세요.");
	          f.pass.focus();
	          return false;
	      }
	   if(f.nick.value == ""){
	    	  alert("닉네임을 입력하세요.");
	          f.nick.focus();
	          return false;
	      }
	   if(f.tel.value == ""){
	    	  alert("전화번호를 입력하세요.");
	          f.tel.focus();
	          return false;
	      }
	   if(f.pass.value != f.repass.value){
    	  alert("비밀번호가 일치하지 않습니다.");
    	  f.repass.value="";
          f.repass.focus();
          return false;
      }
      return true;
   }
   function win_upload() {
      var op = "width=500, height=200, left=50, top=150";
      open("pictureimgForm.me","",op);
   }
</script>
</head>
<body>

<form action="update.me" name="f" method="post" onsubmit="return input_check(this)">
<input type="hidden" name="picture" value="${mem.picture}">
<table>
   <caption>회원 정보 수정</caption>
   <tr><td colspan="2" valign="bottom" class="login">
      <img src="img/${mem.picture}" width="150" height="170" id="pic" style="border-radius: 50%;"><br>
      <font size="1"><a href="javascript:win_upload()">사진수정</a></font></td></tr>
      <tr><td>아이디</td><td><input type="text" name="id" value="${mem.id}" readonly></td></tr>
      <tr><td>이름</td><td><input type="text"  name="name" value="${mem.name}"></td></tr>
      <tr><td>비밀번호수정</td><td><input type="password" name="pass"></td></tr>
      <tr><td>비밀번호재확인</td><td><input type="password" name="repass"></td></tr>   
      <tr><td>닉네임</td><td><input type="text"  name="nick" value="${mem.nick}"></td></tr>
      <tr><td>과정명</td><td><input type="text"  name="major" value="${mem.major}" readonly></td></tr>
      <tr><td>휴대전화</td><td><input type="text" name="tel" value="${mem.tel}"></td></tr>
      <tr><td colspan="2" class="login"><input class="button" type="submit" value="회원수정" style="width: 90%; font-size: 18px;"></td></tr>
</table>
</form>
</body>
</html>
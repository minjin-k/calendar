<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입화면</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function input_check(f) {
		if(f.id.value == ""){
	    	  alert("아이디를 입력하세요.");
	          f.id.focus();
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
	   if(f.major.value == ""){
	    	  alert("과정명을 선택하세요.");
	          f.major.focus();
	          return false;
	      }
	   if(f.tel.value == ""){
	    	  alert("전화번호를 입력하세요.");
	          f.tel.focus();
	          return false;
	      }
	    if(f.pass.value != f.repass.value){
	  	  alert("비밀번호가 일치하지 않습니다.");
	        f.repass.focus();
	        return false;
	    }
	   	return true;
	}
	
	$(document).ready(function(){
		$("#ibtn").click(function(){
			var data = "id=" + $("#id").val();
			$.ajax({
				url : "ajaxid.jsp",
				type : "post",
				data : data,
				success : function(data) {
					$("#message1").html(data);
			},
				error : function(xhr) {
					alert("서버 오류:" + xhr.status);
				}
			})
		})
	})
	$(document).ready(function(){
		$("#nbtn").click(function(){
				var data = "nick=" + $("#nick").val();
				$.ajax({
					url : "ajaxnick.jsp",
					type : "post",
					data : data,
					success : function(data) {
						$("#message2").html(data);
				},
					error : function(xhr) {
						alert("서버 오류:" + xhr.status);
					}
				})
			})
	})
</script>
 
</head>
<body>
<form action="join.me" name="f" method="post" onsubmit="return input_check(this)">
	<input type="hidden" name="picture" value="">
	<table>
		<caption>회원가입</caption>
		<tr> <td class="login"><input type="text" name="id" id="id" placeholder="아이디" style="height:35px; width : 50%">
					<input type="button" class="button" value="중복확인" id="ibtn" style="height:35px; width : 10%">
					 <div id="message1" style="font-size: 17px"></div></td></tr>
		<tr> <td class="login"><input type="text" name="name"  placeholder="이름" style="height:35px; width : 60%"></td></tr>
		<tr> <td class="login"><input type="password" name="pass" placeholder="비밀번호" style=" height:35px; width : 60%"></td></tr>
		<tr> <td class="login"><input type="password" name="repass" placeholder="비밀번호 재입력" style="height:35px; width : 60%"></td></tr>
		<tr> <td class="login"><input type="text" name="nick" id="nick" placeholder="닉네임" style="height:35px; width : 50%">
					<input type="button" class="button" value="중복확인" id="nbtn" style="height:35px; width : 10%">
					 <div id="message2" style="font-size: 17px"></div></td></tr>
		<tr> <td class="login">
				<select style="height:35px; width : 60%" name="major">
					<option value="">과정명을 선택하세요.</option>
					<option value="빅데이터개발">빅데이터개발</option><option value="네트워크">네트워크</option><option value="스마트웹">스마트웹</option>
					<option value="빅데이터">빅데이터</option><option value="c샵">c샵</option><option value="GOODEE">GOODEE</option>
				</select>
			</td></tr>
		<tr><td class="login"><input type="text" name="tel" placeholder="휴대전화" style="height:35px; width : 60%"></td></tr>
		<tr><td class="login"><input type="submit" class="button" value="회원가입" style="height:35px; width : 60%"></td></tr>
	</table>
</form>
</body>
</html>
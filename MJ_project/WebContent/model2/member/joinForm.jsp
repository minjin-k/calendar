<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ȭ��</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function input_check(f) {
		if(f.id.value == ""){
	    	  alert("���̵� �Է��ϼ���.");
	          f.id.focus();
	          return false;
	      }
	   if(f.pass.value == ""){
	    	  alert("��й�ȣ�� �Է��ϼ���.");
	          f.pass.focus();
	          return false;
	      }
	   if(f.nick.value == ""){
	    	  alert("�г����� �Է��ϼ���.");
	          f.nick.focus();
	          return false;
	      }
	   if(f.major.value == ""){
	    	  alert("�������� �����ϼ���.");
	          f.major.focus();
	          return false;
	      }
	   if(f.tel.value == ""){
	    	  alert("��ȭ��ȣ�� �Է��ϼ���.");
	          f.tel.focus();
	          return false;
	      }
	    if(f.pass.value != f.repass.value){
	  	  alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
					alert("���� ����:" + xhr.status);
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
						alert("���� ����:" + xhr.status);
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
		<caption>ȸ������</caption>
		<tr> <td class="login"><input type="text" name="id" id="id" placeholder="���̵�" style="height:35px; width : 50%">
					<input type="button" class="button" value="�ߺ�Ȯ��" id="ibtn" style="height:35px; width : 10%">
					 <div id="message1" style="font-size: 17px"></div></td></tr>
		<tr> <td class="login"><input type="text" name="name"  placeholder="�̸�" style="height:35px; width : 60%"></td></tr>
		<tr> <td class="login"><input type="password" name="pass" placeholder="��й�ȣ" style=" height:35px; width : 60%"></td></tr>
		<tr> <td class="login"><input type="password" name="repass" placeholder="��й�ȣ ���Է�" style="height:35px; width : 60%"></td></tr>
		<tr> <td class="login"><input type="text" name="nick" id="nick" placeholder="�г���" style="height:35px; width : 50%">
					<input type="button" class="button" value="�ߺ�Ȯ��" id="nbtn" style="height:35px; width : 10%">
					 <div id="message2" style="font-size: 17px"></div></td></tr>
		<tr> <td class="login">
				<select style="height:35px; width : 60%" name="major">
					<option value="">�������� �����ϼ���.</option>
					<option value="�����Ͱ���">�����Ͱ���</option><option value="��Ʈ��ũ">��Ʈ��ũ</option><option value="����Ʈ��">����Ʈ��</option>
					<option value="������">������</option><option value="c��">c��</option><option value="GOODEE">GOODEE</option>
				</select>
			</td></tr>
		<tr><td class="login"><input type="text" name="tel" placeholder="�޴���ȭ" style="height:35px; width : 60%"></td></tr>
		<tr><td class="login"><input type="submit" class="button" value="ȸ������" style="height:35px; width : 60%"></td></tr>
	</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="day" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �󼼺���</title>
<link rel="stylesheet" href="/MJ_project/css/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	td {text-align: left; 
		font-size: 13px;
	}
	table {
		margin: 50px; 
		margin-top: 30px
	}
</style>

<script type="text/javascript">
	function add_submit() {
		f = document.f;
		if(f.id.value==""){
			alert("�α����� �ʿ��մϴ�.");
			self.close();
			return;
		}
		if(f.major.value==""){
			alert("������ �����ϼ���.");
			f.major.focus();
			return;
		}
		if(f.subject.value==""){
			alert("������ �Է��ϼ���.");
			f.subject.focus();
			return;
		}
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
<form action="updateCal.do" name="f" method="post">
<input type="hidden" name="id" value="${sessionScope.login}">
<input type="hidden" name="no" value="${param.no}">
<table>
   <caption>���� ����</caption>
   	  <tr><td style="text-align: center;">&nbsp;������<br><input type="date" name="s_date" id="s_date" value="${param.s_date}" style="height: 25px; text-align: center;" ></td>
   	  <td style="text-align: center;">&nbsp;<br><h2>~</h2></td>
   	  <td style="text-align: center;">&nbsp;������+1<br><input type="date" name="e_date" id="e_date" value="${param.e_date}"  style="height: 25px; text-align: center;"></td></tr>
      <tr><td colspan="3" style="background-color: #fcf5f9;">&nbsp;������<br>
      			<select style="width:95%; width: 95%; height: 25px;" name="major" id="major" style="width: 95%">
					<option value="${param.major}">${param.major}</option>
					<option value="�����Ͱ���">�����Ͱ���</option><option value="��Ʈ��ũ">��Ʈ��ũ</option><option value="����Ʈ��">����Ʈ��</option>
					<option value="������">������</option><option value="c��">c��</option><option value="GOODEE" >GOODEE</option>
				</select></td></tr>
      <tr><td colspan="3" >&nbsp;����<br><input type="text" name="subject" style="width: 95%; height: 25px;" value="${param.title}" style="width: 95%; height: 25px;"></td></tr>
      <tr><td colspan="3" style="background-color: #fcf5f9;">&nbsp;����<br><textarea rows="10" name="content"  style="width: 95%" >${param.content}</textarea></td></tr>
      <tr><td colspan="3" style="text-align: center; "><input type="submit" class="button" style="width: 20%; height: 50px;" value="�����Ϸ�"></td></tr>
</table>
</form>
</body>
</html>
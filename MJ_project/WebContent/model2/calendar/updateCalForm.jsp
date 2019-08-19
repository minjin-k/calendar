<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="day" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>일정 상세보기</title>
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
			alert("로그인이 필요합니다.");
			self.close();
			return;
		}
		if(f.major.value==""){
			alert("과정을 선택하세요.");
			f.major.focus();
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
<form action="updateCal.do" name="f" method="post">
<input type="hidden" name="id" value="${sessionScope.login}">
<input type="hidden" name="no" value="${param.no}">
<table>
   <caption>일정 수정</caption>
   	  <tr><td style="text-align: center;">&nbsp;시작일<br><input type="date" name="s_date" id="s_date" value="${param.s_date}" style="height: 25px; text-align: center;" ></td>
   	  <td style="text-align: center;">&nbsp;<br><h2>~</h2></td>
   	  <td style="text-align: center;">&nbsp;종료일+1<br><input type="date" name="e_date" id="e_date" value="${param.e_date}"  style="height: 25px; text-align: center;"></td></tr>
      <tr><td colspan="3" style="background-color: #fcf5f9;">&nbsp;과정명<br>
      			<select style="width:95%; width: 95%; height: 25px;" name="major" id="major" style="width: 95%">
					<option value="${param.major}">${param.major}</option>
					<option value="빅데이터개발">빅데이터개발</option><option value="네트워크">네트워크</option><option value="스마트웹">스마트웹</option>
					<option value="빅데이터">빅데이터</option><option value="c샵">c샵</option><option value="GOODEE" >GOODEE</option>
				</select></td></tr>
      <tr><td colspan="3" >&nbsp;제목<br><input type="text" name="subject" style="width: 95%; height: 25px;" value="${param.title}" style="width: 95%; height: 25px;"></td></tr>
      <tr><td colspan="3" style="background-color: #fcf5f9;">&nbsp;내용<br><textarea rows="10" name="content"  style="width: 95%" >${param.content}</textarea></td></tr>
      <tr><td colspan="3" style="text-align: center; "><input type="submit" class="button" style="width: 20%; height: 50px;" value="수정완료"></td></tr>
</table>
</form>
</body>
</html>
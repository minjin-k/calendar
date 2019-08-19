<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function upCal() {
		location.href="updateCalForm.do?no=${param.no}&s_date=${param.s_date}&e_date=${param.e_date}&major=${param.major}&title=${param.title}&content=${param.content}";
	}
	function delCal(no) {
		location.href="deleteCal.do?no="+no;
	}
</script>
<style type="text/css">
	td {text-align: left; 
		font-size: 13px;
	}
	table {
		margin: 50px; 
		margin-top: 30px
	}
</style>
</head>
<body>
<input type="hidden" name="id" value="${sessionScope.login}">
<input type="hidden" name="no" value="${param.no}">
<table>
   <caption>일정 상세보기</caption>
   	  <tr><td style="text-align: center;">&nbsp;시작일<br><input type="date" name="s_date" id="s_date" value="${param.s_date}" style="height: 25px; text-align: center;" readonly></td>
   	  <td style="text-align: center;">&nbsp;<br><h2>~</h2></td>
   	  <td style="text-align: center;">&nbsp;종료일+1<br><input type="date" name="e_date" id="e_date" value="${param.e_date}" readonly></td></tr>
      <tr><td colspan="3" style="background-color: #fcf5f9;">&nbsp;과정명<br><input type="text" name="major" style="width: 95%" value="${param.major}" readonly></td></tr>
      <tr><td colspan="3">&nbsp;제목<br><input type="text" name="subject" style="width: 95%" value="${param.title}" readonly></td></tr>
      <tr><td colspan="3" style="background-color: #fcf5f9;">&nbsp;내용<br><textarea rows="10" name="content"  style="width: 95%" readonly>${param.content}</textarea></td></tr>
      <tr><td colspan="3" style="text-align: center; ">
      		<input class="button" style="width: 20%; height: 50px;" type="button" value="수정" OnClick="javascript:upCal()">
      		<input class="button" style="width: 20%; height: 50px;" type="button" value="삭제" OnClick="javascript:delCal(${param.no})">
      		<input class="button" style="width: 20%; height: 50px;" type="button" value="취소" OnClick="javascript:self.close()"></td></tr>
</table>
</body>
</html>
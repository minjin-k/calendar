<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head >
<meta charset="EUC-KR">
<title><decorator:title/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
.w3-third img{margin-bottom: -6px; opacity: 0.8; cursor: pointer}
.w3-third img:hover{opacity: 1}

</style>
<decorator:head/>
</head>
<body class="w3-white w3-content " style="max-width:1600px">
<div class="jumbotron text-center w3-center" style="z-index:5;">
<p>&nbsp;</p>
  <h1>WITH GOODEE</h1>
</div>
<nav class="w3-sidebar w3-bar-block w3-light-gray w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <h3 class="w3-padding-64 w3-center">
  <a href="${path}/model2/calendar/mainForm.do" class="w3-bar-item w3-button"><i class="fa fa-home w3-jumbo"></i><br>GOODEE</a></h3>
  <c:if test="${sessionScope.login != null}">
  <a href="${path}/model2/member/logout.me" class="w3-bar-item w3-button">${sessionScope.login}님 로그아웃</a>
  </c:if>
  <c:if test="${sessionScope.login == null}">
  <a href="${path}/model2/member/loginForm.me" class="w3-bar-item w3-button">로그인</a>
  </c:if> 
  	<a href="${path}/model2/member/info.me?id=${sessionScope.login}" class="w3-bar-item w3-button">회원정보</a> 
  <c:if test="${sessionScope.login == 'admin'}">
  	<a href="${path}/model2/member/list.me" class="w3-bar-item w3-button">회원목록</a>
  </c:if>
      <a href="${path}/model2/board/list.do?code=1" class="w3-bar-item w3-button">공지사항</a> 
	  <a href="${path}/model2/board/list.do?code=2" class="w3-bar-item w3-button">건의사항</a> 
  <div class="w3-dropdown-hover">
    <button class="w3-bar-item w3-button">자유게시판</button>
    <div class="w3-dropdown-content w3-bar-block w3-card-4">
	  <a href="${path}/model2/board/list.do?code=3" class="w3-bar-item w3-button">빅데이터개발</a> 
	  <a href="${path}/model2/board/list.do?code=4" class="w3-bar-item w3-button">네트워크</a> 
	  <a href="${path}/model2/board/list.do?code=5" class="w3-bar-item w3-button">스마트웹</a> 
	  <a href="${path}/model2/board/list.do?code=6" class="w3-bar-item w3-button">빅데이터</a> 
	  <a href="${path}/model2/board/list.do?code=7" class="w3-bar-item w3-button">c샵</a> 
    </div>
  </div>
  <div>
  <br><br><br><br><br><br><br><br><br><br><br><br><br>
    	<p style="color: #CCCCCC"><i class="fa fa-instagram w3-hover-opacity" style="font-size: 20px"></i>&nbsp;mingjini__</p>
    	</div>
</nav>
</body>
<div class="w3-main" style="margin-left:300px">
  <div class="w3-row w3-padding-64">
    <div class="w3-white w3-content w3-center">
    	<decorator:body/>
    </div>
  </div>
</div>
    
<%--
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<table>
	<tr><td colspan="3" align="right">Model2 프로그램 연습</td></tr>
	<tr><td width="15%">
		<a href="${path}/model2/member/main.me">회원관리</a><br>
		<a href="${path}/model2/board/list.do">게시판</a><br>
	</td><td colspan="2" style="text-align: left; vertical-align: top">
		<decorator:body/>
	</td></tr>
	<tr><td colspan="3">구디아카데미 Since 2016</td></tr>		
</table>
</body>
--%>

</html>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core �±� ���� : �ݺ� ����</title>
</head>
<body>
<h3>�ݺ����� �±� : forEach</h3>
<c:forEach var="test" begin="1" end="10" step="2">
	${test}&nbsp;&nbsp;&nbsp;
</c:forEach>
<h3>forEach �±׸� �̿��Ͽ� 1���� 100������ ���� ���ϱ�</h3>
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum+i}"/>
</c:forEach>
1���� 100������ �� : ${sum}
<h3>forEach �±׸� �̿��Ͽ� 2�ܺ��� 9�ܱ����� ������ ����ϱ�</h3>
<c:forEach var="i" begin="2" end="9">
		<h4>${i}��</h4>
	<c:forEach var="j" begin="1" end="9">
		${i} * ${j} = ${i*j} <br>
	</c:forEach>
</c:forEach>
<h3>forEach �±׸� �̿��Ͽ� List ��ü ����ϱ�</h3>
<%
	List<Integer> list = new ArrayList<Integer>();
	for(int i=1;i<10;i++) list.add(i*10);
	pageContext.setAttribute("list", list);
	
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("name","ȫ�浿");
	map.put("today",new Date());
	map.put("age",20);
	pageContext.setAttribute("map",map);
%>
<c:forEach var="i" items="${list}">
	${i}&nbsp;&nbsp;&nbsp;
</c:forEach>

<c:forEach var="i" items="${list}" varStatus="stat">
	<c:if test="${stat.index == 0}">
	<h4>forEach �±��� varStatus �Ӽ� ����</h4>
	</c:if>
	${stat.count}: ${i}<br>
</c:forEach>
<h3>forEach �±׸� �̿��Ͽ� Map ��ü ����ϱ�</h3>
<c:forEach var="m" items="${map}" varStatus="stat">
	${stat.count}: ${m.key}= ${m.value}<br>
</c:forEach>

<h3>EL�� �̿��Ͽ� Map ��ü ����ϱ�</h3>
name= ${map.name}<br>
today= ${map.today}<br>
age= ${map.age}<br>
<c:set var="arr" value="<%=new int[]{10,20,30,40,50} %>"/>
<h3>�迭 ��ü�� ��� ���</h3>
<c:forEach var="s" items="${arr}" varStatus="stat">
	arr[${stat.index}]=${s}<br>
</c:forEach>

<h4>�迭 ��ü�� �ι�° ��Һ��� ����° ��Ҹ� ����ϱ�</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" begin="1" end="2">
	arr[${stat.index}]=${s}<br>
</c:forEach>

<h4>�迭 ��ü�� ¦�� ÷�� �������� ����ϱ�</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" step="2">
	arr[${stat.index}]=${s}<br>
</c:forEach>

<h4>�迭 ��ü�� Ȧ�� ÷�� �������� ����ϱ�</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" step="2" begin="1">
	arr[${stat.index}]=${s}<br>
</c:forEach>
</body>
</html>
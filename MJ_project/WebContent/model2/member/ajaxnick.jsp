<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8"/>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/model2"
	user="model2" password="1234"/>

<sql:query var="rs" dataSource="${conn}">
	select * from member where nick = ?
	<sql:param>${param.nick}</sql:param>
</sql:query>

<c:choose>
	<c:when test="${!empty rs.rows}">
		<c:forEach var="data" items="${rs.rows}">
			<a style="color: red">${param.nick}는 존재하는 닉네임 입니다.</a>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<a style="color: blue">${param.nick}는 사용 가능한 닉네임 입니다.</a>
	</c:otherwise>
</c:choose>

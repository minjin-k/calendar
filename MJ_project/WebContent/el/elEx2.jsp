<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp�� ���ȭ��</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String tel = "010-1111-2222"; 
	pageContext.setAttribute("tel", tel);
	pageContext.setAttribute("test", "pageContext ��ü�� test �Ӽ���");
%>
<h3>jsp�� ��ũ��Ʈ�� �̿��Ͽ� �Ķ���Ϳ� �Ӽ��� ���</h3>
pageContext test �Ӽ��� : <%=pageContext.getAttribute("test") %><br>
session test �Ӽ��� : <%=session.getAttribute("test") %><br>
today �Ӽ��� : <%=session.getAttribute("today") %><br>
name �Ķ���Ͱ� : <%=request.getParameter("name") %><br>
tel ������ : <%=tel %><br>
tel �Ӽ��� : <%=pageContext.getAttribute("tel") %><br> 
noAttribute �Ӽ��� : <%=pageContext.getAttribute("noAttribute") %> <%-- null �� ��� --%>

<h3>jsp�� EL�� �̿��Ͽ� �Ķ���Ϳ� �Ӽ��� ���</h3>
pageContext test �Ӽ��� : ${test }<br>
session test �Ӽ��� : ${sessionScope.test }<br>
today �Ӽ��� : ${today }<br>
name �Ķ���Ͱ� : ${param.name }<br>
tel ������ : EL�� ǥ�� ����<br>
tel �Ӽ��� : ${tel }<br>
noAttribute �Ӽ��� : ${noAttribute}<br> <%-- null��,error �ȳ���. ����. --%>
<%--
	${test} : ���� ��� ��ü�� ����� �Ӽ� �� �̸��� test�� �Ӽ��� ���� ����.
			pageContext < request < session < application
		1. pageContext ��ü�� test �Ӽ��˻�. �����ϸ� �Ӽ��� ����
		2. 1�� �Ӽ��� ������
			request ��ü�� test �Ӽ��˻�. �����ϸ� �Ӽ��� ����
		3. 2�� �Ӽ��� ������
			session ��ü�� test �Ӽ��˻�. �����ϸ� �Ӽ��� ����
		4. 3���� �Ӽ��� ������
			application ��ü�� test �Ӽ� �˻�. �����ϸ� �Ӽ��� ����
		5. 4�� �Ӽ��� ������
			�ƹ��͵� ������� �ʴ´�. null�� ������� ����. �����߻��� ����.
	���� ������� ��ü�� ������ �� �ִ�.
		pageContext ��ü�� �Ӽ� : ${pageScope.test}
		request ��ü�� �Ӽ� : ${requestScope.test}
		session ��ü�� �Ӽ� : ${sessionScope.test}
		application ��ü�� �Ӽ� : ${applicationScope.test}
			
 --%>
</body>
</html>
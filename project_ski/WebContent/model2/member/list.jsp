<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta name="viewsport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<table class="w3-table w3-bordered">
	<caption><h3><b>ȸ�� ���</b></h3></caption>
	<tr><th>���̵�</th><th>�̸�</th><th>�г���</th><th>�̸���</th><th>��ȭ��ȣ</th><th>&nbsp;</th></tr>
	<c:forEach var="m" items="${list}">
	<tr><td>${m.id}</td>
	<td>${m.name}</td>
	<td>${m.nickname }</td>
	<td>${m.email}</td>
	<td>${m.tel}</td>
	<td><a href="../login/updateForm.do?id=${m.id }">[����]</a>
	<c:if test="${m.id != 'admin' }">
		<a href="../login/deleteuser.do?id=${m.id }">[����Ż��]</a>
	</c:if>	
	</td></tr>
	
	</c:forEach>
</table>
</body>
</html>

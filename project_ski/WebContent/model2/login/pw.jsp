<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function pwclick(){
		self.close();
	}
</script>
</head>
<body>
<table>
 <tr><td>��й�ȣ</td><td>${pass}</td></tr>
 <tr><td colspan="2"><input type="submit" value="�ݱ�"
 		onclick="pwclick()"></td></tr>

 </table>
</body>


</html>



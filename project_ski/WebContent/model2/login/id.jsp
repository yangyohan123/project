<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id ã��</title>
<script>
	function idsend(id){
		opener.document.f.id.value=id;
		self.close();
	}
</script>
</head>
<body>
<table>
<tr><th>���̵�</th><td>${id }</td></tr>
<tr><td colspan="2"><input type="submit" value="���̵�����"
	onclick="idsend('${id}')"></td></tr>
</table>
</body>


</html>
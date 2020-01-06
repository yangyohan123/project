<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id 찾기</title>
<script>
	function idsend(id){
		opener.document.f.id.value=id;
		self.close();
	}
</script>
</head>
<body>
<table>
<tr><th>아이디</th><td>${id }</td></tr>
<tr><td colspan="2"><input type="submit" value="아이디전송"
	onclick="idsend('${id}')"></td></tr>
</table>
</body>


</html>
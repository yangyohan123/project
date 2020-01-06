<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewsport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원탈퇴 비밀번호 입력 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function inputcheck(f){
		if(f.pass.value==""){
			alert("비밀번호를 입력해주세요.");
			f.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form action="deleteuser.do" name="f" method="post"
	 onclick="return inputcheck(this)">
<input type="hidden" name="id" value="${param.id }">
<table class="w3-table-all w3-centered">
	<caption>회원 비밀번호 입력</caption>
	<tr><th>비밀번호</th>
		<td><input type="password" name="pw"></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="탈퇴하기"></td></tr>
</table>
</form>
</body>
</html>
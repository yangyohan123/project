<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	function win_open(page){
		var op ="width=500, height=250, oleft=50,top=150";
		open(page+".jsp","",op);
	
	}
	
</script>
<title>로그인</title>
</head>
<body>
<div class="w3-panel w3-border w3-border-blue w3-display-middle w3-card-4" style="width:400px; height:280px;">
	<form  class="w3-container" action="login.do" method="post" name="f">
  	<p>
  	<label>아이디</label>
  	<input class="w3-input" type="text" name="id"></p>
  	<p>
  	<label>비밀번호</label>
 	 <input class="w3-input" type="password" name="pass"></p>
  	<input class="w3-button w3-blue w3-round-xxlarge" style="width:340px;" type="submit" value="로그인">
	<div class="w3-panel w3-padding-large ">
		<a href="#" class="w3-text-blue" onclick="win_open('idForm')">아이디찾기</a>
		<a href="#" class="w3-right w3-text-blue"onclick="win_open('pwForm')">비밀번호찾기</a>
	</div>
	</form>
</div>
</body>
</html>
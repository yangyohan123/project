<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function win_upload(){
		var op = "width=380, height=100,left=50,top=150";
		open("pictureFrom.jsp","",op);

	}
	function cancle_join(){
		location.href="../member/main.do";
	}
	function changepass(f){
		if(f.pass1.value != f.pass2.value){
			alert("비밀번호 다시 확인하세요.");
			f.pass2.value="";
			f.pass2.focus();
			return false;
		}
		
	}
	function idcheck(){
		var id = document.getElementById('id').value;
		window.location.href="checkid.do?id="+id;
		document.f1.submit();
	}
</script>
</head>
<body>
<div class="w3-panel w3-border w3-border-blue w3-display-middle w3-card-4" style="width:400px; height:480px; top:340px;">
	<form class="w3-container" method="post" id="f1" name="f" onsubmit="return changepass(this)">
		<table>
		<input type="hidden" name="picture" value="">
			<tr><td>아이디</td><td><input style="width:160px;"class="w3-input" type="text" id="id" name="id" required></td>
				<td><input type="button" onclick="idcheck();" value="중복확인"></td></tr>
			<tr><td >비밀번호</td><td colspan="2"><input class="w3-input" type="password" name="pass1" required></td></tr>
			<tr><td >비밀번호재확인</td><td colspan="2"><input class="w3-input" type="password" name="pass2" required></td></tr>
			<tr><td >이름</td><td colspan="2"><input class="w3-input" type="text" name="name"></td></tr>
			<tr><td >성별</td><td colspan="2"><select  class="w3-input" id="gender" name="gender" required>
									<option value="1">남자</option>
									<option value="2">여자</option>
								</select></td></tr>
			<tr><td>닉네임</td><td colspan="2"><input class="w3-input" type="text" name="nickname"></td></tr>
			<tr><td>프로필사진</td><td colspan="2"><img class="w3-round-xxlarge" src="" width="90px;" height="80px;" id="profile">
									<a href="javascript:win_upload()">사진등록</a>
									</td>
									</tr>
			<tr><td>이메일</td><td colspan="2"><input class="w3-input" type="text" name="email" required></td></tr>
			<tr><td>전화번호</td><td colspan="2"><input class="w3-input" type="text" name="tel" required></td></tr>
			<tr class="w3-center"><td colspan="2"><input class="w3-button w3-blue w3-round-xxlarge" type="submit" onclick="javascript: this.form.action='join.do'" value="회원가입">
				<input class="w3-button w3-blue w3-round-xxlarge" style="position: absolute;left: 230px;"
					   type="button" onclick="cancle_join()" value="취소"></td></tr>
		</table>
	</form>
</div>
</body>
</html>
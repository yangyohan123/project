<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	function check(){
		f =document.f;
		if(f.email.value==""){
			alert("�̸����� �Է��ϼ���");
			return false;
		}
		if(f.tel.value==""){
			alert("��ȭ��ȣ�� �Է��ϼ���.");
			return false;
		}
		
		
	}
</script>
</head>
<body>
<form action="id.do" name="f" method="post">
	<table class="w3-panel w3-border w3-border-blue w3-display-middle"><caption>���̵�ã��</caption>
		<tr><td>�̸���</td><td><input type="text" id="email" name="email" ></td></tr>
		<tr><td>��ȭ��ȣ</td><td><input type="text" id="tel" name="tel"></td></tr>
		<tr><td colspan="2"><input type="submit" value="���̵�ã��"
				onclick="return check()"></td></tr>
	</table>
</form>
</body>
</html>
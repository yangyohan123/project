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
<title>��й�ȣ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function changepass(f){
		if(f.pw2.value != f.pw3.value){
			alert("���� ��й�ȣ�� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
			f.pw3.value="";
			f.pw3.focus();
			return false;
		}
		
	}
	
	
</script>
</head>
<body>
<form action="changepw.do" name="f" onsubmit="return changepass(this)">
	<input type="hidden" name="id" value="${param.id }"/>
	<table class="w3-table-all w3-centered">
		
		<caption>��й�ȣ ����</caption>
		<tr><th>�����й�ȣ</th><td><input type="password" name="pw1"></td></tr>
		<tr><th>���� �� ��й�ȣ</th><td><input type="password" name="pw2"></td></tr>
		<tr><th>���� �� ��й�ȣ Ȯ��</th><td><input type="password" name="pw3"></td></tr>
		<tr><td colspan="2"><input type="submit" value="�����ϱ�"></td></tr>
	</table>

</form>

</body>
</html>
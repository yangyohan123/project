<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
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
			alert("��й�ȣ �ٽ� Ȯ���ϼ���.");
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
			<tr><td>���̵�</td><td><input style="width:160px;"class="w3-input" type="text" id="id" name="id" required></td>
				<td><input type="button" onclick="idcheck();" value="�ߺ�Ȯ��"></td></tr>
			<tr><td >��й�ȣ</td><td colspan="2"><input class="w3-input" type="password" name="pass1" required></td></tr>
			<tr><td >��й�ȣ��Ȯ��</td><td colspan="2"><input class="w3-input" type="password" name="pass2" required></td></tr>
			<tr><td >�̸�</td><td colspan="2"><input class="w3-input" type="text" name="name"></td></tr>
			<tr><td >����</td><td colspan="2"><select  class="w3-input" id="gender" name="gender" required>
									<option value="1">����</option>
									<option value="2">����</option>
								</select></td></tr>
			<tr><td>�г���</td><td colspan="2"><input class="w3-input" type="text" name="nickname"></td></tr>
			<tr><td>�����ʻ���</td><td colspan="2"><img class="w3-round-xxlarge" src="" width="90px;" height="80px;" id="profile">
									<a href="javascript:win_upload()">�������</a>
									</td>
									</tr>
			<tr><td>�̸���</td><td colspan="2"><input class="w3-input" type="text" name="email" required></td></tr>
			<tr><td>��ȭ��ȣ</td><td colspan="2"><input class="w3-input" type="text" name="tel" required></td></tr>
			<tr class="w3-center"><td colspan="2"><input class="w3-button w3-blue w3-round-xxlarge" type="submit" onclick="javascript: this.form.action='join.do'" value="ȸ������">
				<input class="w3-button w3-blue w3-round-xxlarge" style="position: absolute;left: 230px;"
					   type="button" onclick="cancle_join()" value="���"></td></tr>
		</table>
	</form>
</div>
</body>
</html>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<meta name="viewsport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/715ed26b42.js" crossorigin="anonymous"></script>
<script type="text/javascript">
function ondelete(){
	var con_test = confirm("�Խù��� �����Ͻðڽ��ϱ�?");
	if(con_test == true){
		location.href="delete.do?border_num="+${param.border_num}+"&typenum="+${b.typenum};
		return true;
	}else{
		return false;
	}
}
/*
function replydel(){
	var num = document.getElementById("num").value;
	var border_num = document.getElementById("border_num").value;
	
	$.ajax({
			type :"POST",
			url : "${path}/model2/board/delete1.do",
			data : {
				num : num,
				border_num : border_num
			},
			success : function(data){//�ݹ��Լ�
				
			},
			err : function(e){
				alert("���� ����:" + e.status);
			}
		})

}
*/
</script>
</head>
<body>
<div style="left:50px;">
<%--����--%>
<div class="w3-row w3-container">
  <div class="w3-col s12 w3-margin-left w3-panel w3-border-left w3-border-blue">
			���� : <b>${b.subject }</b>
  </div>
</div>
<hr style="border:solid 0.5px gray; ">

<%--ȸ��(�̹���,�г���) ��ȸ��,��õ��,���--%>
	
	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container">
			<c:if test="${!empty b.profile }">
				<div><img style="width:100px; height:100px;" src="../login/picture/${b.profile }">
				</div>	
			</c:if>
			<c:if test="${empty b.profile }">
				<div><img style="width:100px; height:100px;" src="../login/picture/profile.png">
				</div>
			</c:if>
			<div class="w3-display-topleft" style="left:120px;"><b>${b.nickname }</b></div>
  			<div class="w3-display-topright"><b>��ȸ��:${b.views }</b><b>��õ��:${b.cnt }</b><b>��ۼ�:${recnt }</b></div>
  		</div>
	</div>
	
<hr style="border:solid 0.5px gray;">

<%--����, ��õ��ư --%>
	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container">
			<c:set var="con1" value="${fn:replace(b.content,'&lt;','<' )}"/>
			<c:set var="con2" value="${fn:replace(con1,'&gt;','>' )}"/>
			<c:set var="con3" value="${fn:replace(con2,'<iframe ','<iframe width=500 height=350')}"/>
			<div>${fn:replace(con3,'&quot;','"')}</div>
			
		</div>
		
	</div>

<hr style="border:solid 0.5px gray;">

	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container">
			<div class="w3-display-left">
				<b>÷������</b>
				<c:if test="${!empty b.file}">
					<a href="../login/picture/${b.file }" download>${b.file }</a>
				</c:if>
			
			</div>
			<div class="w3-display-right">
			<c:if test="${sessionScope.login == 'admin' || sessionScope.login == b.id }">
				<a class="w3-text-blue" href="updateForm.do?border_num=${b.border_num }">[����]</a>
				<a class="w3-text-blue" onclick="ondelete()">[����]</a>
			</c:if>
			<a class="w3-text-blue" href="list.do?typenum=${b.typenum }">[���]</a>
			</div>
		</div>
	</div><br><br>
	<form name="f1" method="post">
	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container w3-center">
  			<i class="fa fa-thumbs-o-up" style="font-size:20px;color:red"></i><input class="w3-button w3-red w3-round-xxlarge" style=""type="button" onclick="javascript: this.form.action='recommend.do?border_num=${b.border_num}';this.form.submit()" value="��õ">
  		</div>
  		
  	</div>
  	</form>
	<br>
	
<%--��� --%>
	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container">
			<div><b>comments</b></div>
				<table class="w3-table w3-bordered" style="width:100%;">
				
				<c:forEach var="c" items="${list}">
					
					<tr>
					<c:if test="${!empty c.profile}">
					<td style="width:5%;"><img style="width:60px; height:60px;" src="../login/picture/${c.profile}"></td>
					</c:if>
					<c:if test="${empty c.profile }">
					<td style="width:5%;"><img style="width:50px; height:50px;" src="../login/picture/profile.png"> </td>
					</c:if>
					<td style="width:15%;">${c.nickname }</td>
					<td style="width:60%;">${c.content }</td>
					<c:if test="${sessionScope.login == 'admin' || sessionScope.login == c.id}">
						<td style="width:20%"><a class="w3-text-blue" href="delete1.do?num=${c.num }&border_num=${c.border_num}">����</a></td>
					</c:if>
					</tr>
					</c:forEach>
				
				
				</table>
		</div>
	</div>
	<br><br>
<%--���â --%>
	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container">
			<form action="reply.do" method="post">
				<input type="hidden" name="id" value="${mem.id }">
				<input type="hidden" name="nickname" value="${mem.nickname }">
				<input type="hidden" name="profile1" value="${mem.profile }">
				<input type="hidden" name="typenum" value="${b.typenum }">
				<input type="hidden" name="border_num" value="${b.border_num }">
				<div class="w3-display-left">
					<textarea style="width:700px; height:70px; " placeholder="����ۼ�" name="content"></textarea>
				</div>
				<div class="w3-display-right">	
					<input  class="w3-button w3-blue w3-round-xxlarge" style="width:180px; height:70px;" type="button" onclick="this.form.submit()" value="���">
				</div>
			</form>
		</div>
	</div>
</div>	
<br><br><br>
	
</body>
</html>
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
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="../../css/main.css">
<meta name="viewsport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/715ed26b42.js" crossorigin="anonymous"></script>
<script type="text/javascript">
function ondelete(){
	var con_test = confirm("게시물을 삭제하시겠습니까?");
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
			success : function(data){//콜백함수
				
			},
			err : function(e){
				alert("서버 오류:" + e.status);
			}
		})

}
*/
</script>
</head>
<body>
<div style="left:50px;">
<%--제목--%>
<div class="w3-row w3-container">
  <div class="w3-col s12 w3-margin-left w3-panel w3-border-left w3-border-blue">
			제목 : <b>${b.subject }</b>
  </div>
</div>
<hr style="border:solid 0.5px gray; ">

<%--회원(이미지,닉네임) 조회수,추천수,댓글--%>
	
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
  			<div class="w3-display-topright"><b>조회수:${b.views }</b><b>추천수:${b.cnt }</b><b>댓글수:${recnt }</b></div>
  		</div>
	</div>
	
<hr style="border:solid 0.5px gray;">

<%--내용, 추천버튼 --%>
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
				<b>첨부파일</b>
				<c:if test="${!empty b.file}">
					<a href="../login/picture/${b.file }" download>${b.file }</a>
				</c:if>
			
			</div>
			<div class="w3-display-right">
			<c:if test="${sessionScope.login == 'admin' || sessionScope.login == b.id }">
				<a class="w3-text-blue" href="updateForm.do?border_num=${b.border_num }">[수정]</a>
				<a class="w3-text-blue" onclick="ondelete()">[삭제]</a>
			</c:if>
			<a class="w3-text-blue" href="list.do?typenum=${b.typenum }">[목록]</a>
			</div>
		</div>
	</div><br><br>
	<form name="f1" method="post">
	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container w3-center">
  			<i class="fa fa-thumbs-o-up" style="font-size:20px;color:red"></i><input class="w3-button w3-red w3-round-xxlarge" style=""type="button" onclick="javascript: this.form.action='recommend.do?border_num=${b.border_num}';this.form.submit()" value="추천">
  		</div>
  		
  	</div>
  	</form>
	<br>
	
<%--댓글 --%>
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
						<td style="width:20%"><a class="w3-text-blue" href="delete1.do?num=${c.num }&border_num=${c.border_num}">삭제</a></td>
					</c:if>
					</tr>
					</c:forEach>
				
				
				</table>
		</div>
	</div>
	<br><br>
<%--댓글창 --%>
	<div class="w3-row w3-container">
  		
  		<div class="w3-col s12 w3-margin-left w3-display-container">
			<form action="reply.do" method="post">
				<input type="hidden" name="id" value="${mem.id }">
				<input type="hidden" name="nickname" value="${mem.nickname }">
				<input type="hidden" name="profile1" value="${mem.profile }">
				<input type="hidden" name="typenum" value="${b.typenum }">
				<input type="hidden" name="border_num" value="${b.border_num }">
				<div class="w3-display-left">
					<textarea style="width:700px; height:70px; " placeholder="댓글작성" name="content"></textarea>
				</div>
				<div class="w3-display-right">	
					<input  class="w3-button w3-blue w3-round-xxlarge" style="width:180px; height:70px;" type="button" onclick="this.form.submit()" value="등록">
				</div>
			</form>
		</div>
	</div>
</div>	
<br><br><br>
	
</body>
</html>
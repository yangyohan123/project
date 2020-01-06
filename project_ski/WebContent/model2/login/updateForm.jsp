<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script >
	function win_upload(){
	var op = "width=380, height=100,left=50,top=150";
	open("pictureFrom.jsp","",op);

	}
	function changepass(){
		<c:choose>
			<c:when test="${sessionScope.login == m.id || sessionScope.login == 'admin'}">
				var op = "width=500, height=180, left=50, top=150";
				open("chpwForm.jsp?id=${m.id}","",op);
			</c:when >
			<c:otherwise>
				alert("본인만 가능합니다.");
			</c:otherwise>
		</c:choose>
		
	}
	function delete_profile(){
		document.f.picture.value="profile.png";
		document.getElementById("profile").src="picture/profile.png";
	}
	function userDelete(){
		<c:choose>
			<c:when test="${sessionScope.login == m.id}">
				var op = "width=500, height=130, left=50, top=150";
				open("deleteForm.jsp?id=${m.id}","",op);
			</c:when >
			<c:otherwise>
				alert("본인만 가능합니다.");
			</c:otherwise>
		</c:choose>
		
	}
	
</script>
</head>
<body>
<form
	  class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin w3-display-middle"
	  name="f" method="post" style="width: 450px;text-align: center;">
<h2 class="w3-center">회원정보수정</h2>

<%--사진업로드파일이름저장 --%>
<input type="hidden" name="picture" value="${empty m.profile?'	':m.profile }">
<input type="hidden" name="id" value="${m.id }">
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border"  type="text" value="${m.id }" disabled>
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="nickname" type="text" value="${m.nickname}" placeholder="nickname">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user-circle-o"></i></div>
	<div class="w3-rest" style="text-align:left;">
		<img class="w3-round-xxlarge" src="picture/${m.profile }" width="100" height="100" id="profile">
		
		<div style="position: absolute;left: 175px;bottom: 39%;">
			<a href="javascript:win_upload()">프로필등록</a>
			
		</div>
		<div style="position: absolute; left:260px; bottom: 39%;">
			<a href="javascript:delete_profile()">프로필삭제</a>
			
		</div>						
	</div>
</div>
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="email" type="text" value="${m.email }" placeholder="Email">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="tel" type="text" value="${m.tel }" placeholder="Phone">
    </div>
</div>



<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" 
		style="width:150px;"
		onclick="javacript: f.action='update.do?';document.f.submit()">회원정보수정</button>

<c:if test="${m.id != 'admin' and login != 'admin'}">
<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" 
		style="width: 150px;left: 180px;position: absolute;bottom: 0px;"
		onclick="changepass()">비밀번호변경</button>
</c:if>
<c:if test="${login == 'admin' }">
<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" 
		style="width: 150px;left: 174px;position: absolute;bottom: 0px;"
		onclick="changepass()">비밀번호변경</button>
</c:if>

<c:if test="${m.id != 'admin' and login != 'admin'}">
<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" 
		style="width: 70px;position: absolute;left: 350px;bottom: 0px;"
		onclick="userDelete()">탈퇴</button>
</c:if>
<c:if test="${login == 'admin' }">
<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" 
		style="width: 103px;position: absolute;left: 331px;bottom: 0px;"
		onclick="javascript: f.action='../member/list.do?id=${login}';document.f.submit()">되돌아가기</button>
</c:if>
</form>
</body>
</html>

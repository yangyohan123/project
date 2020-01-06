<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<core:set var="path" value="${ pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="EUC-KR">
<%-- <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.skilogo{
	width : 150px;
	height : 80px;

}


#title{
	
	height : 80px;
}
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
</style>
<decorator:head/>

<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-row">
 <div class="w3-col l3 m6 s4 w3-white w3-center">
  <a href="../member/main.do"><img src="../../img/skilogo.jpg" class="skilogo"></a>
 </div>
 <div class="w3-col l7 m3 s4 w3-dark-grey w3-center" id="title">
	<div class="w3-large"><label style="font-size:50px;">ski club </label> </div>
 </div>
  <div class="w3-col l2 m3 s4 w3-red">
 	<core:if test="${empty sessionScope.login}">
 	<div  style="height:80px;" class="w3-right-align w3-padding-large">
 		<a href="../login/loginForm.do">로그인</a>&nbsp;&nbsp;<a href="../login/joinForm.do">회원가입</a>
 	</div>
 	</core:if>
 	<core:if test="${!empty sessionScope.login}">
 	<core:choose>
 	<core:when test="${sessionScope.login eq 'admin' }">
 		<div  style="height:80px;" class="w3-right-align w3-row w3-container">
	 		<div class="w3-display-container">
	 			<div>
	 				<img class="w3-round-xxlarge" style="width:50px; height:50px;position: absolute; right: 60%; top:5%;" src="../login/picture/${mem.profile }">
	 			</div>
	 			<div style="top: 55px; left: 13%; position: absolute;">
	 				<b>${mem.nickname }</b>
	 			</div>
	 			<div style="position: relative; top: 5px;">
	 				<a href="logout.do">로그아웃</a>
	 			</div>
	 			<div style="top: 10px;position: relative;">
	 				<a href="../member/list.do?id="+${mem.id}>회원관리</a>
	 			</div>
	 		</div>
	 	</div>
 	</core:when>
 	<core:otherwise>
	 	<div  style="height:80px;" class="w3-right-align w3-row w3-container">
	 		<div class="w3-display-container">
	 			<div>
	 				<img class="w3-round-xxlarge" style="width:50px; height:50px;position: absolute; right: 60%; top:5%;" src="../login/picture/${mem.profile }">
	 			</div>
	 			<div style="top: 55px; left: 13%; position: absolute;">
	 				<b>${mem.nickname }</b>
	 			</div>
	 			<div style="position: relative; top: 5px;">
	 				<a href="logout.do">로그아웃</a>
	 			</div>
	 			<div style="top: 10px;position: relative;">
	 				<a href="${path }/model2/login/updateForm.do?id=${mem.id}">정보수정</a>
	 			</div>
	 		</div>
	 	</div>
 	</core:otherwise>
 	</core:choose>
 	</core:if>
 </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
		
      
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    
    <div>
    <decorator:body />
    </div>
      
      
     
     
      
    <!-- End Middle Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->

 
<script>
// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</body>
</html> 

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main창</title>
<style>
	.img{
		    position: absolute;
   		    width: 15%;
    		height: 35%;
   	}
	.img2{
		width:100%;
		height: 100%;
		position: absolute;
	}
</style>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div class="w3-row w3-container">
  <h2>게시판</h2>
  <hr>
  <div class="w3-col s6 w3-center">
    <table class="w3-table-all w3-card-4" id="board1"><caption><b>공지사항 게시판<b></b><a class="w3-text-blue" href="../board/list.do?typenum=1" style="float: right;">자세히</a></caption>
    <c:if test="${boardcnt1 == 0 }">
    	<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
    </c:if>
    <c:if test="${boardcnt1>0 }">
    	<tr><th>번호</th><th>분류</th><th>제목</th>
    		<th>작성자</th><th>등록일</th></tr>
 
    	<c:forEach var="b" items="${list1 }" varStatus="status">
    		<tr><td>${boardcnt1 - status.index}</td>
   				<td>
   				${b.thema}
   				</td>
   				<td style="text-align: left">${fn:substring(b.subject,0,5)}...</td>
   				<td>${b.name }</td>
  				<td><fmt:formatDate value="${b.date }" pattern="yyyy.MM.dd"/></td>
  			</tr>
     	</c:forEach>	
    </c:if>
    </table>
  </div>
  <div class="w3-col s6 w3-center ">
     <table class="w3-table-all w3-card-4" id="board2"><caption><b>보드/스키 게시판<b></b><a class="w3-text-blue" href="../board/list.do?typenum=2" style="float: right;">자세히</a></caption>
    <c:if test="${boardcnt2 == 0 }">
    	<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
    </c:if>
    <c:if test="${boardcnt2>0 }">
    	<tr><th>번호</th><th>분류</th><th>제목</th>
    		<th>작성자</th><th>등록일</th></tr>
    
    	<c:forEach var="b" items="${list2 }" varStatus="status">
    		<tr><td>${boardcnt2 - status.index}</td>
   				<td>
   				${b.thema}
   				</td>
   				<td style="text-align: left">${fn:substring(b.subject,0,5)}...</td>
   				<td>${b.name }</td>
  				<td><fmt:formatDate value="${b.date }" pattern="yyyy.MM.dd"/></td>
  			</tr>
     	</c:forEach>	
    </c:if>
    </table>
  </div>
</div><br><hr><br>
<div class="w3-row w3-container">
  
  <div class="w3-col s6 w3-center">
    <table class="w3-table-all w3-card-4" id="board3"><caption><b>스키장/후기 게시판<b></b><a class="w3-text-blue" href="../board/list.do?typenum=3" style="float: right;">자세히</a></caption>
    <c:if test="${boardcnt3 == 0 }">
    	<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
    </c:if>
    <c:if test="${boardcnt3>0 }">
    	<tr><th>번호</th><th>분류</th><th>제목</th>
    		<th>작성자</th><th>등록일</th></tr>
    	<c:set var="num3" value="0"/>
    	<c:forEach var="b" items="${list3 }" varStatus="status">
    		<tr><td>${boardcnt3 - status.index }</td>
   				<td>
   				${b.thema }
   				</td>
   				<td style="text-align: left">${fn:substring(b.subject,0,5)}...</td>
   				<td>${b.name }</td>
  				<td><fmt:formatDate value="${b.date }" pattern="yyyy.MM.dd"/></td>
  			</tr>
     	</c:forEach>	
    </c:if>
    </table>
  </div>
  <div class="w3-col s6 w3-center">
     <table class="w3-table-all w3-card-4" id="board4"><caption><b>동영상 게시판<b></b><a class="w3-text-blue" href="../board/list.do?typenum=4" style="float: right;">자세히</a> </caption>
    <c:if test="${boardcnt4 == 0 }">
    	<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
    </c:if>
    <c:if test="${boardcnt4>0 }">
    	<tr><th>번호</th><th>분류</th><th>제목</th>
    		<th>작성자</th><th>등록일</th></tr>
    	<c:set var="num4" value="0"/>
    	<c:forEach var="b" items="${list4 }" varStatus="status">
    		<tr><td>${boardcnt4 - status.index}</td>
   				<td>
   				${b.thema}
   				</td>
   				<td style="text-align: left">${fn:substring(b.subject,0,5)}...</td>
   				<td>${b.name }</td>
  				<td><fmt:formatDate value="${b.date }" pattern="yyyy.MM.dd"/></td>
  			</tr>
     	</c:forEach>	
    </c:if>
    </table>
  </div>
</div>
<br><br>
<div class="w3-row w3-container">
  
  <div class="w3-col s12 w3-center">
  
  		<b>갤러리게시판<a class="w3-text-blue" href="../board/list.do?typenum=5" style="float: right;">자세히</a></b> 
  		<br><br><br>
  		<c:if test="${boardcnt5 == 0 }">
    		<tr><td colspan="5" style="right:20px;">등록된 게시글이 없습니다.</td></tr>
   	 	</c:if>
   	 	<c:if test="${boardcnt5>0 }">
	  		<c:forEach var="b" items="${list5}" varStatus="stat" step="4">
	  		<c:if test="${list5[stat.index].file != null }">
	  		<div class="img" style="" >
	  			<img src="../login/picture/${list5[stat.index].file}" class="img2" style="left:0%">
	  			</div>
	  		</c:if>
	  		<c:if test="${list5[stat.index+1].file != null }">
	  		<div class="img">
	  			<img src="../login/picture/${list5[stat.index+1].file}" class="img2" style="left:123%">
	  			</div>
	  		</c:if>
	  		<c:if test="${list5[stat.index+2].file != null }">
	  		<div class="img">
	  			<img src="../login/picture/${list5[stat.index+2].file}" class="img2" style="left:246%">
	  			</div>
	  		</c:if>
	  		<c:if test="${list5[stat.index+3].file != null }">
	  		<div class="img">
	  			<img src="../login/picture/${list5[stat.index+3	].file}" class="img2" style="left:369%">
	  		</div>
	  		</c:if>
	  		</c:forEach>
	  	</c:if>
  </div>
  
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
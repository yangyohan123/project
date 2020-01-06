<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 목록 보기</title>
 <meta name="viewsport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
</head>
<body>
<form name="f1"  action="list.do?typenum=${typenum}" method="post">
<input type="hidden" name="thema" id="thema" value="">
<c:choose>
	<c:when test="${typenum =='2' }">&nbsp;&nbsp;<button class="w3-button w3-blue w3-round-large w3-large" value="home" onclick="document.f1.thema.value=this.value;document.f1.submit()"><i class="fa fa-home"></i></button>
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="보드" onclick="document.f1.thema.value=this.value;document.f1.submit()" >
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="스키" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button"  value="장비" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="정보" onclick="document.f1.thema.value=this.value;document.f1.submit()">
	</c:when>
	<c:when test="${typenum =='3' }">&nbsp;&nbsp;<button class="w3-button w3-blue w3-round-large w3-large" value="home" onclick="document.f1.thema.value=this.value;document.f1.submit()"><i class="fa fa-home"></i></button>
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="해외" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="휘닉스" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="용평" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="스타힐" onclick="document.f1.thema.value=this.value;document.f1.submit()">
			 						 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="비발디" onclick="document.f1.thema.value=this.value;document.f1.submit()">
			 						 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="웰리힐리파크" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="기타" onclick="document.f1.thema.value=this.value;document.f1.submit()">	
    </c:when>
	<c:when test="${typenum =='4' }">&nbsp;&nbsp;<button class="w3-button w3-blue w3-round-large w3-large" value="home" onclick="document.f1.thema.value=this.value;document.f1.submit()"><i class="fa fa-home"></i></button>
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="스킬기술" onclick="document.f1.thema.value=this.value;document.f1.submit()">
				 					 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="보드팁" onclick="document.f1.thema.value=this.value;document.f1.submit()"> 
				 					 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="스키팁" onclick="document.f1.thema.value=this.value;document.f1.submit()">
	</c:when>
	<c:otherwise>
				<c:if test="${typenum==5 }">	
		 							 &nbsp;&nbsp;<button class="w3-button w3-blue w3-round-large w3-large" value="home" onclick="document.f1.thema.value=this.value;document.f1.submit()"><i class="fa fa-home"></i></button>
		 							 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="갤러리" onclick="document.f1.thema.value=this.value;document.f1.submit()">
				</c:if>
	</c:otherwise>
</c:choose>
</form><br><br>
<%--공지사항, 정보/컬럼, 스키장/후기, 동영상 --%>
<c:if test="${typenum < 5 }">
<table class="w3-table w3-bordered">
<c:choose>
	<c:when test="${typenum =='1' }"><caption>공지사항 게시판</caption></c:when>
	<c:when test="${typenum =='2' }"><caption>보드/스키 게시판</caption></c:when>
	<c:when test="${typenum =='3' }"><caption>스키장/후기 게시판</caption></c:when>
	<c:otherwise><caption>동영상 게시판</caption></c:otherwise>
</c:choose>
<c:if test="${boardcnt == 0}">
	<tr><td colspan="7" style="text-align:center;">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcnt >0 }">
<tr><td colspan="7" style="text-align:right">글개수:${boardcnt}</td></tr>
<tr><th width="8%">번호</th><th width="12%">분류</th><th width="38%">제목</th>
   <th width="14%">닉네임</th><th width="12%">등록일</th>
   <th width="8%">조회수</th><th width="8%">추천수</th></tr>
<%-- 각각 항목에 맞는 데이터를 for구문 list를 통해 나타냄 --%>
<c:forEach var="b" items="${list }" varStatus="status">
<tr><td>${boardcnt - (((pageNum-1) * 10)+ status.index) }</td>
	<td>${b.thema }</td>
	<c:set var="bordernum" value="${border_num - 1 }"/>
	<td style="text-align: left">
   <a href="info.do?border_num=${b.border_num }" >${b.subject }</a>
   </td>
   <td>${b.nickname }</td>
   	<td><fmt:formatDate value="${b.date }" pattern="yyyy.MM.dd"/></td>
   <td>${b.views }</td>
   <td>${b.cnt }</td>
   </tr>
  
   </c:forEach>
   <tr><td colspan="7" style="text-align: center;">
   	<%-- 현재 페이지가 1보다 작거나 같으면 하이퍼링크 없는 [이전]을 나타내고
   		 1보다 크면 이전페이지로 하이퍼링크를 건 [이전]을 보여줌 --%>
      <c:if test="${pageNum <= 1 }"><b>&laquo;</b></c:if>
      <c:if test="${pageNum > 1 }">
      <a  href="list.do?typenum=${typenum}&pageNum=${pageNum -1 }"><b>&laquo;</b></a>
      </c:if>
      <%--처음페이지에서 마지막페이지까지 for구문돌림
      	  만약 a가 현재페이지와 같으면 하이퍼링크 없는 현재페이지를 나타내고
      	 만약 a와 현재페이지가 같지 않으면 원하는 페이지로 갈 수 있는 하이퍼링크 건 페이지를 보여줌 --%>
      <c:forEach var="a" begin="${startpage }" end="${endpage }">
      	<c:if test="${a==pageNum }"><b>[${a }]</b></c:if>
      	<c:if test="${a!=pageNum }">
      		<a  href="list.do?typenum=${typenum}&pageNum=${a }"><b>[${a }]</b></a>
      	</c:if>
      </c:forEach>
         <%-- 현재페이지가 최종페이지보다 크거나 같으면 [다음]을 찍고 
         	   최종페이지보다 작으면 다음페이지로 하이퍼링크를 건 [다음]을 보여줌 --%>
         <c:if test="${pageNum >= maxpage }"><b>&raquo;</b></c:if>
         <c:if test="${pageNum < maxpage }">
            <a href="list.do?typenum=${typenum }&pageNum=${pageNum + 1 }"><b>&raquo;</b></a>
         </c:if>
      
         </td></tr>
      </c:if>
      <tr>
      <c:if test="${!empty sessionScope.login  }">
      <td colspan="4" style="text-align:left">
      	<form action="list.do?typenum=${param.typenum }" method="post" name="sf">
      		<input type="hidden" name="pageNum" value="1">
      		<select name="column" style="height:36px;">
      			<option value="">선택하세요</option>
      			<option value="name">이름</option>
      			<option value="nickname">닉네임</option>
      			<option value="title">제목</option>
      			<option value="content">내용</option>
      			<option value="title,content">제목 + 내용</option>
      		</select>
      		<script type="text/javascript">document.sf.column.value = "${param.column}"</script>
      		<input type="text" placeholder="Search.." name="find" value="${param.find }" style="width:30%; height:36px;">
      		<button class="w3-button w3-blue w3-round-large" type="submit"><i class="fa fa-search"></i></button>
      	</form>
      </td>
      <c:if test="${sessionScope.login == 'admin' or typenum == 2 or typenum == 3 or typenum == 4 or typenum == 5}">
        <td colspan="3" style="text-align:right">
		<a class="w3-text-blue" href="writeForm.do?typenum=${typenum }">글쓰기</a></td>
	  </c:if>	      	
         
        
       </c:if>
       
       <c:if test="${empty sessionScope.login }">
       	<td colspan="7" style="text-align:left">
       		<form action="list.do?typenum=${param.typenum }" method="post" name="sf">
      		<input type="hidden" name="pageNum" value="1">
      		<select name="column" style="height:36px;">
      			<option value="">선택하세요</option>
      			<option value="name">이름</option>
      			<option value="nickname">닉네임</option>
      			<option value="title">제목</option>
      			<option value="content">내용</option>
      			<option value="title,content">제목 + 내용</option>
      		</select>
      		<script type="text/javascript">document.sf.column.value = "${param.column}"</script>
      		<input type="text" placeholder="Search.." name="find" value="${param.find }" style="width:30%; height:36px;">
      		<button class="w3-button w3-blue w3-round-large" type="submit"><i class="fa fa-search"></i></button>
      	</form>
       	</td>
       
       	
       </c:if>
       </tr>
       
</table>
</c:if>

<%--갤러리게시판 --%>
<c:if test="${typenum==5}">
	
	<%--제목 --%>
	<div class="w3-row w3-container">
  
  		<div class="w3-col s12 w3-center">
  			<b>갤러리게시판</b>
  		</div>
  	</div>
	
	<%-- 게시판 내용 --%>
	<div class="w3-row w3-container">
  
  		<div class="w3-col s12 w3-center">
  			<c:if test="${boardcnt == 0}">
				<tr><td colspan="7" style="text-align:center;">등록된 게시글이 없습니다.</td></tr>
			</c:if>
			<c:if test="${boardcnt > 0 }">
			<c:forEach var="b" items="${list}" varStatus="stat" step="4">
	  		<c:if test="${list[stat.index].file != null }">
		  		<div class="img">
		  			<a href="info.do?border_num=${list[stat.index].border_num }"><img src="../login/picture/${list[stat.index].file}" class="img2" style="left:0%; top:${60+(stat.index/4*300)}px;"></a>
		  		</div>
		  		<div style="position:absolute; left:33%; top:${470+(stat.index/4*300)}px;">
		  			<b>${list[stat.index].subject }</b>&nbsp;<b class="w3-text-red">${list[stat.index].cnt}</b>
		  		</div>
	  		</c:if>
	  		<c:if test="${list[stat.index+1].file != null }">
		  		<div class="img">
		  			<a href="info.do?border_num=${list[stat.index+1].border_num }"><img src="../login/picture/${list[stat.index+1].file}" class="img2" style="left:123%; top:${60+(stat.index/4*300)}px;"></a>
		  		</div>
		  		<div style="position:absolute; left:51%; top:${470+(stat.index/4*300)}px;">
		  			<b>${list[stat.index+1].subject }</b>&nbsp;<b class="w3-text-red">${list[stat.index+1].cnt}</b>
		  		</div>
	  		</c:if>
	  		<c:if test="${list[stat.index+2].file != null }">
		  		<div class="img">
		  			<a href="info.do?border_num=${list[stat.index+2].border_num }"><img src="../login/picture/${list[stat.index+2].file}" class="img2" style="left:246%; top:${60+(stat.index/4*300)}px;"></a>
		  		</div>
		  		<div style="position: absolute; left:69%; top:${470+(stat.index/4*300)}px;">
		  			<b>${list[stat.index+2].subject }</b>&nbsp;<b class="w3-text-red">${list[stat.index+2].cnt}</b>
		  		</div>
	  		</c:if>
	  		<c:if test="${list[stat.index+3].file != null }">
		  		<div class="img">
		  			<a href="info.do?border_num=${list[stat.index+3].border_num }"><img src="../login/picture/${list[stat.index+3].file}" class="img2" style="left:369%; top:${60+(stat.index/4*300)}px;"></a>
		  	</div>
		  	<div style="position:absolute; left:88%; top:${470+(stat.index/4*300)}px;">
		  		<b>${list[stat.index+3].subject }</b>&nbsp;<b class="w3-text-red">${list[stat.index+3].cnt}</b>
		  	</div>
	  		</c:if>
	  	    </c:forEach>
			</c:if>
		</div>
  	</div>
 

<%-- 페이징 기능 --%>
 <div class="w3-row w3-container">
  
  		<div class="w3-col s12 w3-center w3-display-bottommiddle" style="position:absolute; top:1125px; left : 62.5%">
	
	      <c:if test="${pageNum <= 1 }"><b>&laquo;</b></c:if>
	      <c:if test="${pageNum > 1 }">
	      <a  href="list.do?typenum=${typenum}&pageNum=${pageNum -1 }"><b>&laquo;</b></a>
	      </c:if>
	      <c:forEach var="a" begin="${startpage }" end="${endpage }">
	      	<c:if test="${a==pageNum }"><b>[${a }]</b></c:if>
	      	<c:if test="${a!=pageNum }">
	      		<a href="list.do?typenum=${typenum}&pageNum=${a }"><b>[${a }]</b></a>
	      	</c:if>
	      	</c:forEach>
	         <c:if test="${pageNum >= maxpage }"><b>&raquo;</b></c:if>
	         <c:if test="${pageNum < maxpage }">
	            <a href="list.do?typenum=${typenum }&pageNum=${pageNum + 1 }"><b>&raquo;</b></a>
	         </c:if>
         
      	</div>
  </div>
  
  <%-- 검색  및 글쓰기 --%>
   <div class="w3-row w3-container">
  
  		<div class="w3-col s12 w3-center w3-display-bottommiddle" style="position:absolute; top:1200px; left : 65%">
  	
  	  <%-- 로그인 되었을 시 --%>
      <c:if test="${!empty sessionScope.login  }">
 		<%--검색 --%>
 		<div style="float:left; margin-left:30%;">
      	<form action="list.do?typenum=${param.typenum }" method="post" name="sf">
      		<input type="hidden" name="pageNum" value="1">
      		<select name="column" style="height:36px;">
      			<option value="">선택하세요</option>
      			<option value="name">이름</option>
      			<option value="nickname">닉네임</option>
      			<option value="title">제목</option>
      			<option value="content">내용</option>
      			<option value="title,content">제목 + 내용</option>
      		</select>
      		<script type="text/javascript">document.sf.column.value = "${param.column}"</script>
      		<input type="text" placeholder="Search.." name="find" value="${param.find }" style="width:300px; height:36px;">
      		<button class="w3-button w3-blue w3-round-large" type="submit"><i class="fa fa-search"></i></button>
      	</form>
      	</div>
      	
      	<%--글쓰기 --%>
      	<div style="float:left; margin-left:12%; width:45px; ">
     		<label ><a class="w3-text-blue" href="writeForm.do?typenum=${typenum }">글쓰기</a></label>
      	</div>
       </c:if>
       </div>
       <%-- 로그인 안되어 있을 시 --%>
       <c:if test="${empty sessionScope.login }">
       	
       		<form action="list.do?typenum=${param.typenum }" style="position: absolute;top: 1200px; left:600px; width:500px;" 
       		      method="post" name="sf">
      		<input type="hidden" name="pageNum" value="1">
      		<select name="column" style="height:36px;">
      			<option value="">선택하세요</option>
      			<option value="name">이름</option>
      			<option value="nickname">닉네임</option>
      			<option value="title">제목</option>
      			<option value="content">내용</option>
      			<option value="title,content">제목 + 내용</option>
      		</select>
      		<script type="text/javascript">document.sf.column.value = "${param.column}"</script>
      		<input type="text" placeholder="Search.." name="find" value="${param.find }" style="width:50%; height:36px;">
      		<button class="w3-button w3-blue w3-round-large" type="submit"><i class="fa fa-search"></i></button>
      	</form>
      
       
       	
       </c:if>
  	 </div>
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
 </c:if>	
 
</body>
</html>
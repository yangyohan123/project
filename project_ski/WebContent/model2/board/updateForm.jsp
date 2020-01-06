<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<title>게시판 글쓰기</title>
<head>
<meta charset="EUC-KR">
<meta name="viewsport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" 
 src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js" charset="euc-kr"></script>
<script type = "text/javascript" src = "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
</style>
<script>
	function file_delete(){
		document.f.file2.value="";
		file_desc.style.display="none";
	}
</script>

</head>
<body>

<form method="post" enctype="multipart/form-data" id="frm" name="f">
   	<div style="left:50px; background-color:#DCDCDC">
   		<input type="hidden" name="typenum" value="${b.typenum }">
   		<input type="hidden" name="id" value="${mem.id }">
   		<input type="hidden" name="name" value="${mem.name }">
   		<input type="hidden" name="nickname" value="${mem.nickname }">
   		<input type="hidden" name="profile" value="${mem.profile }">
   		<input type="hidden" name="border_num" value="${b.border_num}">
   		<input type="hidden" name="file2" value="${empty b.file?'':b.file}">
		
   		<%--분류 및 제목 --%>
   		<div class="w3-row w3-container">
 			 <div class="w3-col s12 w3-margin-left w3-display-container">
 			 	
 			 	<%-- 분류입력란. --%>
 			 	<table>
	 			 <tr><td><select style="width:200px;" name="thema" id = "selectList">
	 			 		<option>분류</option>
	 			 		<c:choose>
	 			 			<c:when test="${b.typenum==1 }">
	 			 				<option>공지사항</option>
	 			 			</c:when>
	 			 			<c:when test="${b.typenum==2 }">
	 			 				<option value="보드">보드</option>
	 			 				<option value="스키">스키</option>
	 			 				<option value="장비">장비</option>
	 			 				<option value="정보">정보</option>
	 			 			</c:when>
	 			 			<c:when test="${b.typenum==3 }">
	 			 				<option value="해외">해외</option>
	 			 				<option value="휘닉스">휘닉스</option>
	 			 				<option value="용평">용평</option>
	 			 				<option value="스타힐">스타힐</option>
	 			 				<option value="대명비발디">대명비발디</option>
	 			 				<option value="웰리힐리파크">웰리힐리파크</option>
	 			 				<option value="기타">기타</option>
	 			 
	 			 			</c:when>
	 			 			<c:when test="${b.typenum == 4 }">
	 			 				<option value="유튜브동영상">유튜브동영상</option>
	 			 				<option value="스킬기술">스킬기술</option>
	 			 				<option value="스킹팁">스킹 팁</option>
	 			 			</c:when>
	 			 			<c:otherwise>
	 			 				<option value="갤러리">갤러리</option>
	 			 			</c:otherwise>
	 			 		</c:choose>
	 			 	</select>
	 			 	<%-- 제목입력란. --%>
	 			 	</td><td><input type="text" style="width:670px;" name="subject" placeholder="제목" value="${b.subject }"></td></tr>
 				 </table>
 				 <hr>
 			</div>
  	 	</div>
 				 
 		<%-- 내용입력란. --%>
 		<div class="w3-row w3-container">
 			<div class="w3-col s12 w3-margin-left w3-display-container">		
 				<textarea rows="20" cols="99" id="ir1" name="content">
 					<c:set var="con1" value="${fn:replace(b.content,'&lt;','<' )}"/>
					<c:set var="con2" value="${fn:replace(con1,'&gt;','>' )}"/>
					<c:set var="con3" value="${fn:replace(con2,'<iframe ','<iframe width=500 height=350')}"/>
					${fn:replace(con3,'&quot;','"')}</textarea>
 			</div>
 		</div>
 		<script>
            CKEDITOR.replace("ir1", {
               filebrowserImageUploadUrl : "imgupload.do1"
               //filebrowserImageUploadUrl : 이미지 업로드 설정
               //imgupload.do ; 업로드를 위한 url지정 
            });
         </script>
 		<hr>		 
 		
 		<%-- 파일첨부란. --%>
 		<div class="w3-row w3-container">
 			 <div class="w3-col s12 w3-margin-left w3-display-container">
	 			 <b class="w3-text-blue">첨부파일</b>	
	 			 <c:if test="${!empty b.file && !b.file.equals('') }">
	 				<div id="file_desc">${b.file}
	 				<a href="javascript:file_delete()">[첨부파일 삭제]</a>
	 				</div>
	 			</c:if>
	 			<input type="file" name="file">
 			 </div>
 		</div>
 		<hr>
 		<div class="w3-row w3-container">
 			 <div class="w3-col s12 w3-margin-left w3-display-container">
 			 	<input class="w3-display-topmiddle w3-button w3-blue w3-round-large" 
 			 		   onclick="javascript: this.form.action='update.do';this.form.submit() " type="button" value="수정"/>
 			 	
 			 	<input class="w3-display-topright w3-button w3-blue w3-round-large" 
 			 	      onclick="javascript: this.form.action='info.do?border_num='+${param.border_num};this.form.submit()" type="button" value="돌아가기"/>
 			 </div>
 		</div>
 				 
 		
 		
   	</div>
</form>
<br><br><br><br>
<script>
	var thema = '${b.thema}';
	$("#selectList").val(thema).prop("selected", true);
</script>
</body>
</html>
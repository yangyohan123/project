<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- picture.jsp 기능
    	<자바영역>
    	1. 파일 업로드
    	<자바스크립트영역>
    	2. opener 화면에 결과 전달
    	3. 현재 화면 close()
     --%>
<script type="text/javascript">
	img = opener.document.getElementById("profile");
	img.src = "picture/${fname}";
	opener.document.f.picture.value ="${fname}";
	self.close();
</script>
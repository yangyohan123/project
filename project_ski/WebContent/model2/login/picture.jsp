<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- picture.jsp ���
    	<�ڹٿ���>
    	1. ���� ���ε�
    	<�ڹٽ�ũ��Ʈ����>
    	2. opener ȭ�鿡 ��� ����
    	3. ���� ȭ�� close()
     --%>
<script type="text/javascript">
	img = opener.document.getElementById("profile");
	img.src = "picture/${fname}";
	opener.document.f.picture.value ="${fname}";
	self.close();
</script>
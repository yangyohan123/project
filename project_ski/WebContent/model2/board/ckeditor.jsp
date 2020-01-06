<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
	<%-- 약속되어져있는 구조임. --%>
	window.parent.CKEDITOR.tools.callFunction
	(${param.CKEditorFuncNum}, 'imgfile/${fileName}','이미지 업로드 완료')
</script>
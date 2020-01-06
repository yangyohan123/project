<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��� ����</title>
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
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="����" onclick="document.f1.thema.value=this.value;document.f1.submit()" >
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="��Ű" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button"  value="���" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="����" onclick="document.f1.thema.value=this.value;document.f1.submit()">
	</c:when>
	<c:when test="${typenum =='3' }">&nbsp;&nbsp;<button class="w3-button w3-blue w3-round-large w3-large" value="home" onclick="document.f1.thema.value=this.value;document.f1.submit()"><i class="fa fa-home"></i></button>
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="�ؿ�" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="�ִн�" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="����" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="��Ÿ��" onclick="document.f1.thema.value=this.value;document.f1.submit()">
			 						 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="��ߵ�" onclick="document.f1.thema.value=this.value;document.f1.submit()">
			 						 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="����������ũ" onclick="document.f1.thema.value=this.value;document.f1.submit()">
									 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="��Ÿ" onclick="document.f1.thema.value=this.value;document.f1.submit()">	
    </c:when>
	<c:when test="${typenum =='4' }">&nbsp;&nbsp;<button class="w3-button w3-blue w3-round-large w3-large" value="home" onclick="document.f1.thema.value=this.value;document.f1.submit()"><i class="fa fa-home"></i></button>
									 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="��ų���" onclick="document.f1.thema.value=this.value;document.f1.submit()">
				 					 &nbsp;&nbsp;<input  class="w3-button w3-blue w3-round-xxlarge" type="button" value="������" onclick="document.f1.thema.value=this.value;document.f1.submit()"> 
				 					 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="��Ű��" onclick="document.f1.thema.value=this.value;document.f1.submit()">
	</c:when>
	<c:otherwise>
				<c:if test="${typenum==5 }">	
		 							 &nbsp;&nbsp;<button class="w3-button w3-blue w3-round-large w3-large" value="home" onclick="document.f1.thema.value=this.value;document.f1.submit()"><i class="fa fa-home"></i></button>
		 							 &nbsp;&nbsp;<input class="w3-button w3-blue w3-round-xxlarge" type="button" value="������" onclick="document.f1.thema.value=this.value;document.f1.submit()">
				</c:if>
	</c:otherwise>
</c:choose>
</form><br><br>
<%--��������, ����/�÷�, ��Ű��/�ı�, ������ --%>
<c:if test="${typenum < 5 }">
<table class="w3-table w3-bordered">
<c:choose>
	<c:when test="${typenum =='1' }"><caption>�������� �Խ���</caption></c:when>
	<c:when test="${typenum =='2' }"><caption>����/��Ű �Խ���</caption></c:when>
	<c:when test="${typenum =='3' }"><caption>��Ű��/�ı� �Խ���</caption></c:when>
	<c:otherwise><caption>������ �Խ���</caption></c:otherwise>
</c:choose>
<c:if test="${boardcnt == 0}">
	<tr><td colspan="7" style="text-align:center;">��ϵ� �Խñ��� �����ϴ�.</td></tr>
</c:if>
<c:if test="${boardcnt >0 }">
<tr><td colspan="7" style="text-align:right">�۰���:${boardcnt}</td></tr>
<tr><th width="8%">��ȣ</th><th width="12%">�з�</th><th width="38%">����</th>
   <th width="14%">�г���</th><th width="12%">�����</th>
   <th width="8%">��ȸ��</th><th width="8%">��õ��</th></tr>
<%-- ���� �׸� �´� �����͸� for���� list�� ���� ��Ÿ�� --%>
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
   	<%-- ���� �������� 1���� �۰ų� ������ �����۸�ũ ���� [����]�� ��Ÿ����
   		 1���� ũ�� ������������ �����۸�ũ�� �� [����]�� ������ --%>
      <c:if test="${pageNum <= 1 }"><b>&laquo;</b></c:if>
      <c:if test="${pageNum > 1 }">
      <a  href="list.do?typenum=${typenum}&pageNum=${pageNum -1 }"><b>&laquo;</b></a>
      </c:if>
      <%--ó������������ ���������������� for��������
      	  ���� a�� ������������ ������ �����۸�ũ ���� ������������ ��Ÿ����
      	 ���� a�� ������������ ���� ������ ���ϴ� �������� �� �� �ִ� �����۸�ũ �� �������� ������ --%>
      <c:forEach var="a" begin="${startpage }" end="${endpage }">
      	<c:if test="${a==pageNum }"><b>[${a }]</b></c:if>
      	<c:if test="${a!=pageNum }">
      		<a  href="list.do?typenum=${typenum}&pageNum=${a }"><b>[${a }]</b></a>
      	</c:if>
      </c:forEach>
         <%-- ������������ �������������� ũ�ų� ������ [����]�� ��� 
         	   �������������� ������ ������������ �����۸�ũ�� �� [����]�� ������ --%>
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
      			<option value="">�����ϼ���</option>
      			<option value="name">�̸�</option>
      			<option value="nickname">�г���</option>
      			<option value="title">����</option>
      			<option value="content">����</option>
      			<option value="title,content">���� + ����</option>
      		</select>
      		<script type="text/javascript">document.sf.column.value = "${param.column}"</script>
      		<input type="text" placeholder="Search.." name="find" value="${param.find }" style="width:30%; height:36px;">
      		<button class="w3-button w3-blue w3-round-large" type="submit"><i class="fa fa-search"></i></button>
      	</form>
      </td>
      <c:if test="${sessionScope.login == 'admin' or typenum == 2 or typenum == 3 or typenum == 4 or typenum == 5}">
        <td colspan="3" style="text-align:right">
		<a class="w3-text-blue" href="writeForm.do?typenum=${typenum }">�۾���</a></td>
	  </c:if>	      	
         
        
       </c:if>
       
       <c:if test="${empty sessionScope.login }">
       	<td colspan="7" style="text-align:left">
       		<form action="list.do?typenum=${param.typenum }" method="post" name="sf">
      		<input type="hidden" name="pageNum" value="1">
      		<select name="column" style="height:36px;">
      			<option value="">�����ϼ���</option>
      			<option value="name">�̸�</option>
      			<option value="nickname">�г���</option>
      			<option value="title">����</option>
      			<option value="content">����</option>
      			<option value="title,content">���� + ����</option>
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

<%--�������Խ��� --%>
<c:if test="${typenum==5}">
	
	<%--���� --%>
	<div class="w3-row w3-container">
  
  		<div class="w3-col s12 w3-center">
  			<b>�������Խ���</b>
  		</div>
  	</div>
	
	<%-- �Խ��� ���� --%>
	<div class="w3-row w3-container">
  
  		<div class="w3-col s12 w3-center">
  			<c:if test="${boardcnt == 0}">
				<tr><td colspan="7" style="text-align:center;">��ϵ� �Խñ��� �����ϴ�.</td></tr>
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
 

<%-- ����¡ ��� --%>
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
  
  <%-- �˻�  �� �۾��� --%>
   <div class="w3-row w3-container">
  
  		<div class="w3-col s12 w3-center w3-display-bottommiddle" style="position:absolute; top:1200px; left : 65%">
  	
  	  <%-- �α��� �Ǿ��� �� --%>
      <c:if test="${!empty sessionScope.login  }">
 		<%--�˻� --%>
 		<div style="float:left; margin-left:30%;">
      	<form action="list.do?typenum=${param.typenum }" method="post" name="sf">
      		<input type="hidden" name="pageNum" value="1">
      		<select name="column" style="height:36px;">
      			<option value="">�����ϼ���</option>
      			<option value="name">�̸�</option>
      			<option value="nickname">�г���</option>
      			<option value="title">����</option>
      			<option value="content">����</option>
      			<option value="title,content">���� + ����</option>
      		</select>
      		<script type="text/javascript">document.sf.column.value = "${param.column}"</script>
      		<input type="text" placeholder="Search.." name="find" value="${param.find }" style="width:300px; height:36px;">
      		<button class="w3-button w3-blue w3-round-large" type="submit"><i class="fa fa-search"></i></button>
      	</form>
      	</div>
      	
      	<%--�۾��� --%>
      	<div style="float:left; margin-left:12%; width:45px; ">
     		<label ><a class="w3-text-blue" href="writeForm.do?typenum=${typenum }">�۾���</a></label>
      	</div>
       </c:if>
       </div>
       <%-- �α��� �ȵǾ� ���� �� --%>
       <c:if test="${empty sessionScope.login }">
       	
       		<form action="list.do?typenum=${param.typenum }" style="position: absolute;top: 1200px; left:600px; width:500px;" 
       		      method="post" name="sf">
      		<input type="hidden" name="pageNum" value="1">
      		<select name="column" style="height:36px;">
      			<option value="">�����ϼ���</option>
      			<option value="name">�̸�</option>
      			<option value="nickname">�г���</option>
      			<option value="title">����</option>
      			<option value="content">����</option>
      			<option value="title,content">���� + ����</option>
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
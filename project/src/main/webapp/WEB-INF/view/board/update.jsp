<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 60%;
  margin: auto;
  
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
<meta charset="UTF-8">
<title>게시물 수정하기</title>
<style type="text/css">
	.leftcol {text-align: left; vertical-align: top;}
	.lefttoptable{
		height: 250px;	border-width: 0px;
		text-align: left;	vertical-align: top;	padding: 0px;
	}
	input[type=text]:focus {
  border: 3px solid #555;
}
</style>
</head>
<body>
<br><br><br><br><br>


<form:form modelAttribute="board" action="update.dev" name="f">
<table id="customers"><tr><td align="center">글쓴이</td><td><form:input path="name"  value="${loginUser.name}" size="40%" readonly="true" />
	</td></tr>

	<tr><td align="center">제목</td><td><form:input path="title" size="100%;" />
	</td></tr>
	<tr><td align="center">내용</td><td>
	<form:textarea path="content" rows="15" cols="80"/>
	<script>CKEDITOR.replace("content",{
		filebrowserImageUploadUrl: "imgupload.dev"
	});
	</script>
	<font color="red"><form:errors path="content"/></font></td></tr>
	<tr><td colspan="2">
		<a href="javascript:document.f.submit()">[수정하기]</a>
		
	</td></tr>
	<form:input path="no" type="hidden" value="${board.no }" /> 
<form:input path="bno" type="hidden" value="${board.bno }" /> 
</table>
</form:form>
</body>
</html>
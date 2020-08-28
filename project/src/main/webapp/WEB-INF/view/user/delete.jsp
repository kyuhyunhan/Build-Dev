<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<table>
	<tr><td>아이디</td><td>${user.id}</td></tr>
	<tr><td>이름</td><td>${user.name}</td></tr>
</table>
<form action="delete.dev" method="post" name="deleteform">
	<input type="hidden" name="name" value="${user.name}">
	비밀번호<input type="password" name="pw">
	<input type="submit" value="회원탈퇴">
</form>
</body>
</html>
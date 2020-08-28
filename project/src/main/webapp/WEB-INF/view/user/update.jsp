<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 편집</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class="w3-cell-row w3-display-middle w3-light-grey" style="width:60%; height:60%;" >
<div class="w3-container w3-cell" style="width:15%">
  <div class="w3-container w3-border-top w3-padding-16 w3-center">
    	<a href="${path}/user/update.sns" class="w3-button">프로필 편집</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-center">
    	<a href="${path}/user/password.sns" class="w3-button">비밀번호 변경</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-center">
    	<a href="#" class="w3-button">푸시 알림</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-center">
    	<a href="#" class="w3-button">공개 범위 및 보안</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-center">
    	<a href="#" class="w3-button">문제 신고</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-center">
    	<a href="logout.sns" class="w3-button">로그아웃</a>
	</div>
</div>

<div class="w3-container w3-cell w3-cell-middle">
<form:form modelAttribute="user" method="post" action="update.sns">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}"/>
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
	<tr><td>아이디</td>
	<td><form:input path="id" readonly="true"/>
		<font color="red"><form:errors path="id"/></font></td></tr>
	<tr><td>닉네임</td>
	<td><form:input path="name"/>
		<font color="red"><form:errors path="name"/></font></td></tr>
	<tr><td>소개</td>
	<td><form:input path="introduction"/>
		<font color="red"><form:errors path="introduction"/></font></td></tr>
	<tr><td>이메일</td>
	<td><form:input path="email"/>
		<font color="red"><form:errors path="email"/></font></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="수정">
		<input type="reset" value="초기화">
		<input type="button" value="회원탈퇴" onclick="location.href='delete.sns?id=${loginUser.id}'">
	</td></tr>
	</table>
</form:form>
</div>

</div>
</body>
</html>
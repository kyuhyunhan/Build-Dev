<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<style type="text/css">
.boardinfo {
	border: 1px solid #86A5FF;
	border-radius: 10px;
	box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
	overflow: hidden;
	width: 1000px;
	box-sizing: border-box;
	margin: 0 auto;
	margin-bottom: 50px;
	font-weight: 700;
}
.boardinfo .header {
	background: mediumslateblue;
	color: #fff;
	font-size: 1.5em;
	padding: 1rem;
	text-transform: uppercase;
}
.boardinfo table {
	width: 100%;
	border-collapse: collapse;
}
.boardinfo table tr:nth-child(2n+1) {
	background: #fff;
}
.boardinfo table tr:nth-child(2n) {
	background: #fff;
}
.boardinfo table th,
.boardinfo table td {
	color: #8572EE;
	padding: 10px;
}
.boardinfo table th {
	background: #CCE1FF;
	font-weight: 300;
}
.boardinfo table td {
	text-align: center;
	vertical-align: middle;
	border-top: 1px solid #86A5FF;
}
</style>
</head>
<body>
<h2>강남 스터디</h2>
<div class="boardinfo">
	<div class="header">신청관리</div>
	<table>
		<tr>
			<th>No</th>
			<th>Name</th>
			<th>Language</th>
			<th>Phone number</th>
			<th>Email</th>
			<th>Comment</th>
			<th colspan="2"></th>
		</tr>
		<c:forEach items="${apply}" var="apply">
			<tr>
				<td>${apply.gno }</td>
				<td>${apply.name }</td>
				<td>${apply.lang }</td>
				<td>${apply.phone }</td>
				<td>${apply.email }</td>
				<td>${apply.comment }</td>
				<td><a href="accept.dev?name=${apply.name}&gno=${apply.gno}">수락</a></td>
				<td><a href="deport.dev?name=${apply.name}&gno=${apply.gno}">거절</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="boardinfo">
	<div class="header">팀원관리</div>
	<table>
	<tr>
			<th>No</th>
			<th>Name</th>
			<th>Language</th>
			<th>Phone number</th>
			<th>Email</th>
			<th>Comment</th>
			<th colspan="2"></th>
		</tr>
		<c:forEach items="${member}" var="member">
			<tr>
				<td>${member.gno }</td>
				<td>${member.name }</td>
				<td>${member.lang }</td>
				<td>${member.phone }</td>
				<td>${member.email }</td>
				<td><a href="deport.dev?name=${member.name}&gno=${member.gno}">추방</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>
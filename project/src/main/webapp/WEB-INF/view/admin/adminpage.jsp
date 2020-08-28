<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	h2 {
		font-weight : bold;
		font-size : 20px;
		color : #8572EE;
		padding-bottom : 20px;
		text-align : center;
	}
</style>
<script>
	$(function(){
		//경고
		$(".warning").on("click",function(){
			var warningTarget = $(this).data('target');
			console.log(warningTarget)
			$.ajax({
				url : "${path}/ajax/warning.dev",
				type: "post",
				data : {
					targetname : warningTarget
				},
				success : function(s) {
					alert("경고메세지를 보냈습니다.");
					location.reload();
				},
				error : function(e) {
					alert("오류가 발생했습니다.");
				}
			})
		})	
		
		//강제탈퇴
		$(".banUser").on("click",function() {
			var targetuser = $(this).data('username');
			console.log(targetuser)
			$.ajax({
				url : "${path}/ajax/banUser.dev",
				type : "post",
				data : {
					targetuser : targetuser
				},
				success : function(s) {
					alert(targetuser + "를 탈퇴시켰습니다.")
					location.reload();
				},
				error : function(e) {
					alert("오류발생")
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:50px">    
		<div class="row content">
			<div class="col-sm-1 sidenav">
			</div>
			
			<div class="col-sm-5 text-left" style="text-align:center">
				
				<div class="report">
						<h2>신고 관리</h2>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>신고 대상</th>
								<th>게시판 위치</th>
								<th>내용</th>
								<th>신고일</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="reports" items="${reports}">
								<tr>
									<td>
										<a href="#profileInfo" class="open-profileInfoModal" data-toggle="modal" data-name="${reports.name}" style="color:black;">${reports.name}</a>
									</td>
									<td>${reports.no}</td>
									<td>${reports.content}</td>
									<td><fmt:formatDate value="${reports.regdate}" pattern="yyyy-MM-dd"/></td>
									<td>
										<button type="button" class="btn btn-warning btn-sm warning" data-target="${reports.name}">경고</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-sm-5 text-left" style="text-align:center">
				<div class="users">
						<h2>회원 관리</h2>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>email</th>
								<th>가입일</th>
								<th>누적경고횟수</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td>
										<a href="#profileInfo" class="open-profileInfoModal" data-toggle="modal" data-name="${list.id}" style="color:black;">${list.id}</a>
									</td>
									<td>${list.name}</td>
									<td>${list.email}</td>
									<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
									<td>${list.alertnum}</td>
									<td>
										<c:if test="${list.id != 'admin'}">
											<a href=#><button type="button" class="btn btn-danger btn-sm banUser" data-username="${list.name}">강제탈퇴</button></a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-sm-1 sidenav">
			</div>
		</div>
	</div>

</body>
</html>
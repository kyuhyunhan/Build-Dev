<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	h3 {
		font-weight : bold;
		font-size : 20px;
		color : #8572EE;
		padding-bottom : 20px;
		text-align : center;
	}
</style>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:50px">    
		<div class="row content">
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left" style="text-align:center">
				<form action="subuser.dev" method="post">
							<h3>구독한 회원 목록</h3>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>구독 여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<c:forEach items="${subuser}" var="subuser">
									<c:if test="${subuser.scrapper == sessionScope.loginUser.name}">
										<c:if test="${subuser.scrapped == list.name}">
											<tr>
												<td>${list.id}</td>
												<td>${list.name}</td>
												<td>${list.email}</td>
												<td><input type="button" value="구독 취소 " id=subdelete data-target="${list.name}" class="btn btn-danger"></td>
											</tr>
											<%--<input type="hidden" name="scrapped" id="scrapped" value="${list.name}"> --%>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
				
				<div class="col-sm-3 sidenav">
				</div>
			</div>
		</div>
	
	
	<script type="text/javascript">
	$(function() {
		$(document).on("click", "#subdelete", function () {
			var tmp = $(this).data('target')
			console.log(tmp)
			$.ajax({
				type: "post",
				url: '${path}/ajax/subdelete.dev',
				data : {
					name : tmp//$("#scrapped").val()
					 
				},
				success : function (res) {
					alert("구독 취소");
					location.reload();
				},
				error: function (e) {
					console.log("e: "+e.status);
					
				}
			})
		})  
		
		})
	
	</script>

</body>
</html>
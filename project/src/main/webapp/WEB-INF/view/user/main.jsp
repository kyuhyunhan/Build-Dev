<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style type="text/css">
.listbox{
	position: relative;
	left: 10px;
	margin: 10px;
	width: 200px;
	background-color: #EEEEEE;
	color: #FF00FF;
	border: 2px solid #000;
}
.namelist{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
.hover{
	background-color: cyan;
	color: blue;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".listbox").hide();
	$("#id").keyup(function() {// keyup이 될때마다 ajax 실행
		var data = "id="+$("#id").val();
		$.ajax({
			url: "autocomplete.jsp",
			type: "post",
			data: data,
			success: function(html){
				console.log(html);
				$(".listbox").show();
				$(".namelist").html(html);
				$("li").hover(function() { // mouseenter 마우스 이벤트 등록
					$(this).addClass("hover");
				}, function(){
					$(this).removeClass("hover");
				})
				$("li").click(function() {
					console.log($(this));// li
					$("#id").val($(this).text()); // 이동
					$(".listbox").hide();
				})
			}
		})
	})
})
</script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<h2>환영합니다. ${sessionScope.loginUser.name}님</h2>
<input type="button" value="설정" onclick="document.getElementById('setting').style.display='block'" style="text-align: center; margin-bottom: 3px;"><br>
<!-- Modal -->
<div id="setting" class="w3-modal">
   <div class="w3-modal-content w3-card-4 w3-animate-zoom w3-round-large" style="max-width:400px">	
    <div class="w3-container w3-border-top w3-padding-16 w3-white w3-center w3-round-large">
    	<a href="${path}/user/update.sns?id=${loginUser.id}" class="w3-button">프로필 편집</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-white w3-center">
    	<a href="${path}/user/password.sns?id=${loginUser.id}" class="w3-button">비밀번호 변경</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-white w3-center">
    	<a href="#" class="w3-button">푸시 알림</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-white w3-center">
    	<a href="#" class="w3-button">공개 범위 및 보안</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-white w3-center">
    	<a href="#" class="w3-button">문제 신고</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-white w3-center">
    	<a href="logout.sns" class="w3-button">로그아웃</a>
	</div>
	<div class="w3-container w3-border-top w3-padding-16 w3-white w3-center w3-round-large">
		<span onclick="document.getElementById('setting').style.display='none'" class="w3-button">취소</span>
	</div>
  </div>
</div>
<script>
var modal = document.getElementById('setting');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

<span class="label">사용자 아이디</span>
<input type="text" name="id" id="id">
<div class="listbox"> <div class="namelist"></div></div>
<input type="text" name="asd" id="asd">

<a href="logout.sns">로그아웃</a>
</body>
</html>
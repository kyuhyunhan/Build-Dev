<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style type="text/css">
html, body {
    margin: 0;
    height: 100%;
    overflow: hidden;
}
.main{
	height: 100%;
	overflow: hidden;
}
.containers {
   position: relative;
   width: 40%;
   height:100%;
   margin: 5vh auto;
   overflow: hidden;
}
.containers .category {
	height: 30px;
	width: 100%;
	position: absolute;
	line-height: 20px;
	text-align: center;
	color: #fff;
	text-transform: uppercase;
	padding: 5px 20px;
	font-size: 16px;
	font-weight: bold;
}
.containers .content{
	position: absolute;
	padding: 20px;
	margin-top: 30px;
	height: auto;
	width: 100%;
	background-color: #ffffff;
    border: 1px solid #e6e8eb;
}
.containers .content .title{
	font-size: 13px;
	color: #000;
}
.containers .content .name{
	font-size: 13px;
	color:#323648;  
	text-align: right;
}
.containers .content .deadline{
	font-size: 13px;
	color:#ff6600; 
	text-align: right;
	font-weight: 400px;
}
.containers .content .w3-containers{
	width: 100%;
	display: table;
}
.containers .content .w3-containers .left{
	display: table-cell;
	width:50%;
}

.containers .content .w3-containers .right{
	display: table-cell;
	width:50%;
}

.containers .content .w3-containers .right .hashlist a{
	display: inline-block;
	font-size: 14px;
	background-color: #ebecec;
	padding: 2px 8px;
	border-radius: 4px;
	font-weight: 400px;
}

.containers .content .w3-containers{
	clear:both;
}

.containers .content .w3-containers .ctgy{
	font-size: 21px;
	font-weight: 500;
	color: #000;
	margin-bottom: 10px;
}
.containers .content .w3-containers .w3-containers{
	font-size: 15px;
	font-weight: 500;
	color: #000; 
	background-color: #f9f9fa;
	line-height: 1.8em;
}
.containers .content .btn-area{
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
<div class="containers">
	<span class="category" style="background: ${cwk.category == '스터디'? '#00B8F4': cwk.category == '프로젝트'? '#00FF7F' : '#EE82EE' }">${cwk.category == "스터디"? "Study": cwk.category == "프로젝트"? "Project" : "Contest" }</span>
	<div class="content">
	               <div class="w3-containers">
				    <div class="name">${cwk.name}</div>
				    <div class="title"><h2>${cwk.title}</h2></div>
				    <div class="deadline"><span>모집 마감일 <fmt:formatDate value="${cwk.deadline}" pattern="yyyy-MM-dd" /></span></div>
				   </div><hr>
				   
				   <div class="w3-containers">
				   	<div class="left"><table>
				   		<tr><td><span><i class="fa fa-graduation-cap"></i> </span>${cwk.grade}&nbsp;</td><td><span><i class="fas fa-map-marker-alt"></i> </span>${cwk.loc}</td></tr>
				   		<tr><td> <span><i class="fa fa-calendar-alt"></i> </span><fmt:formatDate value="${cwk.startdate}" pattern="yyyy-MM-dd" /> ~ 
			            <span><fmt:formatDate value="${cwk.enddate}" pattern="yyyy-MM-dd" /></span>&nbsp;</td><td><span><i class="fa fa-users"></i> </span>${recruitment}명</td></tr>
			       	</table></div>
				   	<div class="right"><table>
				   		<tr><td>프로젝트 필수 스킬</td><tr>
				   		<tr><td><div class="hashlist">
				   			<c:forEach var="cowork" items="${list}">
				   				<c:forEach var="hash" items="${cowork.hashlist}">
				   					<c:if test="${cwk.title eq cowork.title}">
				   						<a>#${hash}</a>&nbsp;
				   					</c:if>
				   				</c:forEach></c:forEach>
							</div>
				   		</td></tr>
				   	</table></div>
				   </div><hr>
		           <div class="w3-containers">
			           <div class="ctgy">${cwk.category}내용</div>
			           <div class="w3-containers"><pre>${cwk.content}</pre></div>
			       </div><hr>
			       <div class="btn-area">
				         <c:if test="${empty chk}">
				        	<input type="button" value="신청" onclick="document.getElementById('join').style.display='block'" style="text-align: center; margin-bottom: 3px;"><br>	
				         </c:if>
				         <c:if test="${chk eq '승인'}">
				        	<input type="button" value="완료" style="text-align: center; margin-bottom: 3px;"><br>	
				         </c:if>
				         <c:if test="${chk eq '신청'}">
				        	<input type="button" value="신청중" style="text-align: center; margin-bottom: 3px;"><br>	
				         </c:if>
				   </div>
     </div>
</div>


<!-- Modal -->
<div id="join" class="w3-modal">
   <div class="w3-modal-content w3-card-4 w3-animate-zoom w3-round-large" style="max-width:600px">	
   <div class="w3-containers w3-border-top w3-padding-16 w3-light-grey w3-center w3-round-large">
    	<h2>프로젝트 지원</h2>
	</div>
    <div class="w3-containers w3-border-top w3-padding-16 w3-white w3-center">
    	<form action="details.dev" method="post" >
    	<input type="hidden" value="${loginUser.name}" name="name">
    	<input type="hidden" value="${param.gno}" name="gno">
	<table>
		<caption>${cwk.title}</caption>
		<tr><td>회원정보</td><td colspan="3" class="w3-left">${loginUser.name}</td></tr>
		<tr><td>이메일</td><td><input type="text" value="${loginUser.email}"></td>
			<td>전화번호</td><td><input type="text" value="${loginUser.phone}"></td></tr>
		<tr><td>주언어</td><td><input type="text" name="lang"></td></tr>
		<tr><td>남기는 말</td><td><textarea name="comment" style="width:300px; height:200px;"></textarea></td></tr>
	</table>
	<div class="w3-containers w3-border-top w3-padding-16 w3-white w3-center">
		<input type="submit" value="신청" class="w3-btn w3-black w3-round-xxlarge">
		<span onclick="document.getElementById('join').style.display='none'" class="w3-button">취소</span>
	</div>
	</form>
	</div>
  </div>
</div>
<script>
var modal = document.getElementById('join');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</body>
</html>
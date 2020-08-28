<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.container {
    	position : relative;
    	top : 0;
    	left : 0;
    	width : 100%;
    	display : block;
    	box-sizing :border-box;
	}
	.content {
		padding : 20px 50px 30px 50px;
	}
	#content-profile-tab {
		border : 1px solid #a473fa;
		border-radius: 15px 15px 0 0;
		/* background-color : #a473fa; */
		padding : 8px 30px 4px 30px;
		margin-top : 15px;
		margin-left : 100px;
		font-size : 20px;
		background: rgba(211,120,190,1);
		background: -moz-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -webkit-gradient(left top, right top, color-stop(0%, rgba(211,120,190,1)), color-stop(0%, rgba(184,0,125,1)), color-stop(0%, rgba(200,91,169,1)), color-stop(100%, rgba(162,145,242,1)));
		background: -webkit-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -o-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -ms-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: linear-gradient(to right, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d378be', endColorstr='#a291f2', GradientType=1 );
	}
	.content-header {
		border : 1px solid #b5b3bd;
		border-radius: 25px;
		background-color : #fff;
		-webkit-box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		-moz-box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		margin : 5px 0 30px 0;
		height : 350px;
	}
	.profileimg-container {
		padding :60px 60px 60px 60px;
		text-align : center;
	}
	#profileimg {
		width : 70%;
		height : auto;
	}
	.profiletext-container {
		padding : 45px 0 0 50px;
	}
	#username {
		font-size : 30px;
		font-weight : bold;
		padding : 0 0 5px 20px;
	}
	#email {
		border-bottom : 1px solid gray;
		padding : 0 0 10px 20px;
		width : 75%;
		font-size : 15px;
	}
	.profile-icons {
		padding : 15px 0 20px 0;
	}
	#message {
		padding : 0 20px;
	}
	#tilurl {
		padding : 0 20px;
	}
	#giturl {
		padding : 0 20px;
	}
	.profile-tags {
		padding : 0 0 10px 20px;
	}
	.tag-name {
		font-size : 20px;
		font-weight : bold;
		margin-right : 30px;
	}
	#position-tags {
		margin : 0 0 20px 0;
	}
	.ptag {
		padding : 4px 8px;
		margin : 0 5px;
		border : 1px solid #e5e1f7;
		background-color : #e5e1f7;
		border-radius : 5px;
		color : #8572EE;
		font-size : 15px;
	}
	.stag {
		padding : 4px 8px;
		margin : 0 5px;
		border : 1px solid #4171f2;
		background-color : #4171f2;
		border-radius : 5px;
		color : white;
		font-size : 15px;
	}
	.usedtag {
		padding : 4px 8px;
		margin : 0 5px;
		border : 1px solid #4171f2;
		background-color : #4171f2;
		border-radius : 5px;
		color : white;
		font-size : 20px;
	}
	
	
	
	
	
	#content-project-tab {
		border : 1px solid #a473fa;
		border-radius: 15px 15px 0 0;
		/* background-color : #a473fa; */
		padding : 8px 30px 4px 30px;
		margin-left : 100px;
		font-size : 20px;
		background: rgba(211,120,190,1);
		background: -moz-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -webkit-gradient(left top, right top, color-stop(0%, rgba(211,120,190,1)), color-stop(0%, rgba(184,0,125,1)), color-stop(0%, rgba(200,91,169,1)), color-stop(100%, rgba(162,145,242,1)));
		background: -webkit-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -o-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -ms-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: linear-gradient(to right, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d378be', endColorstr='#a291f2', GradientType=1 );
	}
	.content-body {
		border : 1px solid #b5b3bd;
		border-radius: 25px;
		background-color : #fff;
		-webkit-box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		-moz-box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		margin : 5px 0 30px 0;
		
	}
	/*timeline css*/
	@import url("https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700");
	body {
	    font-family: "Open Sans", sans-serif;
	    margin: 0;
	    padding: 0 4em;
	}
	
	main {
	    min-width: 300px;
	    max-width: 800px;
	    margin: auto;
	}
	
	.project {
	    font-size: 1em;
	    line-height: 1.75em;
	    border-top: 3px solid;
	    border-image: linear-gradient(to right, #743ad5 0%, #d53a9d 100%);
	    border-image-slice: 1;
	    border-width: 3px;
	    margin: 0;
	    padding: 40px 40px 40px 60px;
	    counter-increment: section;
	    position: relative;
	    color: #34435E;
	}
	.project:before {
	    content: counter(section);
	    position: absolute;
	    border-radius: 50%;
	    height: 1.25em;
	    width: 1.25em;
	    background-color: #34435E;
	    text-align: center;
	    line-height: 1.25em;
	    color: #ffffff;
	    font-size: 1em;
	}
	.project:nth-child(even) {
	    border-right: 3px solid;
	    padding-left: 50px;
	}
	
	.project:nth-child(even):before {
	    left: 100%;
	    margin-left: -8px;
	    margin-top : 3px;
	}
	.project:nth-child(even) .project-container {
		padding : 20px;
		margin-top : 30px;
		border :1px solid #c572ee;
		border-radius : 10px;
		-webkit-box-shadow: 0px 0px 27px -1px rgba(130,127,130,1);
		-moz-box-shadow: 0px 0px 27px -1px rgba(130,127,130,1);
		box-shadow: 0px 0px 27px -1px rgba(130,127,130,1);
	}
	.project:nth-child(even) .project-subject {
		text-align : right;
		font-size : 30px;
		margin-top : 10px;
		margin-bottom : 20px;
	}
	.project:nth-child(even) .arr-container {
		text-align : right;
	}
	.project:nth-child(even) .project-date {
		text-align : center;
		padding : 5px 8px 5px 8px;
		font-size : 20px;
		border : 1px solid #edda9f;
		background : #edda9f;
	}
	.project:nth-child(even) .project-date:after {
		 border-top:10px solid transparent;
		 border-left: 10px solid #edda9f;
		 border-right: 0px solid transparent;
		 border-bottom: 10px solid transparent;
		 content:"";
		 position:absolute;
		 top:43px;
		 right:30px;
	}
	.project:nth-child(even) .project-numbers {
		text-align : right;
		border-bottom : 1px solid gray;
		margin-left : 400px;
	}
	
	.project:nth-child(odd) {
	    border-left: 3px solid;
	    padding-right: 50px;
	}
	
	.project:nth-child(odd):before {
	    right: 100%;
	    margin-right: -8px;
	    margin-top : 3px;
	}
	.project:nth-child(odd) .project-container {
		padding : 20px;
		margin-top : 30px;
		border :1px solid #c572ee;
		border-radius : 10px;
		-webkit-box-shadow: 0px 0px 27px -1px rgba(130,127,130,1);
		-moz-box-shadow: 0px 0px 27px -1px rgba(130,127,130,1);
		box-shadow: 0px 0px 27px -1px rgba(130,127,130,1);
	}
	.project:nth-child(odd) .project-subject {
		text-align : left;
		font-size : 30px;
		margin-top : 10px;
		margin-bottom : 20px;
	}
	.project:nth-child(odd) .project-date {
		text-align : center;
		padding : 5px 8px 5px 8px;
		font-size : 20px;
		border : 1px solid #edda9f;
		background : #edda9f;
	}
	.project:nth-child(odd) .project-date:after {
		 border-top:10px solid transparent;
		 border-right: 10px solid #edda9f;
		 border-left: 0px solid transparent;
		 border-bottom: 10px solid transparent;
		 content:"";
		 position:absolute;
		 top:43px;
		 left:50px;
	}
	.project:nth-child(odd) .project-numbers {
		border-bottom : 1px solid gray;
		margin-right : 400px;
	}
	
	.project:first-child {
	    border-top: 0;
	    border-top-right-radius: 0;
	    border-top-left-radius: 0;
	}
	
	.project:last-child {
	    border-bottom-right-radius: 0;
	    border-bottom-left-radius: 0;
	}
	
	.project-description {
		padding : 20px 10px 20px 5px;
	}
	.project-giturl {
		padding : 5px 10px 20px 10px;
	}
	
	.modal-font {
		font-size: 13px;
		font-weight: bold;
	}
	
	
	.banner{
		width: 100vw;
		height: 20vh;
		text-align : center;
		padding : 70px;
		background: rgba(203,96,179,1);
		background: -moz-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: -webkit-gradient(left top, right top, color-stop(0%, rgba(203,96,179,1)), color-stop(17%, rgba(193,70,161,1)), color-stop(100%, rgba(133,114,238,1)));
		background: -webkit-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: -o-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: -ms-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: linear-gradient(to right, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb60b3', endColorstr='#8572ee', GradientType=1 );
	}
	.banner h2 {
		color: #fff;
		font-style: italic;
		font-weight: bold;
		font-size: 2rem;
	}
 </style>
</head>
<body>
	<div class="banner">
		<h2>Portfolio</h2>
	</div>
	<div class="container">
		<div class="content">
			<span id="content-profile-tab">
				Profile
			</span>
			<div class="content-header">
				<div class="row">
				  <div class="col-sm-4 profileimg-container">
				  <div></div>
					<img src="${path}/profile/${loginUser.name}.jpg" alt="프로필 이미지를 등록해주세요" width="150" height="160" id="profileimg">
				  </div>
				  <div class="col-sm-8 profiletext-container">
				  	<div id="username">
				  		${pfUser.name}&nbsp;&nbsp;&nbsp;
				  		<c:if test='${pfUser.name.equals(sessionScope.loginUser.name)}'>
							<a href="editPortfolio.dev">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</a>	
						</c:if>
				  	</div>
				  	<div id="email">
				  		E-Mail : ${pfUser.email}
				  	</div>
				  	<div class="profile-icons">
				  		<a href="#sendMessage" data-toggle="modal" id="openMessageModalATag" data-username="${pfUser.name}">
						  	<span id="message">
						  		<span style="color: green">
						  			<i class="fa fa-envelope fa-2x" aria-hidden="true"></i>
						  		</span>
						  	</span>
					  	</a>
					  	<span id="giturl">
						  	<c:if test='${pfUser.giturlable==true}'>
						  		<a href="${pfUser.giturl}" style="color:black;">
						  			<i class="fa fa-github fa-2x" aria-hidden="true"></i>
						  		</a>
						  	</c:if>
					  	</span>	
				  	</div>
				  	<div class="profile-tags">
					  	<div id="position-tags">
					  		<span class="tag-name">
						  		Position
						  	</span>
						  	<c:forEach var="pTag" items="${tags}">
						  		<c:if test='${pTag.no==7}'>
						  			<span class="ptag">
						  				${pTag.tag}
						  			</span>
						  		</c:if>
						  	</c:forEach>
					  	</div>
						<div id="skills-tags">
							<span class="tag-name">
						  		Skills
						  	</span>
						  	<c:forEach var="sTag" items="${tags}">
						  		<c:if test='${sTag.no==8}'>
						  			<span class="stag">
						  				${sTag.tag}&nbsp;&nbsp;&nbsp;
						  			</span>
						  		</c:if>
						  	</c:forEach>
					  	</div>
				  	</div>
				  </div>
				</div>
			</div>
				<span id="content-project-tab">
					Project Timeline
				</span>
				<div class="content-body">
					<main>
						<c:if test='${empty projects}'>
							<h1 style="text-align : center; padding-top : 100px; padding-bottom: 100px;font-size: 1.5rem;"><span style="color:red;"><i class="fa fa-exclamation-circle" aria-hidden="true"></i></span>  아직 등록된 프로젝트가 없습니다</h1>
						</c:if>
						<c:if test='${!empty projects}'>
						<c:forEach var="pj" items="${projects}">
							<c:if test='${pj.able==true}'>
								<div class="project">
									<div class="arr-container">
										<span class="project-date">
											<fmt:formatDate value="${pj.start}" pattern="yy.MM.dd"/> 
												- 
											<fmt:formatDate value="${pj.end}" pattern="yy.MM.dd"/>
										</span>
									</div>
									<div class="tmp"></div>
									<div class="project-container">
										<div class="project-container-header">
											<div class="project-subject">
												${pj.subject}
											</div>
											<div class="project-numbers">
												<i class="fa fa-users" aria-hidden="true"></i>
												${pj.num}명
											</div>
										</div>
										<div class="project-description">
											${pj.description}
										</div>
										<c:if test='${pj.repository != null}'>
											<div class="project-giturl">
												<a href="${pj.repository}" style="color:black;">
													<i class="fa fa-github fa-2x" aria-hidden="true"></i>
												</a>
											</div>
										</c:if>
										<c:forEach var="usedTag" items="${tags}">
											<c:if test='${usedTag.no==2 && usedTag.prono == pj.prono}'>
												<span class="usedtag">
													${usedTag.tag}
												</span>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</main>
			</div>
		</div>
	</div>
	
	<%-- 쪽지 보내는 모달 --%>
	<div class="modal fade" id="sendMessage" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">쪽지 보내기</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">받는 사람:</label>
							<input type="text" class="form-control" id="recipient-name"
								readonly>
						</div>
						<div class="form-group">
							<label for="message-title" class="col-form-label">제목:</label> <input
								type="text" class="form-control" id="message-title">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">내용:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary modal-close"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-success" id="sendMessageBtn">발송하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			//쪽지 보내는 모달 
			$('#sendMessage').on('show.bs.modal', function (event) {
			  var aTag = $(event.relatedTarget)
			  var recipient = aTag.data('username')
			  var modal = $(this)
			  modal.find('.modal-title').text(recipient + '에게 쪽지보내기')
			  modal.find('#recipient-name').val(recipient)
			})
			$('#sendMessageBtn').on("click",function(){
				$.ajax({
					url : "${path}/ajax/sendMessage.dev",
					type: "post",
					data : {
						me_from : "${sessionScope.loginUser.name}",
						me_to : $('#recipient-name').val(),
						title : $('#message-title').val(),
						content : $('#message-text').val()
					},
					success : function(s) {
						alert(s);
						$('#message-title').val("");
						$('#message-text').val("");
						$('#sendMessage').modal("hide");
						
					},
					error : function(e) {
						alert("오류발생")
					}
				})
			})
			//종료 버튼
			$(".modal-close").on("click",function(){
				$('#message-title').val("");
				$('#message-text').val("");
			})
		})
	</script>
</body>
</html>
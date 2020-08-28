<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIL</title>
<style>
.containers {
	min-height: 100vh;
	background: #fff;
	border-top: 1.5px solid #ddd;
}

.containers .infobox {
	margin: 85px 25vw 50px;
	padding: 20px;
}

.containers .header {
	
}

.containers .infobox .simpleinfo {
	display: flex;
	justify-content: space-between;
}
.containers .infobox .simpleinfo .data a{
	text-decoration: none;
	transition: 0.5s;
	color: #000;
}
.containers .infobox .simpleinfo .data a:hover{
	color: #DF084A;
}	

.containers .infobox .simpleinfo .button a {
	text-decoration: none;
	padding: 3px 5px;
	border: 1px solid #ddd;
	border-radius: 10px;
	color: #ddd;
	transition: 0.5s;
}

.containers .infobox .simpleinfo .button a:first-child:hover {
	background: #01ff09;
	color: #fff;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
}

.containers .infobox .simpleinfo .button a:last-child:hover {
	background: #ff0101;
	color: #fff;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
}

.containers .infobox .hash_containers {
	margin: 10px 0;
	border-top: 2px solid #000;
}

.containers .infobox .hashbox {
	display: flex;
	flex-wrap: wrap;
	margin-top: 10px;
	align-items: center;
	height: 32px;
	justify-content: flex-start;
}

.containers .infobox .hashbox .hash {
	height: 30px;
	margin: 0;
	padding: 0 5px;
	border: 1px solid #ddd;
	border-radius: 3px;
	background: #ddd;
	display: flex;
	align-items: center;
	color: #333;
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.2), inset 0 1px 1px #ddd;
	cursor: pointer;
	font-weight: bold;
	margin-right: 5px;
}

.containers .infobox .contentbox {
	margin-top: 10px;
}

.containers .infobox .contentbox .content {
	border-bottom: 2px solid #000;
	border-top: 2px solid #000;
	min-height: 50vh;
	padding: 10px 0;
}

.containers .infobox .comment {
	margin-top: 20px;
}

.containers .infobox .comment textarea {
	width: 100%;
	box-sizing: border-box;
	resize: none;
}

.containers .infobox .commentbutton {
	float: right;
}

.containers .like {
	position: fixed;
	left: calc(100% - 400px);
	width: 100px;
	top: 40vh;
	text-align: center;
	padding: 20px;
	border: 2px solid #ddd;
	border-radius: 50px;
}

.containers .like .fa-heart:before {
	font-size: 50px;
	color: #ddd;
	cursor: pointer;
	transition: 0.5s;
}

.containers .like.chk .fa-heart:before {
	font-size: 50px;
	color: #ff0101;
	cursor: pointer;
	transition: 0.5s;
}
</style>
</head>
<body>
	<div class="containers">
		<div class="like">
			<h6>GOOD</h6>
			<i class="fa fa-heart"></i>
			<div class="likecnt">${likecnt}</div>
		</div>
		<div class="infobox">
			<div class="header">
				<div class="title">
					<h1>${til.title}</h1>
				</div>
				<div class="simpleinfo">
					<div class="data">
					<c:if test="${loginUser.name != til.name}"><a href="#profileInfo" class="open-profileInfoModal" data-toggle="modal" data-name="${til.name}">
					${til.name}
					</a></c:if>
					<c:if test="${loginUser.name == til.name}">${til.name}</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<fmt:formatDate value="${til.regdate}" pattern="yyyy년 MM월 dd일" />
					</div>

					<div>
						<c:choose>
							<c:when test="${!empty sessionScope.loginUser}">
								<c:if test="${til.name != sessionScope.loginUser.name}">
									<td><input type="button" value="구독  하기 " id=subinsert>
										<input type="button" value="구독 취소 " id=subdelete></td>
								</c:if>
							</c:when>
						</c:choose>

					</div>
					<c:if test="${loginUser.name == til.name }">
					<div class="button">
						<a href="#">수정</a>&nbsp;<a href="#">삭제</a>
					</div>
					</c:if>
				</div>
			</div>
			<c:if test="${!empty hashlist}">
				<div class="hash_containers">
					<div class="hashbox">
						<c:forEach items="${hashlist}" var="hash">
							<div class="hash">${hash.hashname}</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<div class="contentbox">
				<div class="content">${til.content}</div>
			</div>
			<div class="comment">
				<textarea rows="5"></textarea>
			</div>
			<div class="commentbutton">
				<button type="button">등록</button>
			</div>
			<div class="commentbox"></div>
		</div>
	</div>


	<input type="hidden" id="per" value="${sub.scrapper}">
	<input type="hidden" id="ped" value="${sub.scrapped}">
	<input type="hidden" name="scrapper" id="scrapper"
		value="${sessionScope.loginUser.name}">
	<input type="hidden" name="scrapped" id="scrapped" value="${til.name}">


	<script type="text/javascript">

	$(function() {
		$("body").css("background", "#fff");
		var likechk = ${likechk};
		var likecnt = ${likecnt};
		chk_like();
		function chk_like() {
			if (likechk == 1) {
				$(".containers .like").addClass("chk");
			}else {
				$(".containers .like").removeClass("chk");
			}
		}
		
		$(".containers .like i").click(function() {
			if (likechk == 0) {
				likechk = 1;
			}else {
				likechk = 0;
			}
			
			$.ajax({
				type: "post",
				url: '${path}/ajax/likeEvent.dev',
				data : {
					likechk : likechk,
					no : ${til.no},
					wno : ${til.bno} 
				},
				success : function (res) { 
					if(likechk == 1) {
						likecnt += 1;
					}else {
						likecnt -= 1;
					}
					$(".likecnt").text(likecnt);
					chk_like();
				}
			}) 
		})
		
		
		
	
		//likeview()
		subview()
		function subview() {
			
			var chk = false;
			if(($("#per").val()) == ($("#scrapper").val()) && ($("#ped").val()) == ($("#scrapped").val())){
				chk=true;
			}
			
			if(chk){
				$("#subinsert").hide();
				$("#subdelete").show();
			}else{
				$("#subinsert").show();
				$("#subdelete").hide();
			}
		} 
	
	
	
	$(document).on("click", "#subinsert", function () {
		$.ajax({
			type: "post",
			url: '${path}/ajax/subinsert.dev',
			data : {
				name : $("#scrapped").val()
				
			},
			success : function (res) { 
				alert("구독 성공");
				location.reload();
			},
			error: function (e) {
				console.log("e: "+e.status);
			}
		}) 
	})
	
	
	
	$(document).on("click", "#subdelete", function () {
		$.ajax({
			type: "post",
			url: '${path}/ajax/subdelete.dev',
			data : {
				name : $("#scrapped").val()
				 
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
	
	/*
	//좋아요
	
	function likeview() {
			
			var chk = false;
			if(($("#likename").val()) == ($("#scrapper").val()) && ($("#no").val()) == ($("#likeno").val()) && ($("#bno").val()) == ($("#likewno").val())){
				chk=true;
			}
			
			if(chk){
				$("#likeinsert").hide();
				$("#likedelete").show();
			}else{
				$("#likeinsert").show();
				$("#likedelete").hide();
			}
		}  
	
	
	$(document).on("click", "#likeinsert", function () {
		console.log("click");
		$.ajax({
			type: "post",
			url: '${path}/ajax/likeinsert.dev',
			data : {
				wno: ${til.bno},
				name : $("#scrapper").val()
			},
			success : function (res) { 
				alert("좋아요 성공");
				location.reload();
			},
			error: function (e) {
				console.log("e: "+e.status);
			}
		}) 
	})
	
	
	
	$(document).on("click", "#likedelete", function () {
		$.ajax({
			type: "post",
			url: '${path}/ajax/likedelete.dev',
			data : {
				no :${til.no},
				wno:${til.bno},
				name : $("#scrapper").val()
			},
			success : function (res) {
				alert("좋아요 취소");
				location.reload();
			},
			error: function (e) {
				console.log("e: "+e.status); 
				
			}
		})
	})   */
	
	
	
	})



</script>


</body>
</html>
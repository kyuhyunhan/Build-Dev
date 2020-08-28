<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
/*
	.list-group-item[]
	{
		backgroud-color : #8572EE !important;
		border-color : #8572EE;
	}
	.box {
		 position: absolute;
		  top: 100px;
		  left : 300px;
		  right: 0;
		  width: 200px;
	}
*/
	.img-change-box {
		width : 100%;
		height: 200px;
		border-bottom : 2px solid grey;
		margin : 50px;
	}
	img {
		position : absolute;
		left: 100px;
		border-radius: 50%;
	}
	.userid {
		position : absolute;
		left : 300px;
		font-size : 40px;
	}
	.img-change-button {
		text-decoration : none;
		position : absolute;
		left : 300px;
		margin-top : 130px;
		font-size : 18px;
	}
	.update-form {
		position : absolute;
		left : 150px;
		font-size: 20px;
	}
	.modalfont {
		font-weight : bold;
		font-size : 15px;
		padding : 10px;
	}
	.modalinput {
		position : absolute;
		left : 200px;
	}
	.find-result {
		text-align : center;
		font-size : 20px;
		padding-bottom : 30px;
	}
	.img-container {
		display: flex;
		justify-content: flex-start;
		align-items: center;
	}
	.img-container .img-content {
		height: 420px;
		width: 470px;
	}
	.img-container .img-content #canvas {
		max-height: 400px;
		max-width: 450px;
	}
	.img-container .img-content:last-child {
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
<script>
	$(function(){
		$("#changePW").on("click",function(){
			$.ajax({
				url : "${path}/ajax/changepw.dev",
				type : "post",
				data : {
					id : "${user.id}",
					currentpw : $("#currentpw").val(),
					newpw : $("#newpw").val(),
					newpw2 : $("#newpw2").val()
				},
				success : function(a) {
					$(".modalinput").val("");
					$(".modalinput").hide();
					$(".modalfont").hide();
					$("#changePW").hide();
					$(".find-result").text(a);
					$(".find-result").show();
					location.reload();
				},
				error : function(e) {
					alert("오류 발생")
				}
			})
		})
		$(".modal-close").on("click", function () {
		$(".modalfont").show();
		$(".modalinput").show();
		$(".find-result").hide();
		$("#changePW").show();
	})
		
	})
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:50px">    
		<div class="row content">
			<div class="col-sm-4 sidenav">
			<%--
				<div class="box">
					<div class="list-group">
					  <a href="#" class="list-group-item active"><strong>회원 정보 수정</strong></a>
					  <a href="#" class="list-group-item">My Portfolio</a>
					  <a href="#" class="list-group-item">My TIL</a>
					</div>
				</div>
			 --%>
			</div>
			
			<div class="col-sm-4 text-left" style="text-align:center">
			 
				<h1><strong>회원 정보 수정</strong></h1>
				<div class="img-change-box">
					<img src="${path}/profile/${loginUser.name}.jpg" width="150" height="160" id="profileimg">
					<div class="userid">
						<strong>${user.id}</strong>
						<div style="font-size:20px;">
							누적 경고 횟수 : ${loginUser.alertnum}
						</div>
					</div>
					<div class="img-change-button">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#img-btn">프로필 이미지 변경하기</button>
					</div>
				</div>
				
				<form:form modelAttribute="user" method="post" action="update.dev" class="update-form" onsubmit="return inputcheck(this)">
					<form:input type="hidden" path="id" value="${user.id}"/>
					<spring:hasBindErrors name="user">
						<font color="red">
							<c:forEach items="${errors.globalErrors}" var="error">
								<spring:message code="${error.code}"/>
							</c:forEach>
						</font>
					</spring:hasBindErrors>
					<table>
						<tr>
							<td>이름</td>
							<td>
								<form:input path="name"/>
								<font color="red">
									<form:errors path="name"/>
								</font>
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<form:input path="email"/>
								<font color="red">
									<form:errors path="email"/>
								</font>
							</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>
								<form:input path="phone"/>
								<font color="red">
									<form:errors path="phone"/>
								</font>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<form:password path="pw"/>
								<font color="red">
									<form:errors path="pw"/>
								</font>
							</td>
							<td>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changePwModal">비밀번호 변경하기</button>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="수정">
								<input type="button" value="탈퇴하기" onclick="location.href='delete.dev?name=${loginUser.name}'">
							</td>
						</tr>
					</table>
					
					
					<div class="modal fade" id="changePwModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title" id="exampleModalLabel">비밀번호 변경하기</h4>
					        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button> -->
					      </div>
					      <div class="modal-body" id="changePw-modalbody">
					      		<font class="modalfont">현재 비밀번호</font> <input type="text" id="currentpw" class="modalinput"><br><br>
					        	<font class="modalfont">변경 비밀번호</font> <input type="text" id="newpw" class="modalinput"><br><br>
					        	<font class="modalfont">변경 비밀번호 재입력</font> <input type="text" id="newpw2" class="modalinput">
					        	<div class="find-result"></div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary modal-close" data-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" id="changePW">비밀번호 변경하기</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					<div class="modal fade" id="img-btn" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" style="max-width: max-content; margin: 28px auto;">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title">프로필 이미지</h4>
					      </div>
					      <div class="modal-body">
					      	<div class="img-container">
					      		<div class="img-content"><input type="file" id="profile"><canvas id="canvas"></canvas></div>
					      		<div class="img-content" id="crop-content"><canvas id="canvas_crop"></canvas></div>
					      	</div>
					      </div>
					      <div class="modal-footer">
					      	<button type="button" class="btn btn-secondary modal-close" data-dismiss="modal">닫기</button>
					      	<button type="button" class="btn btn-primary" id="imgchangebtn">변경</button>
					      </div>
					    </div>
					  </div>
					</div>
					
				</form:form>
				
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
		</div>
	</div>
	<script>
		function inputcheck(form) {
			if(form.pw.value != ${loginUser.pw}) {
				alert("비밀번호를 확인하세요");
				form.pw.focus();
				return false;
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			var profile = $("#profile");
			var canvas = $("#canvas");
			var canvas_crop = $("#canvas_crop");
			var crop_content = $("#crop-content");
			var clsImage;
			var iCropLeft, iCropTop, iCropWidth, iCropHeight;
			crop_content.hide();
			profile.change(function() {
				crop_content.show();
				var clsFileReader = new FileReader();
				clsFileReader.onload = function() {
					clsImage = new Image();
					clsImage.onload = function() {
						var canvas = document.getElementById("canvas");
						canvas.width = clsImage.width;
						canvas.height = clsImage.height;

						iCropLeft = 100;
						iCropTop = 100;
						/* iCropWidth = clsImage.width - 200;
						iCropHeight = clsImage.height - 200; */
						iCropWidth = 400;
						iCropHeight = 400;
						iImageWidth = clsImage.width;
						iImageHeight = clsImage.height;

						DrawCropRect();
						CropImage();
						AddCropMoveEvent();
					};

					clsImage.src = clsFileReader.result;
				};

				clsFileReader.readAsDataURL(profile[0].files[0]);
			})
			
			function DrawCropRect() {
			var canvas = document.getElementById("canvas");
			var ctx = canvas.getContext("2d");

			ctx.drawImage(clsImage, 0, 0);

			ctx.strokeStyle = "#fff";
			ctx.lineWidth = 10;
			ctx.beginPath(); // 새로운 경로 생성
			ctx.rect(iCropLeft, iCropTop, iCropWidth, iCropHeight);
			ctx.stroke(); // 도형을 그린다.
		}
			
			function AddCropMoveEvent() {
				var canvas = document.getElementById("canvas");
				var bDrag = false;
				var iOldX, iOldY;
				var iCropLeftOld, iCropTopOld;

				canvas.onmousedown = function(e) {
					bDrag = true;
					iOldX = e.clientX;
					iOldY = e.clientY;
					iCropLeftOld = iCropLeft;
					iCropTopOld = iCropTop;
				};

				canvas.onmousemove = function(e) {
					if (bDrag == false)
						return;

					var iX = e.clientX - iOldX;
					var iY = e.clientY - iOldY;

					iCropLeft = iCropLeftOld + iX;
					if (iCropLeft < 0) {
						iCropLeft = 0;
					} else if (iCropLeft + iCropWidth > clsImage.width) {
						iCropLeft = clsImage.width - iCropWidth;
					}

					iCropTop = iCropTopOld + iY;
					if (iCropTop < 0) {
						iCropTop = 0;
					} else if (iCropTop + iCropHeight > clsImage.height) {
						iCropTop = clsImage.height - iCropHeight;
					}

					DrawCropRect();
					CropImage();
				};

				canvas.onmouseup = function(e) {
					bDrag = false;
				};
			}
			
			function CropImage() {
				var canvas = document.getElementById("canvas");
				img = new Image();
				img.onload = function() {
					var canvas = document.getElementById("canvas_crop");
					canvas.width = iCropWidth;
					canvas.height = iCropHeight;
					var ctx = canvas.getContext("2d");
					ctx.drawImage(img, iCropLeft, iCropTop, iCropWidth,
							iCropHeight, 0, 0, iCropWidth, iCropHeight);
				};

				img.src = canvas.toDataURL();
			}
			
			$("#imgchangebtn").on("click", function () {
				var canvas = document.getElementById("canvas_crop");
				var imgDataUrl = canvas.toDataURL('image/jpeg');
				
				var blobBin = atob(imgDataUrl.split(',')[1]);	
			    var array = [];
			    for (var i = 0; i < blobBin.length; i++) {
			        array.push(blobBin.charCodeAt(i));
			    }
			    var file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});	
			    var formdata = new FormData();	
			    formdata.append("files", file);	
			    
			    $.ajax({
			        type : 'post',
			        url : '${path}/ajax/saveprofile.dev',
			        data : formdata,
			        processData : false,	
			        contentType : false,	
			        success : function (data) {
			        	alert("프로필이 변경되었습니다.");
			        	location.reload();
			        }
			    });
			})
		})
	</script>
</body>
</html>
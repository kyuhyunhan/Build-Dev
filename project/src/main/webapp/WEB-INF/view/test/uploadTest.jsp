<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadTest</title>
<style type="text/css">
#custom-buttom {
	padding: 10px;
	background: linear-gradient(45deg, crimson, #009578);
	cursor: pointer;
	color: #fff;
	transition: all 0.3s;
	border-radius: 50px;
	border: none;
	width: 100px;
}
#close, #submit{
	background: black;
	cursor: pointer;
	color: #fff;
	transition: all 0.3s;
	border-radius: 50px;
	border: none;
	width: 100px;
	height: 20px;
}
#fileview {
	padding: 0;
}
li {
	font-family: sans-serif;
	color: #000;
	list-style: none;
}
.image-preview {
	width: 100%;
	height: 100%;
	border: 2px solid #dddddd;
	margin: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	color: #cccccc;
}
.image-preview__image {
	display: block;
	width: 100%;
}

ul#fileview {
	margin: 0 auto;
	padding: 0;
	float: left;
}

ul#fileview li {
	list-style: none;
	margin: 5px;
	width: 100px;
	height: 100px;
	border: 1px solid rgba(0, 0, 0, .2);
	overflow: hidden;
}

ul#fileview li img {
	width: 100%;
	height: 100%;
}

.imgBox {
	float: left;
	width: 500px;
	height: 500px;
	border: 1px solid rgba(0, 0, 0, .2);
	margin: 0;
	padding: 0;
	overflow: hidden;
}

.imgBox img {
	width: 100%;
	height: 100%;
}
#modal {
	position: fixed;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 600px;
	padding: 50px;
	box-sizing: 0 5px 30px rgba(0, 0, 0, .30);
	background: #fff;
	visibility: hidden;
	opacity: 0;
	transition: 0.5s;
	padding: 0;
}
#modal.active {
	top: 50%;
	visibility: visible;
	opacity: 1;
	transition: 0.5s;
}
#custom-buttom.active {
	filter: blur(20px);
	pointer-events: none;
	user-select: none;
}
#fileviewList {
	overflow: auto;
	height: 500px;
	width: 140px;
}
</style>
</head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
<input type="file" id="real-file" hidden="hidden" multiple accept=".jpg,.jpeg,.png,.gif">
<button type="button" id="custom-buttom">File</button>
<div id="modal">
<div class="image-preview" id="imagePreview">
<div id="fileviewList">
<ul id="fileview">
</ul>
</div>
<div class="imgBox">
	<img src="">
</div>
</div>
	<button type="button" id="close">Close</button>
	<button type="button" id="submit">Submit</button>
</div>

 <script type="text/javascript">
$(function(){
	 var realFileBtn = $("#real-file");
	 var customBtn = $("#custom-buttom");
	 var customTxt = $("#custom-text");
	 var fileList = [];
	 var fileview = $("#fileview");
	 var modal = $("#modal");
	 view_fileList();
	 
		
	 customBtn.on("click", function(e) {
		 realFileBtn.click();
	 });
	 
	 realFileBtn.on("change", function(e) {
		 files = realFileBtn[0].files;
	 	 $.each(files, function(i, val) {
	 		console.log(val);
	 	 	fileList.push(val);
	 	 })
	 	 
	 	 toggle();
	 	view_fileList();
	 });
	 
	function view_fileList() {
		if(fileList.length == 0) {
			fileview.html("<li> No file chosen, yet </li>");
			return;
		}
		fileview.html("");
		$.each(fileList, function(i, val) {
			var reader = new FileReader();
			reader.onload = function (e) {			
				console.log(e);
				fileview.append("<li><a href='"+i+"' target ='imgBox'><img src='"+e.target.result+"' class='image-preview__image'></a></li>") 
				$(".imgBox img").attr("src", e.target.result);
			}
			reader.readAsDataURL(val);
		})
	} 

	$(document).on("click", "#fileview a", function (e) {
		e.preventDefault();
		console.log(fileList);
		var file = fileList[$(this).attr("href")];
		console.log(file);
		var reader = new FileReader();
		reader.onload = function (e) {			
			console.log(e);
			$(".imgBox img").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
	})
	
	function toggle() {
		var customBtn = $("#custom-buttom");
		var modal = $("#modal");
		customBtn.toggleClass("active");
		modal.toggleClass("active");
	}
	$("#close").on("click", function(e) {
		toggle();
	})
	
	$("#submit").on("click", function(e) {
		console.log(fileList);
		var formData = new FormData();
		$.each(fileList, function (i, v) {
			formData.append("files",v);
		})
		
		console.log(formData);
		for(var pair of formData.entries()) {
			console.log(pair[0] + ", " + pair[1]);
		}
		
		$.ajax({
			url: '${path}/ajax/fileupload.sns',
			type: "post",
			data: formData,
			processData: false,
		    contentType: false,
			success: function(response){
				alert("ajax 성공");
				$("#real-file").val("");
			}
		})
	})

})
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIL 작성</title>
<style type="text/css">
.container {
	margin: 85px 25vw;
	border: 1.5px solid #222;
	border-radius: 10px;
	padding: 0 10px;
	background: #fff;
	box-shadow: 5px 5px 5px rgba(0,0,0,0.5);
	border-bottom: none;
	border-right: none;
}
.container .header {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	padding: 20px 0;
}
.container form {
	margin: 10px 0 0 0;
}
.container table {
	width: 100%;
	border-collapse: collapse;
}
.container table th,
.container table td {
	padding: 5px;
	text-align: center;
	font-size: 15px;
	border: 1.5px solid #ddd;
}
.container table td input[type="text"] {
	width: calc(100% - 15px);
}
.container table tr:nth-child(even) {
	background-color: #f2f2f2;
}
.container table tr:hover {
	background-color: #ddd;
}
.container table tr:last-child:hover {
	background-color: #fff;
}
.container table .open {
	display: flex;
	justify-content: center;
}
.container table .footer {
	margin: 10px 0;
}
.container table .footer a {
	text-decoration: none;
	margin: 10px;
	padding: 5px 8px;
	color: #8572EE;
	background: #fff;
	border: 1px solid #8572EE;
	border-radius: 5px;
	font-weight: bold;
	transition: 0.5s;
}
.container table .footer a:hover {
	color: #fff;
	background: #ee5454;
	border: none;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, .2);
}
.hashtag-container {
	height: 40px;
}
.hashtag {
	display: flex;
	flex-wrap: wrap;
	margin: 5px;
	align-items: center;
	height: 32px;
	justify-content: flex-start;
	flex-direction: column;
	position: absolute;
}
.hashtag .tag {
	height: 30px;
	margin: 0;
	padding: 0 5px;
	border: 1px solid #fff;
	border-radius: 3px;
	background: #fff;
	display: flex;
	align-items: center;
	color: #333;
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.2), inset 0 1px 1px #fff;
	cursor: pointer;
	font-weight: bold;
	margin-right: 5px;
}
.tag i {
	font-size: 16px;
	color: #666;
	margin-left: 5px;
}
</style>
</head>
<body>
<div class="container">
<div class="header">TIL(Today I Learned)</div> 
<form:form modelAttribute="til" action="write.dev" method="post" name="f">
	<table>
	<tr><th>제목</th><td><form:input path="title" /></td></tr>
	<tr><th>작성자</th><td>${loginUser.name}</tr>
	<tr><th>공개여부</th><td><div class="open"><form:radiobutton path="open" value="0" label="공개(public)"/><br/>
			<form:radiobutton path="open" value="1" label="비공개(private)"/></div></td></tr>
	<tr><th>관련 기술</th><td>
	<input type="text" id="hashinput"/>
	<div class="hashtag-container">					
	<div class="hashtag"></div>
	</div></td></tr>
	<form:hidden path="name" value="${loginUser.name}" size="40%" readonly="true"/>
	<tr><td colspan="2"><form:textarea path="content" rows="15" cols="80" />
	<script>CKEDITOR.replace("content",{filebrowserImageUploadUrl : "imgupload.shop"});</script>
	</td></tr>
	
	<tr><td colspan="2">
		<div class="footer">
		<a href="#" id="submit">등록</a>
		<a href="list.dev">게시글 목록</a>
		</div></td></tr>
	</table>
</form:form>
</div>
<script type="text/javascript">
	$(function() {
		
		$("#submit").on("click", function (event) {
			event.preventDefault();
			var hash = {hash : tags,
					no : 3};
			$.ajax({
				url: '${path}/ajax/hashtag.dev',
				type: "post",
				data: hash,
				traditional: true,
				success: function(response){
					javascript:document.f.submit();
				}
			})
			return true;
		})
		
		const tagContainer = document.querySelector('.hashtag-container .hashtag');
		const input = document.querySelector('#hashinput');
		
		let tags = [];

		function createTag(label) {
		  const div = document.createElement('div');
		  div.setAttribute('class', 'tag');
		  const span = document.createElement('span');
		  span.innerHTML = label;
		  const closeIcon = document.createElement('i');
		  closeIcon.innerHTML = '';
		  closeIcon.setAttribute('class', 'fa fa-times');
		  closeIcon.setAttribute('data-item', label);
		  div.appendChild(span);
		  div.appendChild(closeIcon);
		  return div;
		}

		function clearTags() {
		  document.querySelectorAll('.tag').forEach(tag => {
		    tag.parentElement.removeChild(tag);
		  });
		}

		function addTags() {
		  clearTags();
		  tags.slice().reverse().forEach(tag => {
		    tagContainer.prepend(createTag(tag));
		  });
		}

		input.addEventListener('keyup', (e) => {
		    if (e.key === 'Enter') {
		    if (e.target.value.trim() == "" ){
			    	return;
			}else if (e.target.value.trim().length > 20 ){
		    	alert("10자 이하만 가능합니다.");
		    }else if (tags.length >= 5) {
				alert("기술을 5개까지만 입력이 가능합니다.");
			}else {
				e.target.value.split(',').forEach(tag => {
			        tags.push(tag);  
			 });
				      
				addTags();
				var length = 0;
				console.log(e.target.value.length);
		    	
				input.value = '';
				console.log(tags);
			}
		    }
		});
		document.addEventListener('click', (e) => {
		  console.log(e.target.tagName);
		  if (e.target.tagName === 'I') {
		    const tagLabel = e.target.getAttribute('data-item');
		    const index = tags.indexOf(tagLabel);
		    tags = [...tags.slice(0, index), ...tags.slice(index+1)];
		    addTags();    
		  }
		})
	})
</script>
</body>
</html>
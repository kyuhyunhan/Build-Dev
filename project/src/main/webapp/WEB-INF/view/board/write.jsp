<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 60%;
	margin: auto;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
.hashtag-container {
	margin: 0;
	width: 100%;
}

.hashtag {
	display: flex;
	flex-wrap: wrap;
	margin: 5px;
	width: calc(100% - 10px);
	align-items: center;
	height: 32px;
	justify-content: flex-start;
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

#hashinput {
	width: 100%;
}

.tag i {
	font-size: 16px;
	color: #666;
	margin-left: 5px;
}
</style>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form:form modelAttribute="board" action="write.dev"
		enctype="multipart/form-data" name="f">

		<table id="customers">
	<c:if test="${no==4 }">
	<tr><td colspan="2" align="center" style="padding: 1px;"><h4 style="font-size: 15px">QnA게시판</h4></td></tr>
	</c:if>
		<c:if test="${no==5 }">
	<tr><td colspan="2" align="center" style="padding: 1px;"><h4 style="font-size: 15px">자유 게시판</h4></td></tr>
	</c:if>
		<c:if test="${no==10 }">
	<tr><td colspan="2" align="center" style="padding: 1px;"><h4 style="font-size: 15px">건의 게시판</h4></td></tr>
	</c:if>
		<c:if test="${no>=100 }">
	<tr><td colspan="2" align="center" style="padding: 1px;"><h4 style="font-size: 15px">그룹 공지사항</h4></td></tr>
	</c:if>

	<tr><td align="center">글쓴이</td><td><form:input path="name"  value="${loginUser.name}" size="40%" readonly="true" /></td>
			
			</tr>

			<tr>
				<td align="center">제목</td>
				<td><form:input path="title" size="100%;" /></td>
			</tr>
			<c:if test="${no ==4 }">
			<tr>
				<td>사용될 기술</td>
				<td>

					<div class="hashtag-container">
						<div class="hashtag">
							<input type="text" id="hashinput"/>
						</div>
					</div>

				</td>
			</tr>
			</c:if>
			<tr>
				<td align="center">내용</td>
				<td><form:textarea path="content" rows="15" cols="80" /> <script>
					CKEDITOR.replace("content", {
						filebrowserImageUploadUrl : "imgupload.dev"
					});
				</script> <font color="red"><form:errors path="content" /></font></td>
			</tr>

			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[게시글등록]</a>
					<a href="list.dev?no=${no }">[게시글목록]</a></td>
			</tr>
		</table>
		<input type="hidden" name="no" value="${no }">
	</form:form>
	
	<script type="text/javascript">
		$(function() {
			const tagContainer = document.querySelector('.hashtag');
			const input = document.querySelector('.hashtag input');
			const hashinput = $("#hashinput");
			
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
			    	console.log(hashinput.parent().children(".tag"));
			    	$.each(hashinput.parent().children(".tag"), function(i, v) {
			    		console.log($(this).width());
			    		length += $(this).width() + 25;
			    	})
			    	console.log(hashinput.width());
			    	hashinput.css({'width': "calc(100% - "+length+"px)"});
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
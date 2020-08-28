<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style type="text/css">
.slider-box {
	height: 300px;
	border: 3px solid #000;
}
.slider {
	background: url(${path}/img/s1.png);
	background-size: cover;
	height: 300px;
	width: 300px;
	margin: 0 auto;
	transition: 3s;
}
.slider-box {
	margin: 20px;
	margin-bottom: 50px;
}
.content {
	display: flex;
	justify-content: center;
	align-items: center;
}
.content .board {
	padding: 0 50px;
}
.content .board table {
	width: 500px;
	border-collapse: collapse;
	border-top: 3px solid #000;
	border-bottom: 3px solid #000;
}
.content .board table td{
	border-collapse: collapse;
	border-top: 1px solid #000;
	text-align: center;
}
.content .board table td{
	text-align: center;
}
.content .board table caption{
	font-size: 20px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="slider-box">
	<div class="slider"></div>
</div>

<div class="content">
	<div class="board">
		<table>
			<caption>Co-Working</caption>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>테스트 입니다.</td>
				<td>테스트 중</td>
				<td>2020-08-10</td>
			</tr>
		</table>
	</div>
	<div class="board">
		<table>
			<caption>Q&A 게시판</caption>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
			<tr>
				<td>Test123</td>
				<td>Test123</td>
				<td>2020-08-10</td>
			</tr>
		</table>
	</div>
	<div class="board">
		<table>
			<caption>자유 게시판</caption>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
			<tr>
				<td>제목 입니다.</td>
				<td>작성자 입니다.</td>
				<td>등록일 입니다.</td>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript">
$(function() {
	var imgList = ["s2.png","s3.png","s1.png"];
	var idx = 0;
	setInterval(function() {
		if(idx == imgList.length) idx = 0;
		$(".slider").css("background", "url(${path}/img/"+imgList[idx]+")");
		$(".slider").css("background-size", "cover");
		idx++;
	}, 5000)
})
</script>
</body>
</html>
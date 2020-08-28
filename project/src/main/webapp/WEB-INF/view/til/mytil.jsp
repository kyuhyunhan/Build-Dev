<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My TIL</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.containers {
	margin: 0;
	padding: 0;
	max-width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}
.containers .header_Area {
	width: 100vw;
	height: 30vh;
	background: linear-gradient(45deg, #ee5454, #8572EE);
}
.containers .header_Area .search_Area {
	text-align: center;
	padding: 70px;
}
.containers .header_Area .search_Area h2 {
	color: #fff;
	font-style: italic;
	font-weight: bold;
	font-size: 3rem;
	margin-top: 2vh;
}

.containers .content {
	display: flex;
	justify-content: flex-start;
	padding: 0 10vw;
	margin-top: 30px;
	width: 100%;
}
.containers .content .optionbox{
	width: 20%;
	padding: 20px 10px;
}

.containers .content .contentbox{
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	width: 100%;
	justify-content: center;
}
.containers .content .containers-fluid {
	padding: 15px;
	margin: 0;
	width: auto;
} 
.card {
	position: relative;
	width: 250px;
	height: 185px;
	overflow: hidden;
	font-family: 'Roboto Condensed', sans-serif !important;
	transition: 0.5s;
}
.card:hover {
	box-shadow: 5px 5px 5px rgba(0, 0, 0, .1);
}
.card:hover hr {
	background: #ddd;
}
.card .news-content {
	position: absolute;
	padding: 10px 20px 60px;
	background: #fff;
	transition: .5s;
	height: 155px;
	width: 250px;
}


.card .news-content .post-meta {
	font-size: 12px;
	margin: 3px 0;
}

.card .news-content .post-meta .author a {
	text-decoration: none;
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

.card .news-content .post-meta .time {
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

.card .news-content .post-meta .author a:hover {
	color: #DF084A;
}

.card .news-content .post-header {
	margin: 0;
	padding: 10px 0;
	color: #007DA6;
	height: 40px;
	font-size: 18px;
	overflow: hidden;
	font-weight: bold;
}

.card .news-content .hashlist {
	font-size: 16px;
	margin: 10px 0 0;
	padding: 0;
	color: black;
	transition: .5s;
	opacity: 1;
	height: 70px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.card:hover .news-content .hashlist a:hover {
	color: #DF084A;
	cursor: pointer;
}
.hr {
	margin: 0;
}
.card .news-content .post-footer .like .fa-heart:before {
	color: #f00;
}
</style>
</head>
<body>
	<div class="containers">
		<div class="header_Area">
			<div class="search_Area">
				<h2>Organize your knowledge.</h2>
			</div>
		</div>
		<div class="content">
			<div class="contentbox">
			<c:forEach var="data" items="${tillist}">
				<div class="containers-fluid">
					<div class="containers">
						<div class="row">
							<div class="col-sm-4">
								<div class="card">
									<div class="news-content">
										<h2 class="post-header">
											<a href="${path}/til/info.dev?bno=${data.bno}&no=${data.no}">${data.title }
											</a>
										</h2>
										<hr class="hr">
										<div class="post-meta">
											<span class="author"><a href="#"> <i class="fa fa-user"></i> ${data.name }</a></span> 
											<span class="time"> <i class="fa fa-clock-o"></i> <fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd" /></span>
										</div>
										<div class="hashlist">
											<c:forEach var="hash" items="${data.hashlist }">
												<a><span>#${hash }</span></a>&nbsp;
											</c:forEach>
										</div>
										<div class="post-footer">
											<div class="like"><i class="fa fa-heart"></i> ${data.point}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="optionbox">
				<div class="hashbox">
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>

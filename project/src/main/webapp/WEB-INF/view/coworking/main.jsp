<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Co-Working</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap')
	;
body {
	overflow-x: hidden;
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
.card .news-content {
	position: absolute;
	top: +30px;
	padding: 10px 20px 60px;
	background: #fff;
	transition: .5s;
	height: 155px;
	width: 250px;
}

.card .category {
	position: absolute;
	height: 30px;
	line-height: 20px;
	text-align: center;
	color: #fff;
	text-transform: uppercase;
	padding: 5px 20px;
	font-size: 16px;
	font-weight: bold;
	transition: .5s;
	width: 250px;
}

.card .news-content .post-meta {
	font-size: 12px;
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

.card .news-content .post-meta .grade {
	text-decoration: none;
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

.card .news-content .post-meta .date {
	text-decoration: none;
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
	float: right;
}

.card .news-content .post-meta .author a:hover {
	color: #DF084A;
}

.card .news-content .post-meta .grade a:hover {
	color: #DF084A;
}

.card .news-content .post-header {
	margin: 0;
	padding: 10px 0;
	color: #007DA6;
	height: 50px;
	font-size: 18px;
	overflow: hidden;
	font-weight: bold;
}

.card .news-content .hashlist {
	font-size: 16px;
	margin: 0 0 10px;
	padding: 0;
	color: black;
	transition: .5s;
	opacity: 1;
	height: 40px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.card:hover .news-content .hashlist a:hover {
	color: #DF084A;
	cursor: pointer;
}

.containers {
	margin: 0;
	padding: 0;
	max-width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
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

.containers .content .optionbox .hashbox #hashinput {
	width: 100%;
	margin-top: 20px;
	padding-left: 5px;
}

.containers .content .optionbox .hashbox #searchhash {
	margin-top: 10px;
	background: #00b8f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.5s;
}
.containers .content .optionbox .hashbox #searchhash:hover {
	box-shadow: 3px 3px 3px rgba(0, 0, 0, .2);
}
.containers .content .optionbox .hashbox #searchhash i {
	color: #fff;
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

.containers .searchArea {
	width: 100vw;
	margin-top: 4vh;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 10vw;
}

.containers .searchArea .filter {
	float: left;
	padding: 0;
	font-size: 18px;
	font-weight: bold;
}

.containers .searchArea .filter a {
	text-decoration: none;
	color: #000;
	padding: 3px 5px;
	transition: 0.5s;
}
.containers .searchArea .filter span a {
	border-bottom: 2px solid #fff;
}
.containers .searchArea .filter span a:hover {
	border-bottom: 2px solid #f00;
	transition: 0.5s;
}
.containers .searchArea .plus {
	float: right;
	padding: 0;
}

.containers .searchArea .plus .box {
	border: 2px solid lightblue;
	background: #CCE1FF;
	border-radius: 5px;
	width: 34px;
	height: 34px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	transition: 0.5s;
}
.containers .searchArea .plus .box:hover {
	box-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
}

.containers .searchbox {
	padding: 0;
}

.containers .searchbox input {
	position: relative;
	display: inline-block;
	font-size: 20px;
	box-sizing: border-box;
}

.containers .searchbox input[type="text"] {
	background: #fff;
	width: 220px;
	height: 31px;
	border: 1px solid #000;
	outline: none;
	padding: 0 0 0 20px;
	border-radius: 20px 0 0 20px;
	font-family: Poppins;
}

.containers .searchbox select {
	position: relative;
	left: -7px;
	border: 1px solid #000;
	top: -1px;
	outline: none;
	background: #fff;
	font-size: 18px;
	padding: 0 10px;
	height: 31px;
}

.containers .searchbox button {
	position: relative;
	left: -5px;
	width: 90px;
	outline: none;
	cursor: pointer;
	background: #FF5757;
	color: #fff;
	top: -2px;
	font-size: 20px;
	border-radius: 10px;
	border: 2px solid pink;
	line-height: 30px;
}

.containers .searchbox button:hover {
	background: #ef296c;
}

.containers .buttonbox {
	position: relative;
	margin: 0;
	padding: 0;
}

.checkbox-btn {
	position: relative;
	width: 100px;
	height: 30px;
	margin: 0 auto;
}

.checkbox-btn input {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: block;
	cursor: pointer;
	opacity: 0;
	z-index: 1;
}

.checkbox-btn div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border: 2px solid #000;
	border-radius: 4px;
	/* box-shadow: 0 10px 20px rgba(0,0,0,0.5); */
	overflow: hidden;
}

.checkbox-btn div .slide {
	position: absolute;
	top: 0;
	left: 0;
	width: 10px;
	height: 30px;
	background: #000;
	transition: 0.5s;
}

.checkbox-btn input:checked+div .slide {
	transform: translateX(90px);
}

.checkbox-btn .slide:before {
	content: '마감순';
	position: absolute;
	top: -3px;
	left: -90px;
	text-align: center;
	width: 90px;
	height: 100%;
	background: #00da00;
	line-height: 30px;
	font-weight: bold;
	color: #fff;
}

.checkbox-btn .slide:after {
	content: '최신순';
	position: absolute;
	top: -3px;
	right: -90px;
	text-align: center;
	width: 90px;
	height: 100%;
	background: #A49CD9;
	line-height: 30px;
	font-weight: bold;
	color: #fff;
}
.containers .header_Area {
	width: 100vw;
	height: 30vh;
	background: linear-gradient(45deg, #54a0ee, #8572EE);
}
.containers .header_Area .search_Area {
	text-align: center;
	padding: 70px;
}
.containers .header_Area .search_Area h2 {
	color: #fff;
	font-style: italic;
	font-weight: bold;
	font-size: 2rem;
}
.containers .header_Area .search_Area .search {
	padding: 30px;
	display: flex;
	justify-content: center;
}
.containers .header_Area .search_Area .search input {
	width: 15vw;
	border-radius: 5px;
	border: none;
	height: 40px;
	padding-left: 20px;
}
.containers .header_Area .search_Area .search input:focus {
	outline: none;
}
.containers .header_Area .search_Area .search .search_button {
	width: 40px;
	height: 40px;
	background: #fff;
	border-radius: 5px;
	margin-left: 5px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	transition: 0.5s;
}

.containers .header_Area .search_Area .search .search_button:hover {
	box-shadow: 3px 3px 3px rgba(0, 0, 0, .2);
}
.containers .header_Area .search_Area .search .search_button i {
	color: #54a0ee;
}
.scrollTop {
	position: fixed;
	bottom: 800px;
	right: 40px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	background-size: 40px;
	background-position: center;
	background-repeat: no-repeat;
	cursor: pointer;
	z-index: 100000;
	visibility: hidden;
	opacity: 0;
	transition: 0.5s;
	border: 2px solid #000;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: 0.5s;
	background: #fff;
}
.scrollTop:hover {
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5)
}
.scrollTop.active {
	visibility: visible;
	opacity: 1;
	bottom: 40px;
}
.scrollTop .fa {
	font-size: 30px;
}
</style>
</head>
<body>
<div class="scrollTop" onclick="scrollToTop()"><i class="fa fa-arrow-up"></i></div>
	<div class="containers">
		<div class="header_Area">
			<div class="search_Area">
				<h2>Don't do it alone, Do it together</h2>
				<div class="search">
				<input type="text" placeholder="Search..." id="searchinput">
				<div class="search_button" id="search"><i class="fa fa-search"></i></div>
				</div>
			</div>
		</div>
		<div class="searchArea">
			<div class="filter">
				<span><a href="#">전체</a>&nbsp;/</span> <span><a href="#">스터디</a>&nbsp;/</span>
				<span><a href="#">프로젝트</a>&nbsp;/</span> <span><a href="#">공모전</a></span>
			</div>
			<!-- <div class="buttonbox">
				<div class="checkbox-btn">
					<input type="checkbox" name="">
					<div>
						<span class="slide"></span>
					</div>
				</div>
			</div> -->
			<!-- <div class="searchbox">
				<input type="text" placeholder="Type...." id="searchinput">
				<select id="searchtype">
					<option value="title">제목</option>
					<option value="hashname">해시태그</option>
				</select>
				<button type="button" id="search">Search</button>
				<input type="button" value="페이지 새로 고침" onClick="window.location.reload()">
			</div> -->
			<div class="plus">
				<div class="box">
					<a href="register.dev"><i class="fa fa-plus"></i></a>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="optionbox">
				<div class="checkbox-btn">
					<input type="checkbox" name="">
					<div>
						<span class="slide"></span>
					</div>
				</div>
				<div class="hashbox">
					<input type="text" placeholder="관련 기술" id="hashinput">
					<div class="search_button" id="searchhash"><i class="fa fa-search"></i></div>
				</div>
			</div>
			<div class="contentbox">
			<c:forEach var="data" items="${list }">
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" var="now2" pattern="yyyyMMdd"/>
				<fmt:parseNumber value="${now2}" var="today" integerOnly="true"/>
				<fmt:formatDate value="${data.deadline}" var="dl" pattern="yyyyMMdd"/>
				<fmt:parseNumber value="${dl}" var="deadline" integerOnly="true"/>
				<div class="containers-fluid">
					<div class="containers">
						<div class="row">
							<div class="col-sm-4">
								<div class="card">
								<span class="category" style="background: ${data.category == '스터디'? '#00B8F4': data.category == '프로젝트'? '#00FF7F' : '#EE82EE' }">${data.category == "스터디"? "Study": data.category == "프로젝트"? "Project" : "Contest" }</span>
									<div class="news-content">
										<div class="post-meta">
											<span class="author"><a href="#"> <i class="fa fa-user"></i> ${data.name }</a></span> 
											<span class="time"> <i class="fa fa-clock-o"></i> <fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd" /></span>
											<span class="grade"> <i class="fa fa-graduation-cap"></i> ${data.grade}</span>
											<div class="clearfix"></div>
										</div>
										<h2 class="post-header">
											<a href="${path}/coworking/details.dev?gno=${data.gno}&name=${loginUser.name}">${data.title }
											</a>
										</h2>
										<div class="hashlist">
											<c:forEach var="hash" items="${data.hashlist }">
												<a><span>#${hash }</span></a>&nbsp;
											</c:forEach>
										</div>
										<div class="post-meta">
											<span class="date">
											<c:if test="${(deadline - today) == 0}">
													당일 마감
											</c:if>	
											<c:if test="${(deadline - today) != 0}">
													마감 ${deadline - today}일 전
											</c:if>	
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			var category = 0;
			var num = 12;
			
			$(".containers .searchArea .plus .box").click(function() {
				location.href = "register.dev";
			})
			
			$(window).scroll(function () {
				var scrollHeight = $(window).scrollTop() + $(window).height(); 
				var documentHeight = $(document).height();
				if(scrollHeight == documentHeight) {
					console.log("SCROLL");
					datasearch(input, type, sort, category, num, 8);
					num += 8;
				}
			})
			var sidx = 1;
			$(".containers .searchArea .filter span:nth-child("+sidx+") a").css("border-bottom", "2px solid #f00");
			$(".containers .searchArea .filter span a").on("click", function () {
				category = $(this).parent().index();
				$(".containers .searchArea .filter span:nth-child("+sidx+") a").css("border-bottom", "2px solid #fff");
				sidx = $(this).parent().index()+1;
				$(".containers .searchArea .filter span:nth-child("+sidx+") a").css("border-bottom", "2px solid #f00");
				console.log($(this).parent().index());
				num = 12;
				datasearch(input, type, sort, category, 0, 12);
			})
			
			var button = false;
			var sort = "regdate";
			var input = $("#searchinput").val();
			var type = "title";
			$(".checkbox-btn input").on("click", function() {
				num = 12;
				button = !button;
				if(button) {
					sort = "deadline";
				}else {
					sort = "regdate";
				}
				datasearch(input, type, sort, category, 0, 12);
			})
			
			
			
			var contentbox = $(".contentbox");
			$("#search").on("click", function() {
				console.log($("#searchinput").val());
				input = $("#searchinput").val();
				type = "title";
				num = 12;
				datasearch(input, type, sort, category, 0, 12);
			})
			
			$("#searchhash").on("click", function() {
				console.log($("#hashinput").val());
				input = $("#hashinput").val();
				type = "hashname";
				num = 12;
				datasearch(input, type, sort, category, 0, 12);
			})

			function datasearch(a, b, c, d, e, f) {
				var data = {
					searchinput : a,
					searchtype : b,
					searchsort : c,
					category: d,
					num: e,
					limit: f
				}
				$.ajax({
					url : '${path}/ajax/searchworking.dev',
					type : "post",
					data : data,
					success : function(response) {
						var res = JSON.parse(response);
						viewContent(res);
					}
				})
			}

			function viewContent(data) {
				if(num == 12) contentbox.html("");
				var data_card = "";
				$.each(data,function(i, v) {
									data_card += '<div class="containers-fluid"><div class="containers"><div class="row"><div class="col-sm-4"><div class="card">'
										data_card += '<span class="category" style="background: '
										data_card += v.category == "스터디" ? "#00B8F4" : v.category == "프로젝트" ? "#00FA9A" : "#EE82EE" 
										data_card += '">'
										data_card += v.category == "스터디" ? "Study" : v.category == "프로젝트" ? "Project" : "Contest"
										data_card += '</span>'
										data_card += '<div class="news-content"><div class="post-meta">' 
										data_card += '<span class="author"><a href="#"> <i class="fa fa-user"></i> ' + v.name + '</a></span>'
										data_card += '<span class="time"> <i class="fa fa-clock-o"></i> ' + v.regdate + '</span>' 
										data_card += '<span class="grade"> <i class="fa fa-user-graduate"></i> ' + v.grade + '</span>'
										data_card += '<div class="clearfix"></div></div><h2 class="post-header"><a href="${path}/coworking/details.dev?gno='
										data_card += v.gno + '">' + v.title + '</a></h2><div class="hashlist">' 
										for (var i = 0; i < v.hashlist.length; i++) {
											data_card += '<a><span>#' + v.hashlist[i] + '</span></a>&nbsp;'
										}
										data_card += '</div><div class="post-meta"><span class="date">'
										if(v.diff == 0){
											data_card += '당일 마감'
										}else{
											data_card += '마감 '+ v.diff +'일 전'
										}	
										data_card += '</span></div></div></div></div></div></div></div>'
										contentbox.append(data_card);
										data_card = ""
								})
			}

			$(document).on("click", ".hashlist a", function() {
				console.log($(this).children().text().substring(1));
				num = 12;
				datasearch($(this).children().text().substring(1), "hashname", sort, category, 0, 12);
				type = "hashname";
				input = $(this).children().text().substring(1);
			})
		})
	</script>
	<script type="text/javascript">
	window.addEventListener("scroll", function() {
		var scroll = document.querySelector(".scrollTop");
		scroll.classList.toggle("active", window.scrollY > 300);
	})
	
	function scrollToTop() {
		window.scrollTo({
			top: 0,
			behavior: 'smooth'
		})
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIL</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	overflow-x: hidden;
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
	border: 2px solid lightcoral;
	background: #ffcccc;
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
.containers .searchArea .plus .box a {
	color: #ff0000;
	background: transparent;
	transition: 0.5s;
}
.containers .searchArea .plus .box:hover a {
	color: #fff;
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

.card .news-content .post-meta .author{
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
	padding: 10px 0 0;
	color: #007DA6;
	height: 33px;
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
				<h2>Expand your knowledge.</h2>
				<div class="search">
				<input type="text" placeholder="Search..." id="searchinput">
				<div class="search_button" id="search"><i class="fa fa-search"></i></div>
				</div>
			</div>
		</div>
		<div class="searchArea">
			<div class="filter">
				<span><a href="#">최신순</a>&nbsp;/</span> <span><a href="#">트렌딩</a>&nbsp;/</span>
				<span><a href="#">구독 TIL</a></span>
			</div>
			<div class="plus">
				<div class="box">
					<a href="write.dev"><i class="fa fa-plus"></i></a>
				</div>
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
											<span class="author">
											<c:if test="${loginUser.name != data.name}"><a href="#profileInfo" class="open-profileInfoModal" data-toggle="modal" data-name="${data.name}">
											<i class="fa fa-user"></i> ${data.name}
											</a></c:if>
											<c:if test="${loginUser.name == data.name}"><i class="fa fa-user"></i> ${data.name}</c:if>
											</span> 
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
					<input type="text" placeholder="관련 기술" id="hashinput">
					<div class="search_button" id="searchhash"><i class="fa fa-search"></i></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			
			var input = "";
			var type = "title";
			var sort = 0;
			var sidx = 1;
			var num = 12;
			var contentbox = $(".contentbox");
			var name = "${loginUser.name}";
			
			$(window).scroll(function () {
				var scrollHeight = $(window).scrollTop() + $(window).height(); 
				var documentHeight = $(document).height();
				if(scrollHeight == documentHeight) {
					datasearch(input, type, sort, num, 8);
					num += 8;
				}
			})
			
			function viewContent(data) {
				if(num == 12) contentbox.html("");
				var data_card = "";
				$.each(data,function(i, v) {
					data_card += '<div class="containers-fluid"><div class="containers"><div class="row"><div class="col-sm-4"><div class="card"><div class="news-content">'
						data_card += '<h2 class="post-header"><a href="${path}/til/info.dev?bno='
						data_card += v.bno
						data_card += '&no='
						data_card += v.no
						data_card += '">'
						data_card += v.title
						data_card += '</a></h2><hr class="hr"><div class="post-meta"><span class="author">'
						if (name == v.name) {
							data_card += '<i class="fa fa-user"></i> '+v.name
						}else{
							data_card += '<a href="#profileInfo" class="open-profileInfoModal" data-toggle="modal" data-name="'+v.name
							data_card += '">'
							data_card += '<i class="fa fa-user"></i> '+v.name + ' </a>'
						}
						data_card += '</span> <span class="time"> <i class="fa fa-clock-o"></i>&nbsp;'
						data_card += v.regdate
						data_card += '</span></div><div class="hashlist">'
						for (var i = 0; i < v.hashlist.length; i++) {
							data_card += '<a><span>#' + v.hashlist[i] + '</span></a>&nbsp;'
						}
						data_card += '</div><div class="post-footer"><div class="like"><i class="fa fa-heart"></i>&nbsp;'
						data_card += v.point
						data_card += '</div></div></div></div></div></div></div></div>'
						contentbox.append(data_card);
						data_card = ""
				})
			}
			
			$(".containers .searchArea .filter span:nth-child("+sidx+") a").css("border-bottom", "2px solid #f00");
			
			$(".containers .searchArea .filter span a").on("click", function () {
				sort = $(this).parent().index();
				$(".containers .searchArea .filter span:nth-child("+sidx+") a").css("border-bottom", "2px solid #fff");
				sidx = $(this).parent().index()+1;
				$(".containers .searchArea .filter span:nth-child("+sidx+") a").css("border-bottom", "2px solid #f00");
				num = 12;
				datasearch(input, type, sort, 0, 12);
			})
			
			$("#search").on("click", function() {
				input = $("#searchinput").val();
				type = "title";
				num = 12;
				datasearch(input, type, sort, 0, 12);
			})
			
			$("#searchhash").on("click", function() {
				input = $("#hashinput").val();
				type = "hashname";
				num = 12;
				datasearch(input, type, sort, 0, 12);
			})
			
			function datasearch(a, b, c, d, e) {
				var data = {
					searchinput : a,
					searchtype : b,
					searchsort : c,
					num: d,
					limit: e
				}
				$.ajax({
					url : '${path}/ajax/searchtil.dev',
					type : "post",
					data : data,
					success : function(response) {
						var res = JSON.parse(response);
						console.log(res);
						viewContent(res);
					}
				})
			}
			
			$(".containers .searchArea .plus .box").click(function() {
				location.href = "write.dev";
			})
			
			$(document).on("click", ".hashlist a", function() {
				num = 12;
				datasearch($(this).children().text().substring(1), "hashname", sort, 0, 12);
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	scroll-behavior: smooth;
}
section {
	padding: 70px;
	min-height: 91vh;
}
section:nth-child(even) {
	background: #fff;
}
#first{
	background: url("${path}/img/gb.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}
section .textBx {
	color: #fff;
	text-align: center;
	margin-top: 50px;
}
section .h2 {
	color: #fff;
	text-align: center;
	font-style: italic;
	opacity: 0.3;
	font-size: 50px;
	position: relative;
	top: 90px;
}
section .textBx h3 {
	font-size: 18px;
}
section .textBx h2 {
	color: #aa85d4;
	font-size: 100px;
	text-shadow: 3px 2px 2px #000;
}
section .service-content {
	display: flex;
	justify-content: space-between;
	align-content: center;
	flex-wrap: wrap;
	padding: 170px 25vw 40px;
	background: transparent;
}
section .service-content .serviceBx {
	padding: 20px;
	background: #c0bdc33b;
	color: #fff;
	text-align: center;
	transition: 0.5s;
	box-shadow: 3px 3px 3px rgba(0,0,0,0.5);
	border-radius: 20px;
	opacity: 0.8;
	margin-top: 50px;
}
section .service-content .serviceBx:hover {
	background: #2196f3;
}
section .service-content .serviceBx img{
	max-height: 50px;
	filter: invert(1);
}
section .service-content .serviceBx p {
	margin-top: 20px;
	font-weight: bold;
}
section .service-content .serviceBx h3 {
	font-size: 1.17em;
	font-weight: bold;
	margin: 0;
	line-height: 1.5;
}
section .slider-box {
	height: 300px;
	border: 3px solid #000;
}
section .slider-box .slider {
	background: url(${path}/img/s1.png);
	background-size: cover;
	height: 300px;
	width: 300px;
	margin: 0 auto;
	transition: 3s;
}
section .titleBx {
	text-align: center;
}
section .titleBx h2 {
	font-size: 30px;
}
section .titleBx h2 span{
	font-size: 50px;
}

section .coworkingBx {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
	max-width: 70%;
	margin: 30px auto;
}
section .btn {
	left: 45%;
}
#til .tilBx {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	justify-content: center;
	margin: 30px auto;
	max-width: 70%;
}
#til .tilBx .containers-fluid {
	padding: 15px;
	margin: 0;
	width: auto;
}
#til .card {
	position: relative;
	width: 250px;
	height: 185px;
	overflow: hidden;
	font-family: 'Roboto Condensed', sans-serif !important;
	transition: 0.5s;
}
#til .card:hover {
	box-shadow: 5px 5px 5px rgba(0, 0, 0, .1);
}
#til .card:hover hr {
	background: #ddd;
}
#til .card .news-content {
	position: absolute;
	padding: 10px 20px 60px;
	background: #fff;
	transition: .5s;
	height: 155px;
	width: 250px;
}


#til .card .news-content .post-meta {
	font-size: 12px;
	margin: 3px 0;
}

#til .card .news-content .post-meta .author a {
	text-decoration: none;
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

#til .card .news-content .post-meta .time {
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

#til .card .news-content .post-meta .author a:hover {
	color: #DF084A;
}

#til .card .news-content .post-header {
	margin: 0;
	padding: 10px 0;
	color: #007DA6;
	height: 40px;
	font-size: 18px;
	overflow: hidden;
	font-weight: bold;
}

#til .card .news-content .hashlist {
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

#til .card:hover .news-content .hashlist a:hover {
	color: #DF084A;
	cursor: pointer;
}
#til .hr {
	margin: 0;
}
#til .card .news-content .post-footer .like .fa-heart:before {
	color: #f00;
}

@import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap');

#coworking .card {
	position: relative;
	width: 250px;
	height: 185px;
	overflow: hidden;
	box-shadow: 0 5px 10px rgba(0, 0, 0, .1);
	font-family: 'Roboto Condensed', sans-serif !important;
	margin: 10px 0;
}

#coworking .card .news-content {
	position: absolute;
	top: 30px;
	padding: 10px 20px 60px;
	background: #fff;
	transition: .5s;
	height: 155px;
	width: 250px;
}

#coworking .card .category {
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

#coworking .card .news-content .post-meta {
	font-size: 12px;
}

#coworking .card .news-content .post-meta .author a {
	text-decoration: none;
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

#coworking .card .news-content .post-meta .time {
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

#coworking .card .news-content .post-meta .grade {
	text-decoration: none;
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
}

#coworking .card .news-content .post-meta .date {
	text-decoration: none;
	padding-right: 10px;
	color: black;
	font-weight: bold;
	transition: .5s;
	float: right;
}

#coworking .card .news-content .post-meta .author a:hover {
	color: #DF084A;
}

#coworking .card .news-content .post-meta .grade a:hover {
	color: #DF084A;
}

#coworking .card .news-content .post-header {
	margin: 0;
	padding: 10px 0;
	color: #007DA6;
	height: 50px;
	font-size: 18px;
	overflow: hidden;
	font-weight: bold;
}

#coworking .card .news-content .hashlist {
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

#coworking .card:hover .news-content .hashlist a:hover {
	color: #DF084A;
	cursor: pointer;
}

.btn {
	position: relative;
	background: #2196f3;
	display: inline-block;
	color: #fff;
	margin-top: 20px;
	padding: 10px 30px;
	font-size: 18px;
	text-transform: uppercase;
	text-decoration: none;
	letter-spacing: 2px;
	font-weight: 500;
}
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 70%;
	margin: auto;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

.qBx #customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #4b47a2;
	color: white;
}
.fBx #customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #23865f;
	color: white;
}
#community {
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
}
#community .community_container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 30px;
}
#community .community_container .communityBx {
	width: 40vw;
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
#last {
	background: #111;
	padding: 0;
	min-height: 80px;
}
#last .develop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 0 20vw;
	height: 80px;
}
#last .develop .developer{
	color: #fff;
	font-family: Poppins sans-serif;
}
</style>
</head>
<body>
<div class="scrollTop" onclick="scrollToTop()"><i class="fa fa-arrow-up"></i></div>
		<section id="first">
			<div class="textBx">
				<h3>개발자를 위한 자기계발 사이트</h3>
				<h2>Build-Dev</h2>
			</div>
			<h2 class="h2">Our Services</h2>
			<div class="service-content">
				<div class="serviceBx">
					<img src="${path}/img/icon5.png">
					<h3>Today I Learned</h3>
				</div>
				<div class="serviceBx">
					<img src="${path}/img/talk.png">
					<h3>Community</h3>
				</div>
				<div class="serviceBx">
					<img src="${path}/img/coworking.png">
					<h3>Co-Working</h3>
				</div>
			</div>
		</section>
		<section id="til">
			<div class="titleBx">
				<h2><span>T</span>oday <span>I</span> <span>L</span>earned &lt; 본인의 지식을 정리해 보세요. &gt;</h2>
			</div>
			<div class="tilBx"></div>
			<a href="${path}/til/main.dev?no=3" class="btn">View More</a>
		</section>
		<section id="community">
			<div class="titleBx">
				<h2><span>C</span>ommunity &lt; 이곳에서 오류, 에러, 고민을 풀어보세요. &gt;</h2>
			</div>
			<div class="community_container">
			<div class="communityBx qBx"></div>
			<div class="communityBx fBx"></div>
			</div>
		</section>
		<section id="coworking">
			<div class="titleBx">
				<h2><span>C</span>o-<span>W</span>orking &lt; 혼자하지 말고 같이 해보세요. &gt;</h2>
			</div>
			<div class="coworkingBx"></div>
			<a href="${path}/coworking/main.dev" class="btn">View More</a>
		</section>
		<section id="last">
			<div class="develop">
				<div class="developer"> KeunHo Jung</div>
				<div class="developer"> KyuHyun Han</div>
				<div class="developer"> TaeHun Kim</div>
				<div class="developer"> JoonSung Lee</div>
				<div class="developer"> JeongHyun Cho</div>
			</div>
		</section>
		<script type="text/javascript">
			$(function() {
				
				$(".service-content .serviceBx").on("click", function() {
					var idx = $(this).index();
					if(idx == 0) location.href = "#til";
					else if (idx == 1) location.href = "#community";
					else location.href = "#coworking";
				})
				
				var tilBx = $(".tilBx");
				tilsearch("", "", 0, 0, 8);
				function tilsearch(a, b, c, d, e) {
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
							viewTil(res);
						}
					})
				}
				
				
				
				comunitysearch(4, 0, 10);
				comunitysearch(5, 0, 10);
				var qBx = $(".qBx");
				var fBx = $(".fBx");
				function comunitysearch(a, b, c) {
					var data = {
							no : a,
							num : b,
							limit: c
						}
					$.ajax({
						url : '${path}/ajax/searchcommunity.dev',
						type : "post",
						data : data,
						success : function(response) {
							var res = JSON.parse(response);
							viewCommunity(a, res);
						}
					})
					
				}
				function viewTil(data) {
					var data_card = "";
					$.each(data,function(i, v) {
						data_card += '<div class="containers-fluid"><div class="containers"><div class="row"><div class="col-sm-4"><div class="card"><div class="news-content">'
							data_card += '<h2 class="post-header"><a href="${path}/til/info.dev?bno='
							data_card += v.bno
							data_card += '&no='
							data_card += v.no
							data_card += '">'
							data_card += v.title
							data_card += '</a></h2><hr class="hr"><div class="post-meta"><span class="author"><a href="#"> <i class="fa fa-user"></i>&nbsp;'
							data_card += v.name
							data_card += '</a></span> <span class="time"> <i class="fa fa-clock-o"></i>&nbsp;'
							data_card += v.regdate
							data_card += '</span></div><div class="hashlist">'
							for (var i = 0; i < v.hashlist.length; i++) {
								data_card += '<a><span>#' + v.hashlist[i] + '</span></a>&nbsp;'
							}
							data_card += '</div><div class="post-footer"><div class="like"><i class="fa fa-heart"></i>&nbsp;'
							data_card += v.point
							data_card += '</div></div></div></div></div></div></div></div>'
								tilBx.append(data_card);
							data_card = ""
					})
				}
				
				function viewCommunity(no, data) {
					var data_card = '<table id="customers">';
					if(no == 4) data_card += '<tr><td colspan="6" align="center"><h4>QnA게시판</h4></td></tr>';
					if(no == 5) data_card += '<tr><td colspan="6" align="center"><h4>자유 게시판</h4></td></tr>';
					
					data_card += '<tr><th width="50%;">제목</th><th width="10%">작성자</th><th width="10%">추천</th></tr>'
					$.each(data,function(i, v) {
							console.log(v);
							data_card += '<tr><td style="text-align: left;"><a href="${path}/board/detail.dev?bno='
							data_card += v.bno + '&&no='+v.no
							data_card += '">'+v.title
							data_card += '</a></td><td>' + v.name
							data_card += '</td><td>' + v.point + '</td>'
							data_card += '</tr>'
							})
						if(no == 4) qBx.append(data_card);
						if(no == 5) fBx.append(data_card);
						data_card = ""
				}
				
				coworkingsearch("","","deadline", 0, 0, 8);
				var coworkingBx = $(".coworkingBx");
				function coworkingsearch(a, b, c, d, e, f) {
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
											data_card += '마감 '+ v.diff +'일 전</span></div></div></div></div></div></div></div>'
											coworkingBx.append(data_card);
											data_card = ""
									})
				}
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
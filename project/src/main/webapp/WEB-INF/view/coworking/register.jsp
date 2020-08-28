<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Register</title>
<style type="text/css">
.containers {
	
}

.containers .content {
	
}

.page-wrap {
	max-width: 100%;
	min-height: 100vh;
	position: relative;
	z-index: 1
}

.pagewrap-overlay {
	position: absolute;
	z-index: -1;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0.8;
}

.contents {
	width: 40%;
	margin: 5vh auto;
	padding: 0;
	border: 2px solid #222;
	border-radius: 15px;
	overflow: hidden;
}

.head {
	background: #fff;
	width: 100%;
	height: 150px;
	text-align: center;
	position: relative;
}

.head:after {
	content: '';
	position: absolute;
	bottom: -17px;
	left: 0;
	width: 100%;
	height: 40px;
	background: #fff;
	z-index: 1;
	transform: skewY(3deg);
}

.head h1 {
	text-transform: uppercase;
	font-size: 30px;
	letter-spacing: 2px;
}

.head-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.title {
	font-weight: 600;
}

.pagewrap .contents section {
	position: relative;
	height: 100%;
}

.pagewrap .contents section form {
	margin: 0 auto;
	max-width: 100%;
	background: #222;
	height: 100%;
	opacity: 0.8;
	/* box-shadow: 0 19px 39px rgba(0, 0, 0, 0.3), 0 15px 12px
		rgba(0, 0, 0, 0.22); */
	padding-top: 60px;
	padding-bottom: 7px;
}

::-webkit-input-placeholder {
	color: #fff;
}

.pagewrap .contents section form select {
	-moz-apperance: none;
	-webkit-apperance: none;
}

.pagewrap .contents section form select::-ms-expand {
	display: none;
}

.pagewrap .contents .btn-area {
	background: #222;
	opacity: 0.8;
	padding: 20px 0;
}

.pagewrap .contents .btn-area button {
	background: linear-gradient(to right, #fa1, #fc1);
	width: 30%;
	height: 65px;
	border: none;
	border-radius: 5px;
	margin: 0 auto;
	font-size: 15px;
	color: #fff;
	letter-spacing: 3px;
	display: block;
	text-transform: uppercase;
	font-weight: 900;
	position: relative;
	box-shadow: 0 19px 39px rgba(0, 0, 0, 0.3), 0 15px 12px
		rgba(0, 0, 0, 0.22);
	cursor: pointer;
}

.hashtag-containers {
	margin: 0;
	width: 80%;
}

.hashtag {
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	padding: 5px;
	width: 100%;
	align-items: center;
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

.hashtag input {
	padding: 5px;
	font-size: 16px;
	border: 0;
	outline: none;
	font-family: 'Rubik';
	color: #333;
	flex: 1;
	background: transparent;
}

.pagewrap .contents section .input-layout {
	margin: 0 auto;
	width: 80%;
}

.pagewrap .contents section form .form-radio {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.pagewrap .contents section form .form-radio:first-child {
	margin-top: 0;
}


.pagewrap .contents section form .form-radio input[type="radio"] {
	display: none;
}

.pagewrap .contents section form .form-radio input[type="radio"]:checked+label
	{
	border: 3px solid #fff;
}

.pagewrap .contents section form .form-radio input[type="radio"]:checked+label:before
	{
	content: "✓";
	line-height: 40px;
	background: #222;
	z-index: 999;
	position: absolute;
	top: -25px;
	font-size: 40px;
	border: 1px solid #fff;
	border-radius: 50%;
	width: 40px;
	left: -15%;
}

.pagewrap .contents section form .form-radio label {
	position: relative;
	color: #fff;
	background-color: transparent;
	font-size: 18px;
	text-align: center;
	display: block;
	cursor: pointer;
	border: 1px solid #555;
	box-sizing: border-box;
	border-radius: 5px;
	padding: 10px 20px;
	margin: 0;
}

.pagewrap .contents section form .form-input {
	display: flex;
	width: calc(100% - 23px);
	height: 60px;
	background: transparent;
	border: 1px solid #555;
	border-radius: 5px;
	margin: 0;
	font-size: 16px;
	color: #fff;
	letter-spacing: 2px;
	margin-top: 20px;
	justify-content: flex-start;
	align-items: center;
	padding-left: 20px;
}

.pagewrap .contents section form .hash-form {
	height: 100%;
}

.pagewrap .contents section form .form-textarea {
	height: 100px;
	padding: 0;
	width: 100%;
}

.pagewrap .contents section form .form-input input {
	margin-left: 20px;
	border: none;
	color: #fff;
	background: transparent;
	width: 60%;
	height: 40px;
	font-size: 20px;
}

.pagewrap .contents section form .form-input textarea {
	width: 100%;
	padding: 0;
	height: 100%;
	resize: none;
	background: transparent;
	border: none;
	color: white;
	font-size: 16px;
}

.pagewrap .contents section form .form-input input:focus, .pagewrap .contents section form .form-input textarea:focus
	{
	outline: none;
	border-bottom: 1px solid #fff;
}

.pagewrap .contents section form .row {
	display: flex;
	justify-content: space-between;
	font-size: 16px;
}

.pagewrap .contents section form .row .form-input {
	width: 40%;
	font-size: 16px;
}

.pagewrap .contents section form .row .date-picker{
	width: 70%;
}

.datapick{
	
}

.datepick input{
	display: none;
}

.date-picker {
	position: relative;
	width: 100%;
	max-width: 320px;
	height: 60px;
	margin: 20px 0;
	font-family: 'Saira', Arial, Helvetica, sans-serif;
	cursor: pointer;
	user-select: none;
	background: transparent;
}


.date-picker .selected-date {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
	font-size: 18px;
}

.date-picker .dates {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	right: 0;
	background-color: #FFF;
	z-index: 10000;
	width: 250px;
}

.date-picker .dates.active {
	display: block;
}

.date-picker .dates .month {
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: #000;
	border-bottom: 2px solid #EEE;
}

.date-picker .dates .month .arrows {
	width: 35px;
	height: 35px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #313131;
	font-size: 20px;
}

.date-picker .dates .month .arrows:active {
	background-color: #00CA85;
}

.date-picker .dates .days {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	height: 200px;
}

.date-picker .dates .days .day {
	display: flex;
	justify-content: center;
	align-items: center;
	color: #313131;
}

.date-picker .dates .days .day.selected {
	background-color: #00CA85;
}
</style>
</head>
<body>
	<div class="containers">
		<div class="content">
			<div class="pagewrap">
				<div class="pagewrap-overlay"></div>
				<div class="contents">
					<div class="head">
						<div class="head-content">
							<h1>
								<span class="title">Co-Working</span>
							</h1>
							<div class="slanted"></div>
						</div>
					</div>
					<section>
						<form:form modelAttribute="coworking" method="post"
							action="register.dev" name="f">
							<div class="input-layout">
								<div class="form-radio">
									<form:radiobutton path="category" value="스터디" label="스터디" />
									<form:radiobutton path="category" value="공모전" label="공모전" />
									<form:radiobutton path="category" value="프로젝트" label="프로젝트" />
								</div>
								<div class="form-input">
									<span>프로젝트 명</span>
									<form:input path="title" />
								</div>
								<div class="row">
									<div class="form-input">
										<span>작성자</span>
										<form:input path="name" />
									</div>
									<div class="form-input">
										<span>모집인원</span>
										<form:input path="maxnum" />
									</div>
								</div>
								<div class="form-input hash-form">
									<span>관련기술</span>
									<div class="hashtag-containers">
										<div class="hashtag">
											<input />
										</div>
									</div>
								</div>
								<div class="form-input">
									<span>지역</span>
									<form:input path="loc" />
								</div>
								<div class="form-input datepick">
									<span>모집 마감일</span>
									<div class="date-picker">
										<div class="selected-date"></div>
										<div class="dates">
											<div class="month">
												<div class="arrows prev-mth">&lt;</div>
												<div class="mth"></div>
												<div class="arrows next-mth">&gt;</div>
											</div>
											<div class="days"></div>
										</div>
									</div>
									<form:input path="deadline" />
								</div>
								<div class="row">
									<div class="form-input datepick">
										<span>시작일</span>
										<div class="date-picker">
											<div class="selected-date"></div>
											<div class="dates">
												<div class="month">
													<div class="arrows prev-mth">&lt;</div>
													<div class="mth"></div>
													<div class="arrows next-mth">&gt;</div>
												</div>
												<div class="days"></div>
											</div>
										</div>
										<form:input path="startdate" />
									</div>
									<div class="form-input datepick">
										<span>마지막일</span>
										<div class="date-picker">
											<div class="selected-date"></div>
											<div class="dates">
												<div class="month">
													<div class="arrows prev-mth">&lt;</div>
													<div class="mth"></div>
													<div class="arrows next-mth">&gt;</div>
												</div>
												<div class="days"></div>
											</div>
										</div>
										<form:input path="enddate" />
									</div>
								</div>
								<div class="form-radio">
									<form:radiobutton path="process" value="오프라인" label="오프라인" />
									<form:radiobutton path="process" value="온라인" label="온라인" />
								</div>
								<div class="form-radio">
									<form:radiobutton path="grade" value="초급" label="초급" />
									<form:radiobutton path="grade" value="중급" label="중급" />
									<form:radiobutton path="grade" value="고급" label="고급" />
								</div>
								<div class="form-input form-textarea">
									<form:textarea path="content" />
								</div>
							</div>
						</form:form>
					</section>
					<div class="btn-area">
						<button type="button" onclick="javascript:document.f.submit()"
							id="submit">Register</button>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
$(function() {
	$("input[name='category']").click(function() {
		if($(this).prop('checked')) {
			$("input[name='category']").prop('checked', false);
			$(this).prop('checked', true);
		}
	})
	
	$("input[name='grade']").click(function() {
		if($(this).prop('checked')) {
			$("input[name='grade']").prop('checked', false);
			$(this).prop('checked', true);
		}
	})
	
})
</script>
	<script type="text/javascript">
$(function() {
	
const tagcontainers = document.querySelector('.hashtag');
const input = document.querySelector('.hashtag input');

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
    tagcontainers.prepend(createTag(tag));
  });
}

input.addEventListener('keyup', (e) => {
    if (e.key === 'Enter') {
	if (tags.length < 5) {
      e.target.value.split(',').forEach(tag => {
        tags.push(tag);  
      });
      
      addTags();
      input.value = '';
      console.log(tags);
	}else {
		alert("기술을 5개까지만 입력이 가능합니다.")
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


$("#submit").on("click", function () {
	var hash = {
			hash : tags,
			no : 6
			};
	console.log(hash);
	
	$.ajax({
		url: '${path}/ajax/hashtag.dev',
		type: "post",
		data: hash,
		traditional: true,
		success: function(response){
		}
	})
	return true;
})
	
})

</script>
	<script type="text/javascript">
	
	$(function() {
		var date_picker = $(".date-picker");
		var months = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth();
		var year = date.getFullYear();
		
		var selectedDate = date;
		var selectedDay = day;
		var selectedMonth = month;
		var selectedYear = year;
		
		
		$.each(date_picker, function () {
			$(this).children(".dates").children(".month").children(".mth").text(year + '년 ' + months[month]);
			$(this).children(".selected-date").text(formatDate(date));
			$(this).children(".selected-date").data("value",selectedDate);
			populateDates($(this).children(".dates").children(".days"));
			$(this).parent().children("input").val(formatDate(date));
			console.log($(this).parent());
		})
		
		
		$(document).on("click", ".date-picker .dates .days .day", function(e){
			var i = Number($(this).text());
			selectedDate = new Date(year + '-' + (month + 1) + '-' + i);
			selectedDay = i;
			selectedMonth = month;
			selectedYear = year;
			
			$(this).parent().parent().parent().children(".selected-date").text(formatDate(selectedDate));
			$(this).parent().parent().parent().children(".selected-date").data("value",selectedDate);
			$(this).parent().parent().parent().parent().children("input").val(formatDate(selectedDate));
			console.log($(this).parent().parent().parent().parent().children("input").val());
			populateDates($(this).parent());
			/* $(this).parent().parent().toggleClass("active"); */
		})
			
		$(".date-picker").on("click", function (e) {
			if(e.target.classList.contains('day') || e.target.classList.contains("selected-date")) {
				$(this).children(".dates").toggleClass('active');
				}
		})
		
		$(".date-picker .dates .month .next-mth").on("click", function () {
			month++;
			if (month > 11) {
				month = 0;
				year++;
			}
			$(this).parent().children(".mth").text(year + '년 ' + months[month]);
			populateDates($(this).parent().parent().children(".days"));
		})
		
		$(".date-picker .dates .month .prev-mth").on("click", function () {
			month--;
			if (month < 0) {
				month = 11;
				year--;
			}
			$(this).parent().children(".mth").text(year + '년 ' + months[month]);
			populateDates($(this).parent().parent().children(".days"));
		})
		
		function populateDates(th) {
			th.html("");
			var firstDate = new Date(year,month,1);
			var lastDate = new Date(year,month+1,0);
			var first_day = firstDate.getDay();

			for (var i = 0; i < first_day; i++) {
				th.append('<div class="day"></div>')
			}
			
			var amount_days = lastDate.getDate();
			
			for (var i = 0; i < amount_days; i++) {
				var day_data = '<div class="day">'+(i+1)+'</div>'

				if (selectedDay == (i + 1) && selectedYear == year && selectedMonth == month) {
					day_data = '<div class="day selected">'+(i+1)+'</div>'
				}
				
				th.append(day_data)
			}
		}
		
		function formatDate (d) {
		var day = d.getDate();
		if (day < 10) {
			day = '0' + day;
		}
		var month = d.getMonth() + 1;
		if (month < 10) {
			month = '0' + month;
		}
		var year = d.getFullYear();
		return year + '-' + month + '-' + day;
	}
	})
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 작성/수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.container {
		margin: 30px auto;
    	max-width: 1000px;
	}
	#whole-save-btn {
		text-align : right;
		padding : 0 30px 0 0;
	}
	#content-edit-tab {
		border : 1px solid #a473fa;
		border-radius: 15px 15px 0 0;
		/* background-color : #a473fa; */
		padding : 8px 30px 4px 30px;
		margin-left : 100px;
		font-size : 20px;
		background: rgba(211,120,190,1);
		background: -moz-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -webkit-gradient(left top, right top, color-stop(0%, rgba(211,120,190,1)), color-stop(0%, rgba(184,0,125,1)), color-stop(0%, rgba(200,91,169,1)), color-stop(100%, rgba(162,145,242,1)));
		background: -webkit-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -o-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: -ms-linear-gradient(left, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		background: linear-gradient(to right, rgba(211,120,190,1) 0%, rgba(184,0,125,1) 0%, rgba(200,91,169,1) 0%, rgba(162,145,242,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d378be', endColorstr='#a291f2', GradientType=1 );
	}
	.container .content .content-body {
		margin : 5px 20px 30px 20px;
		padding : 30px 50px 30px 50px;
		border : 1px solid #b5b3bd;
		border-radius: 25px;
		background-color : #fff;
		-webkit-box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		-moz-box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
		box-shadow: 0px 0px 5px 1px rgba(120,41,173,1);
	}
	.content-name {
		width : 200px;
		margin-right : 0;
		font-weight : bold;
		font-size : 20px;
	}
	.content-body-position {
		margin-bottom : 40px;
	}
	.content-body-skills {
		margin-bottom : 40px;
	}
	.content-body-giturl {
		margin-bottom : 60px;
	}
	.content-body-container {
	  margin: 0;
	  position : relative;
	}
	
	
	.pTag input {
	  padding: 5px;
	  font-size: 16px;
	  outline: none;
	  font-family: 'Rubik';
	  color: #333;
	  flex: 1;
	  background: transparent;
	}
	.added-pTags {
	  display: flex;
	  flex-wrap: wrap;
	  align-content: flex-start;
	  padding: 5px;
	  width: calc(100% - 30px);
	  height : 50px;
	}
	.added-pTags .pTag {
	  padding : 4px 8px;
		margin : 0 5px;
		border : 1px solid #e5e1f7;
		background-color : #e5e1f7;
		border-radius : 5px;
		color : #8572EE;
		font-size : 20px;
	}
	.pTag i {
	  font-size: 16px;
	  color: #666;
	  margin-left: 5px;
	}
	
	
	
	
	
	.sTag input {
	  padding: 5px;
	  font-size: 16px;
	  outline: none;
	  font-family: 'Rubik';
	  color: #333;
	  flex: 1;
	  background: transparent;
	}
	.added-sTags {
	  display: flex;
	  flex-wrap: wrap;
	  align-content: flex-start;
	  padding: 5px;
	  width: calc(100% - 30px);
	  height : 50px;
	}
	.added-sTags .sTag {
	  padding : 4px 8px;
		margin : 0 5px;
		border : 1px solid #4171f2;
		background-color : #4171f2;
		border-radius : 5px;
		color : white;
		font-size : 20px;
	}
	.sTag i {
	  font-size: 16px;
	  color: #666;
	  margin-left: 5px;
	}
	
	#gitrulinput {
		width : 300px;
	}
	
	.project-buttons {
		margin-top : 20px;
		margin-bottom :20px;
		text-align : right;
	}
	table {
		border-bottom : 1px solid #bdbdbd;
		text-align : center;
	}
	th {
		border-left : 1px solid #bdbdbd;
		border-right : 1px solid #bdbdbd;
		border-bottom : 3px solid #bdbdbd;
		background-color : #d2c9ff;
	}
	td {
		border-left : 1px solid #bdbdbd;
		border-right : 1px solid #bdbdbd;
	}
	/* 프로젝트 추가시 사용 기술 */ 
	.added-usedTag {
	  display: flex;
	  flex-wrap: wrap;
	  align-content: flex-start;
	  padding: 5px;
	  width: calc(100% - 30px);
	  height : 50px;
	}
	.added-usedTag .usedTag {
	  height: 30px;
	  margin: 2px;
	  padding: 0 5px;
	  border: 1px solid #3877ff;
	  border-radius: 5px;
	  background: #3877ff;
	  display: flex;
	  align-items: center;
	  color: #333;
	  box-shadow: 0 0 4px rgba(0, 0, 0, 0.2), inset 0 1px 1px #3877ff;
	  cursor: pointer;
	  font-size : 15px;
	  color : #fff;
	  margin-right: 5px;;
	}
	.banner{
		width: 100vw;
		height: 20vh;
		text-align : center;
		padding : 70px;
		background: rgba(203,96,179,1);
		background: -moz-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: -webkit-gradient(left top, right top, color-stop(0%, rgba(203,96,179,1)), color-stop(17%, rgba(193,70,161,1)), color-stop(100%, rgba(133,114,238,1)));
		background: -webkit-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: -o-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: -ms-linear-gradient(left, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		background: linear-gradient(to right, rgba(203,96,179,1) 0%, rgba(193,70,161,1) 17%, rgba(133,114,238,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb60b3', endColorstr='#8572ee', GradientType=1 );
	}
	.banner h2 {
		color: #fff;
		font-style: italic;
		font-weight: bold;
		font-size: 2rem;
	}
	.fa-circle {
		color: rgba(211,120,190,1);
	}
</style>
<script>
	$(function() {
		const addedPTags = document.querySelector('.added-pTags');
		const pInput = document.querySelector('.pTag-input-span input');
		const addedSTags = document.querySelector('.added-sTags');
		const sInput = document.querySelector('.sTag-input-span input');
		let pTags = [];
		let sTags = [];
	
		var ptmp = $(".pTag").find('span').text().split(" ");
		var stmp = $(".sTag").find('span').text().split(" ");
		for(var i=0; i<ptmp.length-1; i++) {
			pTags.push(ptmp[i])
		}
		for(var i=0; i<stmp.length-1; i++) {
			sTags.push(stmp[i])
		}
		
		
		pInput.addEventListener('keyup', (e) => {
		    if (e.key === 'Enter') {
				if (pTags.length < 5) {
			      	e.target.value.split(',').forEach(tag => {
			        pTags.push(tag);
			      });
			      
			      addPTags();
			      pInput.value = '';
				}else {
					alert("5개까지 입력이 가능합니다.")
				}
		    }
		});
		
		sInput.addEventListener('keyup', (e) => {
		    if (e.key === 'Enter') {
				if (sTags.length < 5) {
			      	e.target.value.split(',').forEach(tag => {
			        sTags.push(tag);
			      });
			      
			      addSTags();
			      sInput.value = '';
				}else {
					alert("5개까지 입력이 가능합니다.")
				}
		    }
		});
		
		function addPTags() {
		  clearPTags();
		  pTags.slice().reverse().forEach(tag => {
			  addedPTags.prepend(createPTag(tag));
		  });
		}
		
		function addSTags() {
		  clearSTags();
		  sTags.slice().reverse().forEach(tag => {
			  addedSTags.prepend(createSTag(tag));
		  });
		}
		
		function clearPTags() {
		  	document.querySelectorAll('.pTag').forEach(tag => {
		    tag.parentElement.removeChild(tag);
		  });
		}
		
		function clearSTags() {
		  	document.querySelectorAll('.sTag').forEach(tag => {
		  	tag.parentElement.removeChild(tag);
		  });
		}
		
		function createPTag(label) {
			  const pdiv = document.createElement('div');
			  pdiv.setAttribute('class', 'pTag');
			  const pspan = document.createElement('span');
			  pspan.innerHTML = label;
			  const pcloseIcon = document.createElement('i');
			  pcloseIcon.innerHTML = '';
			  pcloseIcon.setAttribute('class', 'fa fa-times');
			  pcloseIcon.setAttribute('data-item', label);
			  pcloseIcon.setAttribute('id', 'positionI');
			  pdiv.appendChild(pspan);
			  pdiv.appendChild(pcloseIcon);
			  console.log(pdiv)
			  return pdiv;
		}
		
		function createSTag(label) {
			  const sdiv = document.createElement('div');
			  sdiv.setAttribute('class', 'sTag');
			  const sspan = document.createElement('span');
			  sspan.innerHTML = label;
			  const scloseIcon = document.createElement('i');
			  scloseIcon.innerHTML = '';
			  scloseIcon.setAttribute('class', 'fa fa-times');
			  scloseIcon.setAttribute('data-item', label);
			  scloseIcon.setAttribute('id', 'skillsI');
			  sdiv.appendChild(sspan);
			  sdiv.appendChild(scloseIcon);
			  console.log(sdiv)
			  return sdiv;
			}
	
		document.addEventListener('click', (e) => {
		  if (e.target.id === 'positionI') {
		    	const ptagLabel = e.target.getAttribute('data-item');
		    	const pindex = pTags.indexOf(ptagLabel);
		    	pTags = [...pTags.slice(0, pindex), ...pTags.slice(pindex+1)];
		    	addPTags();    
		  } else if (e.target.id ==='skillsI') {
			  	const stagLabel = e.target.getAttribute('data-item');
			 	const sindex = sTags.indexOf(stagLabel);
			  	sTags = [...sTags.slice(0, sindex), ...sTags.slice(sindex+1)];
			  	addSTags(); 
		  }
		})
		$("#save").on("click", function () {
			var projectable  = [];
			$('.projectable').each(function(i){
				if($(this).is(":checked")){
					projectable.push($(this).data('prono'));
				}
		    });
			$.ajax({
				url: '${path}/ajax/portfolioSave.dev',
				type: "post",
				data: {
					pTags : pTags,
					sTags : sTags,
					giturl : $('#gitrulinput').val(),
					giturlable : $('#giturlable').prop('checked'),
					projectablepronos : projectable
				},
				traditional: true,
				success: function(s) {
					alert("저장되었습니다");
				},
				error : function(e) {
					alert("오류가 발생했습니다")
				}
			})
			return true;
		})
	})
</script>
</head>
<body>
	<div class="banner">
		<h2>Portfolio</h2>
	</div>
	<div class="container">
		<div class="content">
			<div id="whole-save-btn">
				<button type="button" class="btn btn-warning btn-lg" id="save">저장하기</button>
			</div>
			<span id="content-edit-tab">
				My Portfolio 수정하기
			</span>
			<div class="content-body">
				<div class="content-body-position">
						<i class="fa fa-circle" aria-hidden="true"></i>
						&nbsp;&nbsp;
					<span class="content-name">
						Position
					</span>
					<span class="content-body-container">
						<span class="pTag-input-span">
							<input style="font-size:20px; border-radius:5px; margin: 0 0 15px 10px;"/>  
  						</span>
	  					<span class="added-pTags">
	  						<c:forEach var="pTag" items="${tags}">
	  							<c:if test='${pTag.no==7}'>
	  								<div class="pTag">
	  									<span>${pTag.tag} </span>
	  									<i class="fa fa-times" data-item="${pTag.tag}" id="positionI"></i>
	  								</div>
	  							</c:if>
	  						</c:forEach>
	  					</span>
  					</span>
				</div>
				
				<div class="content-body-skills">
						<i class="fa fa-circle" aria-hidden="true"></i>
						&nbsp;&nbsp;
					<span class="content-name">
						Skills
					</span>
					<span class="content-body-container">
						<span class="sTag-input-span">
							<input style="font-size:20px; border-radius:5px; margin: 0 0 15px 10px;"/>  
  						</span>
	  					<span class="added-sTags">
	  						<c:forEach var="sTag" items="${tags}">
	  							<c:if test='${sTag.no==8}'>
	  								<div class="sTag">
	  									<span>${sTag.tag} </span>
	  									<i class="fa fa-times" data-item="${sTag.tag}" id="skillsI"></i>
	  								</div>
	  							</c:if>
	  						</c:forEach>
	  					</span>
					</span>
				</div>
				
				<div class="content-body-giturl">
						<i class="fa fa-circle" aria-hidden="true"></i>
						&nbsp;&nbsp;
					<span class="content-name">
						Github
					</span>
					<span class="custom-control custom-switch">
						<c:if test='${sessionScope.loginUser.giturlable==false}'>
						    <input type="checkbox" class="custom-control-input" id="giturlable" >
						</c:if>
						<c:if test='${sessionScope.loginUser.giturlable==true}'>
						    <input type="checkbox" class="custom-control-input" id="giturlable" checked>
						</c:if>
					    <label class="custom-control-label" for="giturlable"></label>
					</span>
							
					<span class="content-body-container">
						<span class="giturl-input-span">
							<input id="gitrulinput" value="${sessionScope.loginUser.giturl}" style="font-size:20px; border-radius:5px; width:500px;"/>
						</span>
					</span>
				</div>
				
				<div class="content-body-project">
						<i class="fa fa-circle" aria-hidden="true"></i>
						&nbsp;&nbsp;
					<span class="content-name">
						프로젝트 관리
					</span>
					<div class="project-buttons">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProjectModal">추가</button>
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteProjectModal">삭제</button>
					</div>
					<c:if test='${empty projects}'>
						<h3><span style="color:red;"><i class="fa fa-exclamation-circle" aria-hidden="true"></i></span>  프로젝트를 등록해주세요</h3>
					</c:if>
					<c:if test='${!empty projects}'>
						<table class="projectlist table table-hover">
							<thead>
								<tr>
									<th scope="col">프로젝트명</th>
									<th scope="col">프로젝트 기간</th>
									<th scope="col">프로젝트 인원</th>
									<th scope="col">공개여부</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="projects" items="${projects}">
									<tr id ="${projects.prono}">
										<td>${projects.subject}</td>
										
										<td>
											<fmt:formatDate value="${projects.start}" pattern="yyyy-MM-dd"/> 
											~
											<fmt:formatDate value="${projects.end}" pattern="yyyy-MM-dd"/>
										</td>
										<td>${projects.num}</td>
										<td>
											<c:if test='${projects.able == false}'>
												<input type='checkbox' class="projectable" name="projectable" data-prono="${projects.prono}">
											</c:if>
											<c:if test='${projects.able == true}'>
												<input type='checkbox' class="projectable" name="projectable" data-prono="${projects.prono}" checked>
											</c:if>
										</td>
										<td><input type='checkbox' class='deleteProjectChk' data-prono="${projects.prono}"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="addProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">프로젝트 추가하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		<div class="form-group">
					<label for="subject" class="col-form-label">프로젝트명 :</label>
					<input type="text" class="form-control" id="subject">
				</div>
				<div class="form-group">
					<label for="numbers" class="col-form-label">프로젝트 인원 (숫자만 입력) :</label>
					<input type="text" class="form-control" id="numbers">
				</div>
				<div class="form-group">
					<label for="start" class="col-form-label">시작일 (yyyy-mm-dd) :</label>
					<input type="text" class="form-control" id="start">
				</div>
				<div class="form-group">
					<label for="end" class="col-form-label">종료일 (yyyy-mm-dd) :</label>
					<input type="text" class="form-control" id="end">
				</div>
				<div class="form-group">
					<label for="description" class="col-form-label">상세 업무 :</label>
					<textarea class="form-control" id="description"></textarea>
				</div>
				<div class="form-group">
					<label for="used-skills-tag" class="col-form-label">사용기술 :</label>
					<input type="text" class="form-control" id="used-skills-tag">
					<span class="added-usedTag">
					
					</span>
				</div>
				<div class="form-group">
					<label for="repository" class="col-form-label">Github link:</label>
					<input type="text" class="form-control" id="repository">
				</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" class="modal-close">닫기</button>
	        <button type="button" class="btn btn-primary" id="saveNewProject">저장하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="deleteProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	    <%--
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">프로젝트 삭제하</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	     --%>
	      <div class="modal-body" style="padding:60px 0 60px 0">
	      	<h4 style="text-align:center">선택하신 프로젝트를 삭제하시겠습니까?</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-danger" id="deleteProject">삭제하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$(function(){
			//사용 기술 태그 입력
			const addedUsedTags = document.querySelector('.added-usedTag');
			const usedTagInput = document.querySelector('#used-skills-tag');
			let usedTags = [];
			usedTagInput.addEventListener('keyup', (e) => {
			    if (e.key === 'Enter') {
					if (usedTags.length < 5) {
				      	e.target.value.split(',').forEach(tag => {
				      		usedTags.push(tag);
				      });
				      
				      addUsedTags();
				      usedTagInput.value = '';
					}else {
						alert("5개까지 입력이 가능합니다.")
					}
			    }
			});
			function addUsedTags() {
				  clearUsedTags();
				  usedTags.slice().reverse().forEach(tag => {
					  addedUsedTags.prepend(creatUsedTag(tag));
				  });
				}
			
			function clearUsedTags() {
			  	document.querySelectorAll('.usedTag').forEach(tag => {
			    tag.parentElement.removeChild(tag);
			  });
			}
			
			function creatUsedTag(label) {
				  const div = document.createElement('div');
				  div.setAttribute('class', 'usedTag');
				  const span = document.createElement('span');
				  span.innerHTML = label;
				  const closeIcon = document.createElement('i');
				  closeIcon.innerHTML = '';
				  closeIcon.setAttribute('class', 'fa fa-times');
				  closeIcon.setAttribute('data-item', label);
				  closeIcon.setAttribute('id', 'usedTagI');
				  div.appendChild(span);
				  div.appendChild(closeIcon);
				  console.log(div)
				  return div;
			}
			document.addEventListener('click', (e) => {
				  if (e.target.id === 'usedTagI') {
				    	const tagLabel = e.target.getAttribute('data-item');
				    	const index = usedTags.indexOf(tagLabel);
				    	usedTags = [...usedTags.slice(0, index), ...usedTags.slice(index+1)];
				    	addUsedTags();    
				  } 
				})
			
			
			//프로젝트 추가
			$("#saveNewProject").on("click",function(){
				$.ajax({
					url : "${path}/ajax/addProject.dev",
					type : "post",
					data : {
						name : "${sessionScope.loginUser.name}",
						subject : $("#subject").val(),
						numbers : $("#numbers").val(),
						start : $("#start").val(),
						end : $("#end").val(),
						description : $('#description').val(),
						usedTags : usedTags,
						repository : $('#repository').val()
						
					},
					traditional : true,
					success : function(s) {
						var result = JSON.parse(s);
						var html = '';
						html += '<tr id="' + result.prono + '"><td>' + result.subject + '</td>'
						html += '<td>' + result.term + '</td>'
						html += '<td>' + result.numbers + '</td>'
						html += '<td><input type="checkbox" class="projectable" name="projectable" data-prono="' + result.prono + '"></td>'
						html += '<td><input type="checkbox" class="deleteProjectChk" data-prono="' + result.prono + '"></td></tr>'
						alert("새로운 프로젝트가 추가되었습니다.")
						$(".projectlist").append(html);
						$(".form-control").val('');
						$("#addProjectModal").modal('hide');
						
					},
					error : function(e) {
						alert("에러 발생")
					}
				})
			})
			//프로젝트 삭제
			$('#deleteProject').on("click",function(){
				var projectslist  = [];
				$('.deleteProjectChk').each(function(i){
					if($(this).is(":checked")){
						projectslist.push($(this).data('prono'));
					}
			    });
				if (projectslist.length == 0) {
					alert("삭제할 프로젝트를 선택하세요")
				} else {
					$.ajax({
						url : "${path}/ajax/deleteProject.dev",
						type : "post",
						data : {
							name : "${sessionScope.loginUser.name}",
							projectslist : projectslist
						},
						traditional: true,
						success: function(s) {
							alert("프로젝트가 삭제되었습니다");
							$('.deleteProjectChk').each(function(i){
								console.log(i)
								if(projectslist.includes($(this).data('prono'))){
									var id = $(this).data('prono')
									$('tr[id=' + id + ']').remove()
								}
							})
							$("#deleteProjectModal").modal('hide');
						},
						error : function(e) {
							alert("오류가 발생했습니다")
						}
					})
				}
			})
			
			//종료 버튼
			$(".modal-close").on("click",function(){
				$('#message-title').val("");
			})
		})
	</script>
	
</body>
</html>
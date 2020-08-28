<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<style>

	.box{
		position: absolute;
		top: 400px;
		left: 50%;
		transform:  translate(-50%, -50%);
		width: 600px;
		padding: 40px;
		box-sizing: border-box;
		border-radius: 10px;
		background: transparent;
		border : 1px solid #8572EE;
	}
	.box h1{
		margin: 0 0 30px;
		padding: 0;
		color: #000000;
		text-align: center;
	}
	.box .inputBox{
		position: relative;
	}
	.box .inputBox input{
		width: 100%;
		padding: 10px 0;
		font-size: 16px;
		color: #000000;
		letter-spacing: 1px;
		margin-bottom: 30px;
		border: none;
		outline: none;
		background: transparent;
		border-bottom: 1px solid #000000;
	}
	.box .inputBox label {
		position: absolute;
		top: 0;
		left: 0;
		padding: 10px 0;
		font-size: 16px;
		letter-spacing: 1px;
		color: grey;
		pointer-events: none;
		transition: .5s;
	}
	.box .inputBox input:focus ~ label,
	.box .inputBox input:valid ~ label{
		top: -18px;
		left: 0;
		color: #03a9f4;
		font-size: 12px;
	}
	.box input[type="submit"] {
		background: transparent;
		border: none;
		outline: none;
		color: #fff;
		background: #8572EE;
		padding: 10px 20px;
		margin : 0 0 30px 0;
		cursor: pointer;
		border-radius: 5px;
	}
	.errormessage {
		color : red;
		position : absolute;
		top : 10px;
		left : 280px;
	}
}
</style>
</head><body>
	<form:form modelAttribute="user" method="post" action="join.dev">
		<div class="box">
			<h1>회원 가입</h1>
			<div class="inputBox">
				<form:input path="id" />
				<label>아이디를 입력하세요</label>
				<form:errors path="id" class="errormessage"/>
			</div>
			
			<div class="inputBox">
				<form:password path="pw"/>
				<label>비밀번호를 입력하세요</label>
				<form:errors path="pw" class="errormessage"/>
			</div>
			
			<div class="inputBox">
				<form:input path="name"/>
				<label>닉네임을 입력하세요</label>
				<form:errors path="name" class="errormessage"/>
			</div>
			
			<div class="inputBox">
				<form:input path="email"/>
				<label>이메일 입력하세요</label>
				<form:errors path="email" class="errormessage"/>
			</div>
			
			<div class="inputBox">
				<form:input path="phone"/>
				<label>연락처를 입력하세요</label>
				<form:errors path="phone" class="errormessage"/>
			</div>
			
			<%--
			<spring:hasBindErrors name="user"> 
				<font color="red">
					<c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}"/>
					</c:forEach>
				</font> 
			</spring:hasBindErrors>
			--%>
			
			<input type="submit" value="회원가입" style="width:100%;">
		</div>
	</form:form>
</body>
</html>

	<%--
			<table border="1" style="border-collapse: collapse;">
				<tr height="40px">
					<td>아이디</td>
					<td>
						<form:input path="id"/>
						<font color="red">
							<form:errors path="id"/>
						</font>
					</td>
				</tr>
				<tr height="40px">
					<td>비밀번호</td>
					<td>
						<form:password path="pw"/>
						<font color="red">
							<form:errors path="pw"/>
						</font>
					</td>
				</tr>
				<tr height="40px">
					<td>닉네임</td>
					<td>
						<form:input path="name"/>
						<font color="red">
							<form:errors path="name"/>
						</font>
					</td>
				</tr>
				<tr height="40px">
					<td>이메일</td>
					<td>
						<form:input path="email"/>
						<font color="red">
							<form:errors path="email"/>
						</font>
					</td>
				</tr><tr height="40px">
					<td>연락처</td>
					<td>
						<form:input path="phone"/>
						<font color="red">
							<form:errors path="phone"/>
						</font>
					</td>
				</tr>
				<tr height="40px">
					<td colspan="2" align="center">
						<input type="submit" value="등록">
						<input type="reset" value="초기화">
					</td>
				</tr>
			</table>
	 --%>
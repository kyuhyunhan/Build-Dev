
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>




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

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

</style>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<style type="text/css">
	.leftcol {text-align: left; vertical-align: top;}
	.lefttoptable{
		height: 250px;	border-width: 0px;
		text-align: left;	vertical-align: top;	padding: 0px;
	}
	input[type=text]:focus {
  border: 3px solid #555;
}
</style>
</head>
<body>
<br><br><br><br><br>
<table id="customers"><tr>
<c:if test="${no ==4 }">
<td colspan="2" align="center">QnA 게시판</td>
</c:if>
<c:if test="${no ==5 }">
<td colspan="2" align="center">자유 게시판</td>
</c:if>
<c:if test="${no ==10 }">
<td colspan="2" align="center">건의 게시판</td>
</c:if>
</tr>
	<tr><td width="15%" align="center">글쓴이</td>
		<td width="85%" class="leftcol">${board.name}</td></tr>
	<tr><td align="center">제목</td><td class="leftcol">${board.title}</td></tr>
	<tr><td align="center">내용</td><td class="leftcol">
		<table class="lefttoptable">
		<tr><td class="leftcol lefttoptable">${board.content}</td></tr>
		</table></td></tr>

	<tr><td colspan="2">
		<c:if test ="${board.name == loginUser.name }">
		<a href="update.dev?no=${board.no}&&bno=${board.bno}">[수정]</a>
		<a href="delete.dev?no=${board.no}&&bno=${board.bno}">[삭제]</a>
		
		</c:if>
		<a href="list.dev?no=${no }">[게시물목록]</a>
		<c:if test="${!(no >=100) }">
		<c:if test="${no!=10 }">
		<c:if test="${!empty loginUser.name  }">
		<a href="likeit.dev?no=${board.no}&&bno=${board.bno}">[추천하기]</a>
		</c:if>
		</c:if>
		<c:if test="${no==4 || no==5 }">
		<h3>추천수:${point }</h3>
		</c:if>
		</c:if>
	</td></tr>
</table>
<br><br>

<br> <br> <br>

    <div class="container">
        <div class="commentList"></div>
    </div>



<c:if test="${!empty loginUser.name  }">
    <div class="container" align="center"  >
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group"   align="center">
               <input type="hidden" name="no" value="${board.no }"/>
               <input type="hidden" name="name" value="${loginUser.name }"/>
               <input type="hidden" name="bno" value="${board.bno}"/>
            <input type="text" class="form-control"  style= "width:950px; height:85px;"   id="content" name="content" placeholder="내용을 입력하세요." /> 
				
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">댓글 등록</button>
               </span>
              </div>
        </form>
    </div>
   
    <br> <br> <br>
     </c:if>
<br><br>
<%@ include file="comment.jsp" %>
</body>


</html>
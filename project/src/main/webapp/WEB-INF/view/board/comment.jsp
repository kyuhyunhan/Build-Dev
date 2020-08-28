<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var bno = '${board.bno}'; //게시글 번호
var no='${board.no}'
var login = '${loginUser.name}';
	

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('form[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '${path}/ajax/commentList.dev',
        type : 'get',
        data : {'bno':bno ,'no':no },
        success : function(response){
        	var data = JSON.parse(response);
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-left: 400px; margin-right: 400px;">';
                a += '<div class="commentInfo'+value.rno+'">'+'작성자 :  '+value.name; 
                if (login == value.name) {
                a += '<a onclick="commentUpdate('+value.no+','+value.bno+','+value.rno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.rno+','+value.no+','+value.bno+');"> 삭제 </a> ';
                }
                a += '</div><div class="commentContent'+value.rno+'"> <p> 내용 : '+value.content +'</p>';
                
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
	console.log(insertData);
    $.ajax({
        url : '${path}/ajax/commentinsert.dev',
        type : 'post',
        data : insertData,
        success : function(data){
        	
        	alert("댓글 입력 성공");
            
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
        	
        	
        		
        	
   
        }
   
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(no,bno,rno, content2){
    var a ='';
    
    a += '<div class="input-group">';
// 	a += '<textarea rows="5" cols="140" class="form-control" name="content2" >'+content2+'</textarea>';
     a += '<input type="text" class="form-control"  style= "width:950px; height:85px;"   id="content2" name="content2" value="'+content2+'" /> ';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+no+','+bno+','+rno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+rno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(no,bno,rno){
     updateContent = $('[name=content2]').val();
    console.log(updateContent)
    $.ajax({
        url : '${path}/ajax/commentupdate.dev',
        type : 'post',
        data : {'content' : updateContent, 'no':no ,'bno':bno ,'rno' : rno },
        success : function(data){
             commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(rno,no,bno){
    $.ajax({
        url : '${path}/ajax/commentdelete.dev',
        type : 'post',
        data : {
        	'rno' :rno,
        	'no':no,
        	'bno':bno
        },
        success : function(data){
        	
             commentList(bno); //댓글 삭제후 목록 출력 
             alert("댓글이 삭제되었습니다.")
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>
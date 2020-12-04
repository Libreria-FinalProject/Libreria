<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#qna_container{
		width: 950px;
		margin-top: 30px;
	}
		
	#qna_container #small_title{
		color: #9ea7ad;
		font-size: 13px;
	}
	
   .qna_title{
       margin-top: 50px;
      font-size:32px;
   }

   .qna_content{
   	   margin-top : 30px;
   	   margin-bottom: 30px;
       padding:10px;
       font-size: 15px;
       color:#333333;
       border-bottom: 1px solid #e6e8eb;
   }

   .qna_content > p {
	    padding-bottom: 10px;
	    padding-top: 10px;
	    white-space: pre;
	    line-height: 2em;
      
   } 

   .list_button{
       padding:20px;
       display: flex;
   }

   .buttons{
      	width:100px;
		height: 40px;
		cursor: pointer;
		background-color: rgb(94, 107, 159);
		color: #ffffff;
		border: none;
		border-radius: 4px;  
		font-size: 16px;
		font-weight: bold;
   }
   .centerBtn{
   		flex:3;

   }
   .rightBtn{
   		flex:1;
   		display: inline;
   }

  .qna_date{
  	text-align: right;
  	padding: 5px 0;
  }
  
  .qna_reply_div{
	  	text-align: center;
  }
  
  .qna_reply{
	  	margin: 10px auto;
	  	color: #333333;
	  	text-align: left;
	  	padding: 10px;
	  	font-size: 15px;
	  	border-bottom: 1px dotted #e6e8eb;
	  	display: flex;
	  	white-space: pre;
  }

  .qna_reply .eq_qna_reply_content{
  		flex:8;
  		padding: 0 10px;
  }
  .qna_reply .eq_qna_reply_writer{
        flex:1;
  }
  .qna_reply .eq_qna_reply_date{
        flex:1;
  } 
  .qna_insert{
  	 background-color:#e6e8eb; 
  	 padding: 20px 10px;
  	 display: block !important;
  }

  .qna_reply textarea{
  	border: none;
  	width: 600px;
  	height: 50px;
  	resize: none;
  	padding: 10px;
  }
  .qna_reply button{
  		width: 50px;
    	height: 30px;
    	margin: 21px;
    	position: absolute;
  }
  
  .x_icon{
  	display: inline-block;
  	width:10px;
  	height: 10px;
  	background-image: url("resources/images/x_icon.png");
  	background-size: contain;
  	margin-left: 10px;
  	cursor: pointer;
  }
  
  #reply_limit_div{
      position: absolute;
      margin-left: 590px;
      margin-top: -10px;
  }
  
  #txt_count{
  	 display: inline-block;
     width: 30px;
     text-align: right;
}
  }
   section a:link { color: black; text-decoration: none;}
   section a:visited { color: black; text-decoration: none;}
   section a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   <section>
   <div id="qna_container">
  		<span id="small_title">LIBRERIA 고객센터 > Q&A</span>
	    <h1 class="qna_title">
	       [Q&A] ${qna.bo_title }
	    </h1>  
	    <div class="qna_content">
	    	<div class="qna_date">${qna.bo_date }</div>
	    	<div class="qna_date">${qna.mem_name }</div>
	        <p>${qna.bo_content }</p>
	        <img src="${img.file_path }${img.change_name}">
	    </div>
	    <div class="qna_reply_div">
	    	<c:if test="${!empty replyList }">
	    	<c:forEach var="reply" items="${replyList }">
	    	<div class="qna_reply"><div class="eq_qna_reply_content">${reply.reply_content }
	    			<c:if test="${reply.mem_no eq loginUser.mem_no }"><div class="x_icon"><input type="hidden" value="${reply.reply_no }"></div></c:if></div>
	    						   <div class="eq_qna_reply_writer">${reply.mem_name }</div>
	    						   <div class="eq_qna_reply_date">${reply.reply_date }</div></div>	    	
	    	</c:forEach>
	    	</c:if>
	    	<c:if test="${loginUser!=null }">
	    	<div class="qna_reply qna_insert">
	    		<textarea id="reply_content"></textarea><button type="button" class="buttons" onclick="insertReply();">작성</button>
	    		<div id="reply_limit_div">글자수 : <div id="txt_count">0</div>/200자</div>
	    	</div>
    		</c:if>
	    </div>
	    <div class="list_button" align="center">
	    	<div class="centerBtn">
	        <button class="buttons" onclick="location.href='QNAList.bd'">목록으로</button>
	        </div>
        <c:if test="${ loginUser.mem_no == qna.mem_no}">
        	<div class="rightBtn">
	        <button class="buttons updateBtn">수정</button>
	        <button class="buttons deleteBtn">삭제</button>
	        </div>
        </c:if>
	    </div>
    </div>
       <script type="text/javascript">
        $('.updateBtn').click(function(){
        	var bo_no = "${qna.bo_no}";
        	location.href="QNAUpdateForm.bd?bo_no="+bo_no;
        });
       
   		$('.deleteBtn').click(function(){
   			swal({
   				title: "",
   				text: "해당 게시물을 삭제하시겠습니까?",
   				icon: "warning",
   				buttons: ["취소","삭제"],
   				dangerMode: true})
   			.then((ok)=>{
   				if(ok){
   					var bo_no = "${qna.bo_no}";
   	   	   			$.ajax({
   	   	   				url: "deleteBoard.bd",
   	   	   				data: {bo_no:bo_no},
   	   	   				success:function(data){
   	   	   					if(data==1){
   	   	   						swal("","게시물이 삭제되었습니다.","success")
   	   	   						.then((ok)=>{
   	   	   							if(ok){
   	   	   								location.href="QNAList.bd";
   	   	   							}
   	   	   						});
   	   	   					}else{
   	   	   						swal("","게시물 삭제에 실패하였습니다.","fail");
   	   	   					}
   	   	   				},
   	   	   				error: function(){
   	   	   					alert("ajax 에러");
   	   	   				}
   	   	   			}); 
   				}
   			});
   			
   		});
   		
   		$('.x_icon').click(function(){
   			var reply_no = $(this).find('input[type=hidden]').val();
   			swal({
   				title: "",
   				text : "해당 댓글을 삭제하시겠습니까?",
   				icon: "warning",
   				buttons: ["취소","삭제"],
   				dangerMode: true
   			}).then((ok)=>{
   				if(ok){
   					$.ajax({
   						url: "deleteReply.bd",
   						type: 'POST',
   						data: {reply_no:reply_no},
   						success: function(data){
   							if(data==1){
   								swal("","댓글이 삭제되었습니다.","info")
   								.then((ok)=>{
   									if(ok){
   										location.reload();
   									}
   								});
   							}
   							
   						},
   						error: function(){
   							alert("ajax 에러");
   						}
   					})
   				}
   			});
   		});
   		
   		$('#reply_content').on("keyup",function(){
   			var reply = $(this).val();
   			if(reply.length>200){
   				swal("","200자 이하로만 작성가능합니다.","info");
   				reply = reply.substr(0, reply.length-1);
   				$(this).val(reply);
   				return false;
   			}
   			$('#txt_count').text(reply.length);
   		});
   		
   		function insertReply(){
   			var reply_content = $("#reply_content").val();
   			var bo_no ="${qna.bo_no}";
   			var mem_no= "${loginUser.mem_no}";
   			
   			if(reply_content == ""){
   				swal("","댓글을 작성해주세요.","info");
   				return false;
   			}else{
   				$.ajax({
   					url: "insertReply.bd",
   					type:'POST',
   					data: {reply_content:reply_content, bo_no:bo_no, mem_no:mem_no},
   					success: function(data){
   						if(data==1){
   							swal("","댓글이 등록되었습니다.","success")
   							.then((ok)=>{
   								if(ok){
   									location.reload();
   								}
   							});
   						}
   					},
   					error: function(){
   						alert("ajax 에러");
   					}
   				});
   			}
   		}
   	
   </script>

   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
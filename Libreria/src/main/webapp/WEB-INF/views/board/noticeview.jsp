<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#notice_container{
		width: 950px;
		margin-top: 30px;
	}
		
	#notice_container #small_title{
		color: #9ea7ad;
		font-size: 13px;
	}
	
   .notice_title{
       margin-top: 50px;
      font-size:32px;
   }

   .notice_content{
   	   margin-top : 30px;
   	   margin-bottom: 30px;
       padding:10px;
       font-size: 15px;
       color:#333333;
       border-bottom: 1px solid #e6e8eb;
   }

   .notice_content > p {
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

  .notice_date{
  	text-align: right;
  	padding: 5px 0;
  }
  
  .notice_insert{
  	 background-color:#e6e8eb; 
  	 padding: 20px 10px;
  	 display: block !important;
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
   section a:link { color: black; text-decoration: none;}
   section a:visited { color: black; text-decoration: none;}
   section a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   <section>
   <div id="notice_container">
  		<span id="small_title">LIBRERIA 고객센터 > 공지사항</span>
	    <h1 class="notice_title">
	       [공지사항] ${notice.bo_title }
	    </h1>  
	    <div class="notice_content">
	    	<div class="notice_date">${notice.bo_date }</div>
	    	<div class="notice_date">${notice.mem_name }</div>
	        <p>${notice.bo_content }</p>
	        <img src="${img.file_path }${img.change_name}">
	    </div>
	    <div class="list_button" align="center">
	    	<div class="centerBtn">
	        <button class="buttons" onclick="location.href='NoticeList.bd'">목록으로</button>
	        </div>
        <c:if test="${ loginUser.mem_no == notice.mem_no}">
        	<div class="rightBtn">
	        <button class="buttons updateBtn">수정</button>
	        <button class="buttons deleteBtn">삭제</button>
	        </div>
        </c:if>
	    </div>
    </div>
       <script type="text/javascript">
        $('.updateBtn').click(function(){
        	var bo_no = "${notice.bo_no}";
        	location.href="NoticeUpdateForm.bd?bo_no="+bo_no;
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
   					var bo_no = "${notice.bo_no}";
   	   	   			$.ajax({
   	   	   				url: "deleteBoard.bd",
   	   	   				data: {bo_no:bo_no},
   	   	   				success:function(data){
   	   	   					if(data==1){
   	   	   						swal("","게시물이 삭제되었습니다.","success")
   	   	   						.then((ok)=>{
   	   	   							if(ok){
   	   	   								location.href="noticeList.bd";
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
   		
   	
   </script>

   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#faq_container{
		width: 950px;
		margin-top: 30px;
	}
		
	#faq_container #small_title{
		color: #9ea7ad;
		font-size: 13px;
	}
	
   .faq_title{
       margin-top: 50px;
      font-size:32px;
   }

   .faq_content{
   	   margin-top : 30px;
   	   margin-bottom: 30px;
       padding:10px;
       font-size: 15px;
       color:#333333;
       border-bottom: 1px solid #e6e8eb;
   }

   .faq_content > p {
       padding-bottom:10px;
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

  .faq_date{
  	text-align: right;
  	padding: 5px 0;
  }
   section a:link { color: black; text-decoration: none;}
   section a:visited { color: black; text-decoration: none;}
   section a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   <section>
   <div id="faq_container">
  		<span id="small_title">LIBRERIA 고객센터 > FAQ</span>
	    <h1 class="faq_title">
	       [FAQ] ${faq.bo_title }
	    </h1>  
	    <div class="faq_content">
	    	<div class="faq_date">${faq.bo_date }</div>
	    	<div class="faq_date">${faq.mem_name }</div>
	        <p>${faq.bo_content }</p>
	        <p>감사합니다.</p>
	    </div>
	    <div class="list_button" align="center">
	    	<div class="centerBtn">
	        <button class="buttons" onclick="location.href='FAQList.bd'">목록으로</button>
	        </div>
	    </div>
    </div>
   </section>
   <script type="text/javascript">
   		$('.deleteBtn').click(function(){
   			swal({
   				title: "",
   				text: "해당 게시물을 삭제하시겠습니까?",
   				icon: "warning",
   				buttons: ["취소","삭제"],
   				dangerMode: true})
   			.then((ok)=>{
   				if(ok){
   					var bo_no = "${faq.bo_no}";
   	   	   			$.ajax({
   	   	   				url: "deleteBoard.bd",
   	   	   				data: {bo_no:bo_no},
   	   	   				success:function(data){
   	   	   					if(data==1){
   	   	   						swal("","게시물이 삭제되었습니다.","success")
   	   	   						.then((ok)=>{
   	   	   							if(ok){
   	   	   								location.href="FAQList.bd";
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
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
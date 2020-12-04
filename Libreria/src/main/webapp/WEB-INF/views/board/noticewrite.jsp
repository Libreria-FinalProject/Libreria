<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
   #notice_container{ 
		margin-top: 30px;
	}
	
	#notice_container #small_title{
		color: #9ea7ad;
		font-size: 13px;
	} 
	#notice_header{
		display: flex;
		margin-top: 30px;
	}
   .notice_title{
  	   flex: 7;
      font-size:32px;
      font-weight: bold;
   }
   
    #btn_div{
    	text-align: center;
    }
    #insertBtn{
   		width: 150px;
   		height: 30px;
		cursor: pointer;
		background-color: rgb(94, 107, 159);
		color: #ffffff;
		border: none;
		border-radius: 4px;  
		font-size: 16px;
		font-weight: bold;
   }

   .notice_body{
      padding:10px;
      font-size:16px;
      list-style: none;
      margin-top: 50px;
      width: 700px;
   }
   
   .notice_body label{
   		display: block;
   		font-size: 15px; 
   		margin-top: 30px;
   }
   
   .notice_body input,
   .notice_body textarea,
   #file_sub_dive{
   		display: block;
   		border: 1px solid #d1d1d1;
   		border-radius: 3px;
   		width:100%;
   		height: 40px;
   		margin: 10px 0px;
   		padding: 5px;
   }
    .notice_body textarea{
    	height: 240px !important;
    }
  	.notice_body input[type=file]{
  		opacity: 0;
  		margin: 0 !important;
  		position: absolute;
  		right: 0;
  		top: 0;
  		cursor: pointer;
  	}
  	
  	#file_div{
  		height: 120px;
  	}
  	
  	#file_sub_div{
  		text-align: center;
  		color: #333333;
  		font-size: 13px;
  		overflow: hidden;
  		position: relative;
  		margin: 10px 0;
  		border: 1px solid #d1d1d1;
  	}
  	
  	#file_sub_div span{
  		line-height: 3em;
  	}
   
    .notice_list li{
   		display: flex;
    	border-top: 1px solid #e6e8eb;
    	padding: 20px 20px 20px 0;
    	color: #333333;
    	text-align: right;
    }
    .notice_list a{
    	flex: 1;
    	text-align: left;
    }
    
    .notice_list span{
    	padding: 0 15px;
    }

   .notice_list_font{
      font-size: 20px;   
      font-weight: bold;
   }
   
   .red-dot{
	  vertical-align: top;
   		color: red;
   		font-size: 10px;
   }
   
   .upload_file_name{
   	    display: none;
   		width: 100%;
	    height: 30px;
	    border-radius: 3px;
	    font-size: 13px;
	    line-height: 2em; 
   }
   
   #clip_icon{
        background-image: url(resources/images/paper-clip.png);
	    background-size: contain;
	    background-repeat: no-repeat;
	    width: 13px;
	    height: 13px;
	    margin-right: 20px;
	    display: inline-block;
   }
   section a:link { color: #333333; text-decoration: none;}
   section a:visited { color: gray; text-decoration: none;}
   section a:hover { color:  #333333; text-decoration: none;}
</style>
</head>
<body>
  <c:import url="../common/header.jsp"></c:import>
	<section>
	<div id="notice_container">
	         <div id="small_title">LIBRERIA 고객센터 > 공지사항</div>
	         <div id="notice_header"><div class="notice_title">LIBRERIA 공지사항</div></div>
	         <form method="post" action="NoticeWrite.bd" enctype="Multipart/form-data">
	            <input type="hidden" name="mem_no" value="${loginUser.mem_no}">
	         	<input type="hidden" name="cate_no" value="3">
		         <div class="notice_body">
		         	<label>제목<span class="red-dot">*</span></label><input type="text" name="bo_title" id="bo_title">
		         	<label>공지사항 내용<span class="red-dot">*</span></label><textarea style="resize: none" name="bo_content" id="bo_content"></textarea>
		         	<div id="file_div"><label>첨부파일<span class="red-dot">*</span></label>
		         		<div id="file_sub_div"><input type="file" name="uploadFile" accept=".jpg,.png"><span>파일 업로드</span></div>
		         		<div class="upload_file_name"><div id="clip_icon"></div></div>  	
		        	 </div>
		        	 <div id="btn_div"><button type="submit" onclick="return validate();" id="insertBtn">제출</button></div>
		         </div>
	         </form>
	</div>
   <script type="text/javascript">
   		$('input[type=file]').on('change',function(){
	   		 if(window.FileReader){
	   	      var filename = $(this)[0].files[0].name;
	   	    } else {
	   	      var filename = $(this).val().split('/').pop().split('\\').pop();
	   	    }
	   		$(".upload_file_name").html("<div id='clip_icon'></div>"+filename);
	   		$(".upload_file_name").css("display","block");
   		});
   		
   		function validate(){
   			if($.trim($('#bo_title').val()).length==0){
   				swal("","제목을 입력해주세요.","info")
				.then((ok)=>{
					if(ok){
						$('#bo_title').focus();
					}
				});
				return false;
   			}
   			if($.trim($('#bo_content').val()).length==0){
   				swal("","내용을 입력해주세요.","info")
				.then((ok)=>{
					if(ok){
						$('#bo_content').focus();
					}
				});
				return false;
   			}
 			return true;
   		}
   </script>
   </section>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
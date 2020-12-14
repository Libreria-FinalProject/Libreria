<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
   <link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
   <title>Libreria</title>
   <meta charset="UTF-8">
<style type="text/css">

	@import url(http://fonts.google.com/earlyaccess/nanumgothic.css);
	
.idsr-header{
   		font-size:30px;
   }
   .account-label{
	width:400px;
}
.account-container {
    width: 400px;
    padding: 60px 0 70px;
    margin-top:100px;
    margin-bottom:120px;
}
.idsr_textarea{
	width: 100%; 
	height:40px; 
	border: 2px solid #d6deeb;
	}
.idsr-submit{
	width: 404px;
    height: 50px;
    background-color: rgba(94, 107, 159, 0.65);
    border: none;
    border-radius: 3px;
    color: white;
    font-weight: 700;
    font-size: larger;
    
 }
.input-group{
	margin-top:40px;
	margin-bottom:20px;
}
#mem_name{
	border-radius: 3px 3px 0px 0px;
	border-bottom:none;
}
#mem_tel{
	border-radius: 0px 0px 3px 3px;
}
.idsr-error{
	font-size:small;
	color: red;
}
.idsr-header{
   text-align:center;
}
.hidden_line_cl{
	 display:none;
	 height: 30px;
	 list-style: none;
}
</style>

</head>
<body>
<c:import url="../common/header.jsp"></c:import>
 <section id="idsr" class="account-container">
   	 <p class="idsr-header">아이디 찾기</p>
     <form action="idSearchA.me" method="post" id="idSearchForm" onSubmit="return validate();">
    	<div class="input-group">
     	  <label class="account-label">
     	  		<input type="text" name="mem_name" id="mem_name" title="이름 입력" placeholder="이름" autocapitalize="off" autocomplete="off" class="idsr_textarea"> 
     	  </label>
     	  <label class="account-label">
     	  		<input type="text" name="mem_tel" id="mem_tel" title="휴대폰번호 입력" placeholder="휴대폰번호" autocapitalize="off" autocomplete="off" class="idsr_textarea"> 
     	  </label>
     	  <li class="hidden_line_cl" style=border:none;>
     	 		<div class="idsr-error" id="idSearch_check"></div>
     	  </li>
     	</div>
     	<button class="idsr-submit" type="submit" id="idSearchButton" onclick="validate();">Submit</button>
   	</form>
   	<script>
   	
/*    	function validate(){
   		
   		var name = $("#mem_name").val();
   		var phone = $("#mem_tel").val();

   		var postData = {'mem_name' : name ,'mem_tel': tel};
   		
   		$.ajax({
   			data: {'mem_name':name , 'mem_tel':phone},
   			url:'idSearchA.me',
   			dateType: 'json', 
            contentType: "application/json; charset=UTF-8",
            
           	success : function(data) {
    			if(data != "true"){ 
    				$('#"idSearchForm"').submit();
    			}else{
    				$('#idSearch_check').text('정보를 다시 입력해주세요.');
					$('#idSearch_check').css('color', 'red'); 
					$('#idSearch_check').css('font-size','12px');
					return false;
    			}
            },
   		})
   	}  
   	 */
   	
    $("#mem_tel").on("keyup",function(){
     	var inputTel = $("#mem_tel").val();
 		console.log(inputTel);
 		var tmp="";
 		inputTel = inputTel.replace(/[^0-9]/g,'');

 		if(inputTel.length<4){  //01012341234
 			tmp+=inputTel;
 		}else if(inputTel.length<7){ //
 			tmp+=inputTel.substr(0,3); // 010
 			tmp+='-';    
 			tmp+=inputTel.substr(3);  // 010-123
 		}else if(inputTel.length<11){ //010-1234-1 ...
 			tmp += inputTel.substr(0, 3);   // 010
 			tmp += '-';
 			tmp += inputTel.substr(3, 3); //010-123
 			tmp += '-';
 			tmp += inputTel.substr(6); //010-123-412
 		}else{  
 			tmp += inputTel.substr(0, 3);  
 			tmp += '-';
 			tmp += inputTel.substr(3, 4);
 			tmp += '-';
 			tmp += inputTel.substr(7); 
 		}
 		  $("#mem_tel").val(tmp);
     });
    
    

   	
</script>
   
   </section> 
<c:import url="../common/footer.jsp"></c:import>
</body>

</html>
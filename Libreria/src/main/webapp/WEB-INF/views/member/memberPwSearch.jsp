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
   .account-label{
	width:400px;
}
.account-container {
    width: 400px;
    padding: 60px 0 70px;
    margin-top:100px;
    margin-bottom:120px;
}
.pwsearch_textarea{
	width: 100%; 
	height:40px; 
	border: 2px solid #d6deeb;
	}
.pwsearch-submit{
	width: 404px;
    height: 50px;
    margin-top: 10px;
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
#mem_email{
	border-radius: 3px 3px 0px 0px;
	border-bottom:none;
}
#mem_name{
	border-bottom:none;
}
#mem_tel{
	border-radius: 0px 0px 3px 3px;t
}
.pw_search_text{
	font-size:small;
	color: red;
}
.pwsearch-header{
   text-align: center;
}
.hidden_line_cl{
	 display:none;
	 height: 30px;
	 list-style: none;
	 border:none;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section id="pwsearch" class="account-container">
   	 <p class="pwsearch-header" align="center";>비밀번호 재설정</p>
     <form action="findPw.me" id="pwSearchForm" onSubmit="return validate();" >
    	<div class="input-group">
     	  <label class="account-label">
     	  		<input type="text" name="mem_email" id="mem_email" title="아이디 입력" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="pwsearch_textarea"> 
     	  </label>
     	  <label class="account-label">
     	  		<input type="text" name="mem_name" id="mem_name" title="이름 입력" placeholder="이름" autocapitalize="off" autocomplete="off" class="pwsearch_textarea"> 
     	  </label>
     	  <label class="account-label">
     	  		<input type="phone" name="mem_tel" id="mem_tel" title="휴대폰번호 입력" placeholder="휴대폰번호" autocapitalize="off" autocomplete="off" class="pwsearch_textarea"> 
     	  </label>

     	 		<div class="pw_search_text" id = "pwSearch_check"></div>
     	</div>
     	<button class="pwsearch-submit" type="submit" id="findBtn">Submit</button>
     	<input id="result" name="result" type="hidden" value="0"/>
   	</form>
   <script>
   var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일 검사 정규식
   var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이름 정규식          
   var phoneJ = /^\d{3}-\d{3,4}-\d{4}$/;;// 휴대폰 번호 정규식
   
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
   
   function validate(){
	   
		// 이메일 정규식
		if (mailJ.test($('#mem_email').val())) { 
			console.log(mailJ.test($('#mem_email').val())); 
		} else { 
			swal("",'아이디를 확인하세요',"info"); 
			$('#mem_email').focus();
			return false; 
		}
		// 이름 정규식
		if (nameJ.test($('#mem_name').val())) { 
			console.log(nameJ.test($('#mem_name').val())); 
		} else { 
			swal("",'이름을 확인하세요',"info"); 
			$('#mem_name').focus();
			return false; 
		}
		// 휴대폰번호 정규식
		if (phoneJ.test($('#mem_tel').val())) {
			console.log(phoneJ.test($('#mem_tel').val()));
		} else { 
			swal("",'휴대폰번호를 확인하세요',"info"); 
			$('#mem_tel').focus();
			return false; 
		}
	var mem_email = $("#mem_email").val();
	var mem_tel = $("#mem_tel").val();
	var mem_name = $("#mem_name").val();
	var result = $('#result').val();
   
   if(mem_email != "" && mem_tel != "" && mem_name != ""){
			$.ajax({
				url : "findPw.me",
				data : {
				 	mem_email:mem_email,
				 	mem_tel:mem_tel,
				 	mem_name:mem_name
				},
				success : function(data) {
					logger.debug("ajax 성공");
					console.log(data);
					
					if(data !="0"){
						$('#result').val(data);
					}else{	
					}
				},				
			});
			return true;
	   }else{
	  		swal("오류","입력한 정보를 다시 확인해주세요","error");
	  		return false;
	  	}
	}
   
   </script>
   </section>
   
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
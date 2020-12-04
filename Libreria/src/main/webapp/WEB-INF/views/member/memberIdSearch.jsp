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
#name_idsearch{
	border-radius: 3px 3px 0px 0px;
	border-bottom:none;
}
#idsr_phone{
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
     <form>
    	<div class="input-group">
     	  <label class="account-label">
     	  		<input type="text" name="name_idsearch" id="name_idsearch" title="이름 입력" placeholder="이름" autocapitalize="off" autocomplete="off" class="idsr_textarea"> 
     	  </label>
     	  <label class="account-label">
     	  		<input type="phone" name="phone_idsearch" id="phone_idsearch" title="휴대폰번호 입력" placeholder="휴대폰번호" autocapitalize="off" autocomplete="off" class="idsr_textarea"> 
     	  </label>
     	  <li class="hidden_line_cl" style=border:none;>
     	 		<label class="idsr-error" >올바른 정보를 입력해주세요.</label>
     	  </li>
     	</div>
     	<button class="idsr-submit" type="submit" id="idSearchButton" onclick="validate();">Submit</button>
   	</form>
   	<script>
	$('#idSearchButton').Click(function(){
		var name = $('#name_idsearch');
		var phone = $('#phone_idsearch');
		
		console.log(name);
		console.log(phone);
		
		$.ajax({
			url: "<%= request.getContextPath() %>/idSearch.me",
			type: 'post',
			data: { mem_name:mem_name.val(), mem_phone:mem_phone.val()},
			success: function(data){
				console.log(data);
					
				$('#idResult2').text('');
				
					if(data.length > 2 ){
						$('#idResult2').append('아이디는');
					$('#idResult2').append(data);
					$('#idResult2').append(' 입니다.');
					$('#idResult2').css({'color':'black'});
				} else{
					$('#idResult2').text('찾을 수 없습니다.');
					$('#idResult2').css({'color':'red'});
				}
			}
		});
	});
</script>
   
   </section> 
<c:import url="../common/footer.jsp"></c:import>
</body>

</html>
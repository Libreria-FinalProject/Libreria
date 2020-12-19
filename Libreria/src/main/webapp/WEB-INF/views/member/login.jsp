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
	
#table	{
   		border: 1px solid black;
   		border-collapse: collapse;
   	}
   	
   .login-header{
   		font-size:50px;
   }

.account-label{
	width:400px;
}
.account-container {
    width: 400px;
    margin: 0 auto;
    padding: 60px 0 70px;
    margin-top:100px;
    margin-bottom:120px;
}

.login-submit{
	width: 404px; 
	height : 50px; 
	margin-top : 10px; 
	background-color: rgba(94, 107, 159, 0.65); 
	border:none;
	color:white;
	font-weight: 700;
    font-size: larger;
    border-radius:3px;
	
	}
.signup-button{
	width: 404px; 
	height : 50px; 
	margin-top : 10px; 
	background-color: #c1c8e5; 
	border: 0;
	color:white;
	font-weight: 700;
    font-size: larger;
	border-radius:3px;
	}

.login_id_pw{
	width: 100%; 
	height:40px; 
	border: 2px solid #d6deeb;
	}
#login_id{
	border-bottom: none;
	border-radius:3px 3px 0px 0px;
}
#login_pw{
	border-radius:0px 0px 3px 3px;
}
.account-checkbox{
	width:33%
}
.idsearch-link{
	float:right;
}
.input-group{
	margin-top:40px;
	margin-bottom:20px;
}
.link{
	font-family: "Arial Black";
	text-align:center;
}

#kakaoBtn, #kakaoLogin{
	background-image: url("resources/images/kakaoback.png");
    width: 404px;
    height: 50px;
    margin-top: 10px;
    border: none;
    border-radius: 3px;
    text-align: center;
    line-height: 2.5em;
    font-size: 19px;
    color: #333;
    font-weight: bold;
    cursor: pointer;

    float: left;
}

</style>
</head>
<body>
<script src="https://developers.kakao.com/sdk/js/kakao.js" ></script>
<c:import url="../common/header.jsp"></c:import>
   <section id="login" class="account-container">
   	 <p class="login-header" align="center">LOGIN</p>
     <form  method="post" id="loginForm">
     	  <div class="input-group">
     	  	<label class="account-label">
     	  		<input type="text" name="mem_email" id="login_id" title="아이디 입력" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="login_id_pw"> 
     	  	</label>
     	  	<label class="account-label">
     	  		<input type="password" name="mem_pw" id="login_pw" title="비밀번호 입력" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class="login_id_pw"> 
     	  	</label>
     	  	<div class="remember-wrapper" >
<!--      	  		<label class="account-checkbox">
     	  			<input type="checkbox" name="auto_login">
     	  			<span class="link">로그인 상태 유지</span>
     	  		</label> -->
     	  		<div class="idsearch-link">
     	  			<a href="idSearch.me" id="IdSearch" class="link">아이디 찾기</a>
     	  			<a href="pwSearch.me" id="pwSearch" class="link">비밀번호 재설정</a>
     	  		</div>
     	  	</div>
     	  </div>
     	  <button class="login-submit" type="button" onclick="validate();">Login</button>

     	  <button class="signup-button" type="button" onclick="location.href='enrollView.me'">Join</button>
 		  <div id="kakaoLogin" onclick="loginWithKakao();">로그인</div>
     	  <div id="kakaoBtn" onclick="joinWithKakao();">카카오 계정으로 가입</div>
   	</form>
   	<form id="kakaoForm" method="post" action="enrollViewKakao.me">
   		<input type="hidden" id="kakaoEmail" name="kakaoEmail">
   		<input type="hidden" id="kakaoName" name="kakaoName">
   		<input type="hidden" id="kakaoGender" name="kakaoGender">
   	</form>

   </section>
   
<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">
	$(function(){
		Kakao.init('9825f8ee7c5749fcba65382d3b6f9521');

	});
	
	$("#login_pw").keyup(function(evt){
		if(evt.keyCode==13){
			validate();
		}
	});
	
	function validate(){
		var login_id =$('#login_id').val();
		var login_pw =$('#login_pw').val();
		flag=false;
		if($.trim(login_id).length==0){
			
			swal("","아이디를 입력해주세요.","info")
			.then((ok)=>{
			
				return false;
			});
			
		}else if($.trim(login_pw).length==0){
			
			swal("","비밀번호를 입력해주세요.","info")
			.then((ok)=>{
				
				return false;
			});
			
		}else{
			
			var form = $("#loginForm").serialize();
			$.ajax({
				url: "login.me",
				data: form,
				success: function(data){
					if(data==1){
						location.href="/libreria";	
					}else{
						swal("로그인 실패","아이디 및 비밀번호를 확인해주세요.","error")
						.then((ok)=>{
							if(ok){
								$('#login_id').val("");
								$('#login_pw').val("");
							}
						});
					}
				}
			});
		}
	}
	
	 function joinWithKakao() {
	    Kakao.Auth.login({
	      success: function(authObj) {
	    	  Kakao.API.request({
	    		    url: '/v2/user/me',
	    		    success: function(res) {
	    		        console.log(res);
	    		        $('#kakaoEmail').val(res.kakao_account.email);
	    		        $('#kakaoName').val(res.properties.nickname);
	    		        $('#kakaoGender').val(res.kakao_account.gender);
						$('#kakaoForm').submit();
	    		    },
	    		    fail: function(error) {
	    		        console.log(error);
	    		    }
	    		});
	      },
	      fail: function(error) {
	       	console.log(err);
	      }
	    })
	}
	 
	 function loginWithKakao() {
		    Kakao.Auth.login({ // 카카오 로그인 팝업 창 띄우기
		      success: function(authObj) { // 카카오 아이디와 비밀번호 입력하여 카카오측 로그인 성공 시
		    	  Kakao.API.request({  // 카카오측에 가입정보를 가져옴
		    		    url: '/v2/user/me',
		    		    success: function(res) { // 통신 성공
		    		        console.log(res); 
		    		        var kakaoEmail = res.kakao_account.email; // 카카오측에 가입되어있는 이메일을 저장
		    		       	$.ajax({  
		    		       		url: "loginWithKakao.me", 
		    		       		type: 'POST',
		    		       		data: {mem_email: kakaoEmail},
		    		       		success: function(data){
		    		       			if(data==1){
		    		       				location.href='/libreria';
		    		       			}else{
		    		       				swal("","로그인에 실패하였습니다.\n카카오 계정을 확인해주세요.",'info');
		    		       			}
		    		       		},
		    		       		error :function(){
		    		       			alert("ajax 에러");
		    		       		}
		    		       	})
		    		    },
		    		    fail: function(error) {
		    		        console.log(error);
		    		    }
		    		});
		      },
		      fail: function(error) {
		       	console.log(err);
		      }
		    })
		}	
	 
</script>
</body>
</html>
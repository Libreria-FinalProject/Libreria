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
  
  
#table{
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
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   <section id="login" class="account-container">
   	 <p class="login-header" align="center">LOGIN</p>
     <form action="login.me" method="post">
     	  <div class="input-group">
     	  	<label class="account-label">
     	  		<input type="text" name="mem_email" id="login_id" title="아이디 입력" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="login_id_pw"> 
     	  	</label>
     	  	<label class="account-label">
     	  		<input type="password" name="mem_pw" id="login_pw" title="비밀번호 입력" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class="login_id_pw"> 
     	  	</label>
     	  	<div class="remember-wrapper" >
     	  		<label class="account-checkbox">
     	  			<input type="checkbox" name="auto_login">
     	  			<span class="link">로그인 상태 유지</span>
     	  		</label>
     	  		<div class="idsearch-link">
     	  			<a href="" class="link">아이디 찾기</a>
     	  			<a href="" class="link">비밀번호 재설정</a>
     	  		</div>
     	  	</div>
     	  </div>
     	  <button class="login-submit" type="submit">Login</button>
     	  <a href="" class="signup-link">
     	  	<button class="signup-button">Join</button>
     	  </a>
   	</form>
   </section>
   
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
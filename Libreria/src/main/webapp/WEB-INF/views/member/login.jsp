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
	 #table{
         border: 1px solid black;
         border-collapse: collapse;
      }
	      
	   .login-header{
	         font-size:50px;
	         
	   }
	      
	  .account-login .remember-wrapper {
		    margin-top: -1px;
		    padding: 13px 8px 13px 16px;
		    overflow: hidden;
		    border: 1px solid #d6deeb;
		    border-radius: 0 0 4px 4px;
		    background: #f7fbff;
		    z-index: 1;
		}
		.account-label{
		   width:400px;
		}
		.account-container {
		    width: 400px;
		    margin: 0 auto;
		    padding: 60px 0 70px;
		}
		.invisible {
		    position: absolute;
		    width: 1px;
		    height: 1px;
		    margin: -1px;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		    clip: rect(0,0,0,0);
		}

	
	</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
 <section id="login" class="account-container account-login">
       <p class="login-header" align="center">JOIN</p>
     <form action="login.me" method="post">
          <div class="input-group">
             <label class="account-label">
                <!-- <span class="invisibla">아이디 입력</span>-->
                <input type="text" name="mem_email" id="login_id" title="아이디 입력" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class=""> 
             </label>
             <label class="account-label">
                <!--  <span class="invisibla">비밀번호 입력</span>-->
                <input type="password" name="mem_pw" id="login_pw" title="비밀번호 입력" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class=""> 
             </label>
             <div class="remember-wrapper">
                <label class="account-checkbox">
                   <input type="checkbox" name="auto_login">
                   <span class="link">로그인 상태 유지</span>
                </label>
                <div class="external-links">
                   <a href="" class="link">아이디 찾기</a>
                   <a href="" class="link">비밀번호 재설정</a>
                </div>
             </div>
          </div>
          <button class="login-submit" type="submit">로그인</button>
          <a href="" class="signup-link">
             <button class="signup-button">회원가입</button>
          </a>
      </form>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
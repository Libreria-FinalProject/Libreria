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
.account-container {
    width: 400px;
    margin: 0 auto;
    padding: 60px 0 70px;
    margin-top:100px;
    margin-bottom:140px;
}
.input-group{
	margin-top:40px;
	margin-bottom:20px;
}
.pwre-com-submit{
	width: 50%; 
	height : 50px; 
	margin-top : 10px; 
	background-color: rgba(94, 107, 159, 0.65); 
	border:none;
	border-radius:3px;
	color: white;
    font-weight: 700;
    font-size: larger;
}
.pwre-com-submitdiv{
	text-align:center;
}
.pwre-com{
	font-family: "Arial Black";
	text-align:center;
	font-size: larger;
	font-weight: bold;
}
.pwsearch-header{
	font-size:30px;
}
.pwre-com-complete{
	text-align:center;
	margin-bottom: 50px;
	margin-top: 50px;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section class="account-container">
		<form>
			<div class= "input-group">
				 <div class = "pwre-com-complete">
		     		<h4 class="pwre-com">"${mem_email}"로 <br>임시 비밀번호가 발송되었습니다.</h4>
				</div>
			     <div class="pwre-com-submitdiv">
			     		<input type="button" class="pwre-com-submit" value="Login" onclick="location.href='loginForm.me'">
			     </div> 
   		 	</div>
		</form>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
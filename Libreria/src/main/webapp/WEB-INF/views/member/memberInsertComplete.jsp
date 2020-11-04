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
.join-com-main{
	width: 40%; 
	height : 50px; 
	margin-top : 10px; 
	background-color: #c1c8e5; 
	border:none;
	border-radius:3px;
	color: white;
    font-weight: 700;
    font-size: larger;
}
.join-com-submit{
	width: 40%; 
	height : 50px; 
	margin-top : 10px; 
	background-color: rgba(94, 107, 159, 0.65); 
	border:none;
	border-radius:3px;
	color: white;
    font-weight: 700;
    font-size: larger;
}
.join-com-submitdiv{
	text-align:center;
}
.join-com{
	font-family: "Arial Black";
	text-align:center;
	font-size: larger;
	font-weight: bold;
}
.join-header{
	font-size:30px;
}
.join-com-complete{
	text-align:center;
	margin-bottom: 50px;
	margin-top: 50px;
}
.join-com-top{
	  font-family: "Arial Black";
      font-weight: bold;
      font-size:60px;
      color: rgb(94 107 159);
      text-align:center;
      text-decoration: none;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section class="account-container">
		<form>
			
			<div class= "input-group">
				<p class="join-com-top">LIBRERIA</p>
				<div class = "join-com-complete">
		     		<p class="join-com">"tkdwns1733@naver.com"님<br>회원가입을 축하합니다.</p>
				</div>
		    	 <div class="join-com-submitdiv">
		     		<input type="button" id="join_com_main" class="join-com-main" value="Main">
		     		<input type="button" id="join_com_submit" class="join-com-submit" value="Login">
		     	</div>
   			</div>
		</form>
   </section> 
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
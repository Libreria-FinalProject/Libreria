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
.idre-com-submit{
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
.idsr-com-submitdiv{
	text-align:center;
}
.idsr-com{
	font-family: "Arial Black";
	text-align:center;
	font-size: larger;
	font-weight: bold;
}
.idsr-com-complete{
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
				<div class = "idsr-com-complete">
		     		<h4 class="idre-com">검색된 ID는 "${SearchId}" <br>입니다.</h4>
				</div>
		     <div class="idsr-com-submitdiv">
		     		<input type="button" class="idsr-com-submit" value="Login">
		     </div>
   
   			</div>
		</form>
</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
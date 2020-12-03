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
#pw_search_id{
	border-radius: 3px 3px 0px 0px;
	border-bottom:none;
}
#pw_search_phone{
	border-bottom:none;
}
#pw_search_name{
	border-radius: 0px 0px 3px 3px;
}
.pw_search_text{
	font-size:small;
	color: red;
}
.pwsearch-header{
   text-align: center;
}
.hidden_line_cl{
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
     <form>
    	<div class="input-group">
     	  <label class="account-label">
     	  		<input type="text" name="pwsearch_user_id" id="pw_search_id" title="아이디 입력" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="pwsearch_textarea"> 
     	  </label>
     	  <label class="account-label">
     	  		<input type="phone" name="pwsearch_user_phone" id="pw_search_phone" title="휴대폰번호 입력" placeholder="휴대폰번호" autocapitalize="off" autocomplete="off" class="pwsearch_textarea"> 
     	  </label>
     	  <label class="account-label">
     	  		<input type="text" name="pwsearch_user_name" id="pw_search_name" title="이름 입력" placeholder="이름" autocapitalize="off" autocomplete="off" class="pwsearch_textarea"> 
     	  </label>
     	  <li class="hidden_line_cl">
     	 		<label class="pw_search_text" >올바른 정보를 입력해주세요.</label>
     	  </li>
     	</div>
     	<button class="pwsearch-submit" type="submit">Submit</button>
   	</form>
   
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
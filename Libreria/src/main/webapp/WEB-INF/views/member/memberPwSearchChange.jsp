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
    margin-bottom:120px;
}
.pwsearch_textarea{
	width: 200px; 
	height:30px; 
	border: 1px solid #d6deeb;
	border-radius: 3px;
	}
.pwsearch-submit{
	width: 100%; 
	height : 50px; 
	margin-top : 10px; 
	background-color: skyblue; 
	border:none;
	}
.input-group{
	margin-top:40px;
	margin-bottom:20px;
	letter-spacing: -1px;
}
.pwre-row{
	font-size:x-small;
	color: red;
	}

.pwre-submitdiv{
	width:100%;
	height:40px;
}
.pwre-text{
	position: relative;
    display: inline-block;
    width: 150px;
}
.pwre_complite_submit{
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
.pwre-submitdiv{
	text-align:center;
}
.pwsearch-header{
   text-align:center;
}
.pwre_errortext{
	font-size:small;
	color: red;
}

.pwd_re_ul_cl{
	list-style: none;
}
.hidden_line_cl{
	 height: 30px;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
 <section id="pwsearch" class="account-container">
   	 <p class="pwsearch-header">비밀번호 재설정</p>
     <form>
     	<div class="input-group">
	    	<br>
	    	<ul class="pwd_re_ul_cl">
	    		<li>
	    			<label class="pwre-text">새 비밀번호</label>
	    			<input type="password" name="pw-enrollcheck-1" id="pw-enroll-1" title="재등록비밀번호" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class="pwsearch_textarea">
	    		</li>
	    		<li>
	    			<label class="pwre-text">새 비밀번호 확인</label>
	    			<input type="password" name="pw-enrollcheck-2" id="pw-enroll-2" title="재등록비밀번호확인" placeholder="비밀번호 확인" autocapitalize="off" autocomplete="off" class="pwsearch_textarea">
	    		</li>
	    		<li class="hidden_line_cl">
	    			<div class="pwre_errortext" id=pw_check></div>
	    		</li>
	    	
	    	</ul>
     		</div>
     		<br>
     		<div class="pwre-submitdiv">
     			<button class="pwre_complite_submit">Submit</button>
     		</div>
   	</form>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
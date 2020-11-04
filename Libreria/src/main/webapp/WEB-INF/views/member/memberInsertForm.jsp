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
   .join-form-top{
   	font-size:30px;
   }
   .account-container {
    width: 400px;
    margin: 0 auto;
    padding: 60px 0 70px;
	}
	.join-form-ul{
	margin-top:40px;
	margin-bottom:20px;
	letter-spacing: -1px;
}
   .join-form-ul{
   	list-style:none;
   }
   .join-form-textarea{
   		width:400px;
   		height:50px;
   		border: 2px solid #d6deeb;
   		margin: 1px;
   		border-radius: 3px;
   }
   .join-form-textarea2{
   		width:180px;
   		height:50px;
   		border: 2px solid #d6deeb;
   		margin: 1px;
   		border-radius: 3px;
   }
   .join-form-textarea3{
   		width:294px;
   		height:50px;
   		border: 2px solid #d6deeb;
   		margin: 1px;
   		border-radius: 3px;
   }
   input[type=radio] {
    display:none; 
    margin:10px;
}
	input[type=radio] + label {
		border: 2px solid #d6deeb;
	    display:inline-block;
	    width: 98px;
	    height: 50px;
	    background-color: #f0f3ff;
	    text-align:center;
	    border-radius:3px;
	    position: relative;
	    bottom: -1px;
	    right: -6px;
	}
input[type=radio]:checked + label { 
    background-color: #c1c8e5;
    color:white;
/*     background-color: rgba(94, 107, 159, 0.65); */
     
}

.join-gender-p{
	margin-top:14px;
}
.gender-radio-label{
	color:black;
	}
.join-form-post-s{
	float: inherit;
    position: relative;
    right: -6px;
    margin-left: -7px;
	width:102px;
	height:54px;
	border: 2px solid #d6deeb;
	background-color: rgba(94, 107, 159, 0.65);
	color:white;
	border-radius:3px;
	outline: 0;
}
.join-form-post-s , input[type=radio] + label{
	cursor: pointer;
}
.attention{
	text-align: left;
    width: 357px;
    margin-top: 45px;
    padding-top: 20px;
    padding-bottom: 20px;
    border: 1px solid #c1c8e5;
    padding-left: 44px;
}
.attention>ul{
	list-style: none;
}
.att-select-wrapper{
	display: inline-block;
	width: 100px;
	border:1px solid;
	margin-top: 15px;
	border:none;
}
.attention-top{
	text-align: center;
    position: relative;
    left: -27px;
    font-size: larger;
    float: left;
}
.joinagree>ul{
	list-style: none;
	margin-top:40px;
}
.joinagree>ul>li{
	width: 400px;
    height: 40px;
    border: 1px solid #c1c8e5;
}
#jo_tr_ag1{
	border-radius:3px 3px 0px 0px;
	border-bottom:none;
}
#jo_tr_ag2{
	border-bottom:none;
}
#jo_tr_ag3{
	border-radius:0px 0px 3px 3px;
	border-top:none;
}
.join-li-cl{
	position: relative;
    left: 11px;
    bottom: -9px;
}
.dirrhks{
	float: right;
    margin-right: 20px;
}
.join-form-top{
	text-align:center;
}
.join-com{
	width: 400px;
    margin-top: 40px;
    margin-bottom: 200px;
}
#join-can-bt{
	width: 180px;
    height: 70px;
    float:left;
    background-color: #c1c8e5; 
	border: 0;
	color:white;
	font-weight: 700;
    font-size: larger;
	border-radius:3px;
    }
#join-com-bt{
	width: 210px;
    height: 70px;
    float:right;
    background-color: rgba(94, 107, 159, 0.65); 
	border:none;
	color:white;
	font-weight: 700;
    font-size: larger;
    border-radius:3px;
 }
.pwre_text3{
	font-size:small;
	color: red;
}
.test2{
	position: relative;
    display: inline-block;
    width: 150px;
}
.hidden_line_cl{
	 height: 30px;
}
#pwcheck{
	position: relative;
    top: -30px;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section id="join-form-main" class="account-container">
		<p class="join-form-top">JOIN</p>
     	 <ul class="join-form-ul">
     	 	<li>
     	 		<input type="text" name="join-form-id" id="join-form-id" title="회원ID" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<label class="pwre_text3">올바른 이메일 형식으로 입력해주세요.</label>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-pw" id="join-form-pw" title="회원PW" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>

     	 	<li>
     	 		<input type="text" name="join-form-pw-check" id="join-form-pw-check" title="회원PW 확인" placeholder="비밀번호 확인" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	  	<li class="hidden_line_cl">
     	 		<label class="pwre_text3">8자 이상, 영문/숫자/특수문자 를 입력해주세요.</label>
     	 	</li>
     	 	<li class="hidden_line_cl" id="pwcheck" style=height:1px;>
     	 		<label class="pwre_text3">동일한 비밀번호를 입력하세요.</label>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-name" id="join-form-name" title="회원NAME" placeholder="이름" autocapitalize="off" autocomplete="off"class="join-form-textarea" >
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<label class="pwre_text3">2글자 이상의 이름을 정확히 입력해주세요.</label>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-birth" id="join-form-birth" title="회원생년" placeholder="출생년도" autocapitalize="off" autocomplete="off" class="join-form-textarea2">
     	 		<input type="radio" name="join-gender" value="남" id="gender-radio1"/>
     	 		<label class="gender-radio-label" for="gender-radio1"><p class="join-gender-p">남</p></label>
     	 		<input type="radio" name="join-gender" value="여" id="gender-radio2"/>
     	 		<label class="gender-radio-label" for="gender-radio2"><p class="join-gender-p">여</p></label>
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<label class="pwre_text3">출생년도를 입력하세요.</label>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-post" id="join-form-post" title="회원우편번호" placeholder="우편번호" autocapitalize="off" autocomplete="off" class="join-form-textarea3">
     	 		<input type="button" class="join-form-post-s" value="검색"> 
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-post1" id="join-form-post1" title="회원주소1" placeholder="배송지주소" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-post2" id="join-form-post2" title="회원주소2" placeholder="상세주소" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<label class="pwre_text3">주소를 확인해주세요.</label>
     	 	</li>
     	 </ul>
     	 <div class="attention">
     	 	<p class="attention-top">관심사</p>
     	 	<br><br>
     	 	<ul>
     	 		<li class= "att-select">
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-novel" name="att-novel"> 소설
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-economy" name="att-economy"> 경영/경제
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-att-development" name="att-development"> 자기계발
     	 			</div>
     	 		</li>
     	 		<li class= "att-select">
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-essay" name="att-essay"> 에세이/시
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-trip" name="att-trip"> 여행
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-religion" name="att-religion"> 종교
     	 			</div>
     	 		</li>
     	 		<li class= "att-select">
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-foreign" name="att-foreign"> 외국어
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-science" name="att-science"> 과학
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-it" name="att-it"> 컴퓨터/IT
     	 			</div>
     	 		</li>
     	 	</ul>
     	 </div>
     	 <div class="joinagree">
     	 	<ul>
     	 		<li id="jo_tr_ag1">
     	 			<p class="join-li-cl"><input type="checkbox" id="join-terms-agree" name="join_terms_agree" class="join-li-cl-in" > 전체 약관 동의</p>
     	 		</li>
     	 		<li id="jo_tr_ag2">
     	 			<p class="join-li-cl">
     	 			<input type="checkbox" id="join-terms-agree2" name="join_terms_agree1" class="join-li-cl-in">  이용약관 동의(필수)
     	 			<a href="" class="dirrhks">약관 보기></a>
     	 			</p>
     	 		</li>
     	 		<li id="jo_tr_ag3">
     	 			<p class="join-li-cl">
     	 			<input type="checkbox" id="join-terms-agree3" name="join_terms_agree2" class="join-li-cl-in">  개인 정보 수집 및 이용(필수)
     	 			<a href="" class="dirrhks">내용 확인></a>
     	 			</p>
     	 		</li>
     	 		<li class="hidden_line_cl" style=border:none;>
     	 			<label class="pwre_text3" >이용약관에 동의해주세요.</label>
     	 		</li>
     	 	</ul>
     	 </div>
     	 <div class="join-com">
     	 	<input type="button" id="join-can-bt" value="Cancle">
     	 	<input type="button" id="join-com-bt" value="Submit">
     	 </div>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
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
   .postcodify_postcode5{
      	width:294px;
   		height:50px;
   		border: 2px solid #d6deeb;
   		margin: 1px;
   		border-radius: 3px;
   }
   .postcodify_address{
      	width:400px;
   		height:50px;
   		border: 2px solid #d6deeb;
   		margin: 1px;
   		border-radius: 3px;
   }
   .postcodify_extra_info{
      	width:400px;
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
#postcodify_search_button{
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
#idcheck{
	position: relative;
    top: -30px;
}
#idcheckok{
	position: relative;
    top: -30px;
}
.hidden_line_cl2{
	 height: 30px;
}

span.guide{display:none; font-size:12px ; top: 12px; right: 10px;}
span.ok{color: green;}
span.error{color: red;}

</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section id="join-form-main" class="account-container">
	<form action="minsert.me" method="post" id="joinForm"></form>
		<p class="join-form-top">JOIN</p>
     	 <ul class="join-form-ul">
     	 	<li>
     	 		<input type="text" name="join-form-id" id="join-form-id" title="회원ID" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide error">올바른 이메일 형식으로 입력해주세요.</span>
     	 	</li>
     	 	<li class="hidden_line_cl" id="idcheck" style=height:1px;>
     	 		<span class="guide error">이미 사용중인 아이디(이메일) 입니다.</span>
     	 	</li>
     	 	<li class="hidden_line_cl2" id="idcheckok" style=height:1px;>
     	 		<span class="guide ok">사용 가능한 아이디(이메일) 입니다.</span>
     	 	</li>
     	 	<li>
     	 		<input type="password" name="join-form-pw" id="join-form-pw" title="회원PW" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>

     	 	<li>
     	 		<input type="password" name="join-form-pw-check" id="join-form-pw-check" title="회원PW 확인" placeholder="비밀번호 확인" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	  	<li class="hidden_line_cl">
     	 		<span class="guide error">8자 이상, 영문/숫자/특수문자 를 입력해주세요.</span>
     	 	</li>
     	 	<li class="hidden_line_cl" id="pwcheck" style=height:1px;>
     	 		<span class="guide error">동일한 비밀번호를 입력하세요.</span>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-name" id="join-form-name" title="회원NAME" placeholder="이름" autocapitalize="off" autocomplete="off"class="join-form-textarea" >
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide error">2글자 이상의 이름을 정확히 입력해주세요.</span>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-birth" id="join-form-birth" title="회원생년" placeholder="출생년도" autocapitalize="off" autocomplete="off" class="join-form-textarea2">
     	 		<input type="radio" name="join-gender" value="남" id="gender-radio1"/>
     	 		<label class="gender-radio-label" for="gender-radio1"><p class="join-gender-p">남</p></label>
     	 		<input type="radio" name="join-gender" value="여" id="gender-radio2"/>
     	 		<label class="gender-radio-label" for="gender-radio2"><p class="join-gender-p">여</p></label>
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide error">출생년도를 입력하세요.</span>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-post" id="join-form-post" title="회원우편번호" placeholder="우편번호" autocapitalize="off" autocomplete="off" class="postcodify_postcode5" disabled >
     	 		<button type="button" id="postcodify_search_button">검색</button> 
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-post1" id="join-form-post1" title="회원주소1" placeholder="배송지주소" autocapitalize="off" autocomplete="off" class="postcodify_address" disabled >
     	 	</li>
     	 	<li>
     	 		<input type="text" name="join-form-post2" id="join-form-post2" title="회원주소2" placeholder="상세주소" autocapitalize="off" autocomplete="off" class="postcodify_extra_info">
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide error">주소를 확인해주세요.</span>
     	 	</li>
     	 </ul>
     	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<script>
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
		</script>
     	 <div class="attention">
     	 	<p class="attention-top">관심사</p>
     	 	<br><br>
     	 	<ul>
     	 		<li class= "att-select">
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-novel" name="att-novel" value="소설"> 소설
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-economy" name="att-economy" value="경영/경제"> 경영/경제
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-att-development" name="att-development" value="자기계발"> 자기계발
     	 			</div>
     	 		</li>
     	 		<li class= "att-select">
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-essay" name="att-essay" value="에세이/시"> 에세이/시
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-trip" name="att-trip" value="여행"> 여행
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-religion" name="att-religion" value="종교"> 종교
     	 			</div>
     	 		</li>
     	 		<li class= "att-select">
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-foreign" name="att-foreign" value="외국어"> 외국어
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-science" name="att-science" value="과학"> 과학
     	 			</div>
     	 			<div class="att-select-wrapper">
     	 			<input type="checkbox" id="att-select-it" name="att-it" value="컴퓨터/IT"> 컴퓨터/IT
     	 			</div>
     	 		</li>
     	 	</ul>
     	 </div>
     	 <div class="joinagree">
     	 	<ul>
     	 		<li id="jo_tr_ag1">
     	 			<p class="join-li-cl"><input type="checkbox" id="join-terms-agree1" name="join_terms_agree" class="join-li-cl-in" > 전체 약관 동의</p>
     	 		</li>
     	 		<li id="jo_tr_ag2">
     	 			<p class="join-li-cl">
     	 			<input type="checkbox" id="join-terms-agree2" name="checkRow" class="join-li-cl-in">  이용약관 동의(필수)
     	 			<a onclick="window.open('InsertAgreeOne','LIBRARIA','width=430,height=500,location=no,status=no,scrollbars=yes');" href="location.href='InsertMemberAgree1.me'" class="dirrhks">약관 보기></a>
     	 			</p>
     	 		</li>
     	 		<li id="jo_tr_ag3">
     	 			<p class="join-li-cl">
     	 			<input type="checkbox" id="join-terms-agree3" name="checkRow" class="join-li-cl-in">  개인 정보 수집 및 이용(필수)
     	 			<a onclick="window.open('InsertAgreeTwo','LIBRARIA','width=430,height=500,location=no,status=no,scrollbars=yes');" href="location.href='InsertMemberAgree2.me'" class="dirrhks">내용 확인></a>
     	 			</p>
     	 		</li>
     	 		 <script>         
                             $(document).ready(function(){
                             //최상단 체크박스 클릭
                                 $("#join-terms-agree1").click(function(){
                            //클릭되었으면
                                   if($("#join-terms-agree1").prop("checked")){
                           //input태그의 id이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                                      $("input[name=checkRow]").prop("checked",true);
                                      $("input[name=checkRow]").prop("checked",true);
                           //클릭이 안되있으면
                                   }else{
                           //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                                      $("input[name=checkRow]").prop("checked",false);
                                      $("input[name=checkRow]").prop("checked",false);
                                   }
                                });
                             });
                          
                  </script>
     	 		<li class="hidden_line_cl" style=border:none;>
     	 			<span class="guide error" >이용약관에 동의해주세요.</span>
     	 		</li>
     	 	</ul>
     	 </div>
     	 <div class="join-com">
     	 	<button type="button" onclick="history.go(-1)" id="join-can-bt">Cancle</button>
     	 	<button onclick="return validate();" id="join-com-bt">Submit</button>
     	 </div>
     </form>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
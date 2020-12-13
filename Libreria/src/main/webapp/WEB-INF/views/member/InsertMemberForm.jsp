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
.interest{
	text-align: left;
    width: 357px;
    margin-top: 45px;
    padding-top: 20px;
    padding-bottom: 20px;
    border: 1px solid #c1c8e5;
    padding-left: 44px;
}
.interest>ul{
	list-style: none;
}
.ints-select-wrapper{
	display: inline-block;
	width: 100px;
	border:1px solid;
	margin-top: 15px;
	border:none;
}
.interest-top{
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
.agree{
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
}
#idchecker{
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
.genderCheck{
	cursor:none;
}
span.guide{display:none; font-size:12px ; top: 12px; right: 10px;}
span.guideId{display:none; font-size:12px ; top: 12px; right: 10px;}
span.ok{color: green;}
span.error{color: red;}

</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section id="join-form-main" class="account-container">
	<form action="enroll.me" method="post" id="joinForm" name="frm1" role="form">
		<p class="join-form-top">JOIN</p>
     	 <ul class="join-form-ul">
     	 	<li>
     	 		<input type="text" name="mem_email" id="mem_email" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	 	<li class="hidden_line_cl" id="idcheck">
     	 		<div class="guideId error" id=id_check readonly></div>
     	 	</li>

     	 	<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value='0'>
     	 	<li>
     	 		<input type="password" name="mem_pw" id="mem_pw1" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	 	<li>
     	 		<input type="password" name="mem_pw2" id="mem_pw2" placeholder="비밀번호 확인" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	  	<li class="hidden_line_cl">
     	 		<div class="guide error" id=pw_check></div>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="mem_name" id="mem_name" placeholder="이름" autocapitalize="off" autocomplete="off"class="join-form-textarea" >
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<div class="guide error" id=name_check></div>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="mem_tel" id="mem_tel" class="join-form-textarea" placeholder="연락처" maxlength="13">
				<div class="hidden_line_cl"></div>
     	 	</li>
     	 	<li>
     	 		<input type="date" name="mem_birth" id="mem_birth" placeholder="생년월일" autocapitalize="off" autocomplete="off" class="join-form-textarea2">
     	 		<input type="radio" value="남" id="gender-radio1" name="mem_gender" class="genderCheck"/>
     	 		<label class="gender-radio-label" for="gender-radio1"><p class="join-gender-p" name="mem_gender">남</p></label>
     	 		<input type="radio" value="여" id="gender-radio2" name="mem_gender" class="genderCheck"/>
     	 		<label class="gender-radio-label" for="gender-radio2"><p class="join-gender-p" name="mem_gender">여</p></label>
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<div class="guide error" id=birth_check></div>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="post" id="post" title="회원우편번호" placeholder="우편번호" autocapitalize="off" autocomplete="off" class="postcodify_postcode5" >
     	 		<button type="button" id="postcodify_search_button">검색</button> 
     	 	</li>
     	 	<li>
     	 		<input type="text" name="address1" id="address1" title="회원주소1" placeholder="배송지주소" autocapitalize="off" autocomplete="off" class="postcodify_address" >
     	 	</li>
     	 	<li>
     	 		<input type="text" name="address2" id="address2" title="회원주소2" placeholder="상세주소" autocapitalize="off" autocomplete="off" class="postcodify_extra_info">
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<div class="guide error" id=address_check></div>
     	 	</li>
     	 </ul>
     	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<script>
				 	//검색버튼 누르면 주소검색 API 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
		</script>
     	 <div class="interest">
     	 	<p class="interest-top">관심사</p>
     	 	<br><br>
     	 	<ul>
     	 		<li class= "ints-select">
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-novel" value="소설"> 소설
     	 			</div>
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-economy" value="경영/경제"> 경영/경제
     	 			</div>
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-att-development" value="자기계발"> 자기계발
     	 			</div>
     	 		</li>
     	 		<li class= "ints-select">
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-essay" value="에세이/시"> 에세이/시
     	 			</div>
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-trip" value="여행"> 여행
     	 			</div>
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-religion" value="종교"> 종교
     	 			</div>
     	 		</li>
     	 		<li class= "ints-select">
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-foreign" value="외국어"> 외국어
     	 			</div>
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-science" value="과학"> 과학
     	 			</div>
     	 			<div class="ints-select-wrapper">
     	 			<input type="checkbox" class="ck_interest" name="mem_interest" id="att-select-it" value="컴퓨터/IT"> 컴퓨터/IT
     	 			</div>
     	 		</li>
     	 	</ul>
     	 </div>
     	 <div class="joinagree">
     	 	<ul>
     	 		<li id="jo_tr_ag1">
     	 			<p class="join-li-cl"><input type="checkbox" id="checkAll" name="checkAll" class="join-li-cl-in" onclick="selectAll();" > 전체 약관 동의</p>
     	 		</li>
     	 		<li id="jo_tr_ag2">
     	 			<p class="join-li-cl">
     	 			<input type="checkbox" id="join-terms-agree2" name="checkRow" class="join-li-cl-in" onclick="selectOne();">  이용약관 동의(필수)
     	 			<a onclick="window.open('InsertAgreeOne.me','LIBRARIA','width=1000,height=500,location=no,status=no,scrollbars=yes')" class="agree">약관 보기></a>
     	 			</p>
     	 		</li>
     	 		<li id="jo_tr_ag3">
     	 			<p class="join-li-cl">
     	 			<input type="checkbox" id="join-terms-agree3" name="checkRow" class="join-li-cl-in" onclick="selectOne();">  개인 정보 수집 및 이용(필수)
     	 			<a onclick="window.open('InsertAgreeTwo.me','LIBRARIA','width=1000,height=500,location=no,status=no,scrollbars=yes');" class="agree">내용 확인></a>
     	 			</p>
     	 		</li>
     	 		<li class="hidden_line_cl" style=border:none;>
     	 			<div class="guide error" id=agree_check></div>
     	 		</li>
     	 	</ul>
     	 </div>
     	 <div class="join-com">
     	 	<button type="reset" onclick="history.go(-1)" id="join-can-bt">Cancle</button>
     	 	<button type="submit" onclick="validate();" id="join-com-bt">Submit</button>
     	 	
     	 </div>
  
     </form>
     <script>
   
   var empJ = /\s/g; //모든 공백 체크 정규식
   var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일 검사 정규식     
   var pwJ = /^[A-Za-z0-9]{4,12}$/;   // 비밀번호 정규식 
   var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이름 정규식          
   var phoneJ = /^\d{3}-\d{3,4}-\d{4}$/;;// 휴대폰 번호 정규식
 
   var address = $('#address2');
 $(function(){
	$('#mem_email').on('keyup',function(){
		if($('#mem_email').val()==''){
			$('#id_check').text('아이디를 입력하세요.'); 
			$('#id_check').css('color', 'red');
			$('#id_check').css('font-size','12px');
			
		} else if(mailJ.test($('#mem_email').val())!=true){ 
			$('#id_check').text('이메일 양식을 확인해주세요'); 
			$('#id_check').css('color', 'red'); 
			$('#id_check').css('font-size','12px');
		} else if($('#mem_email').val()!=''){

			var mem_email=$('#mem_email').val(); 
				$.ajax({ 
					async : true, 
					type : 'POST', 
					data : mem_email, //mem_email 의 이름으로 mem_email 데이터를
					url : 'checkEmail.me', // @WebServlet("/checkEmail.me")에 보내겠다 
					dateType: 'json', 
					contentType: "application/json; charset=UTF-8",
					success : function(data) {
						
				if(data == 0){ 
					$('#id_check').text('중복된 아이디 입니다.'); 
					$('#id_check').css('color', 'red'); 
					$('#id_check').css('font-size','12px');
					$("#joinForm").attr("disabled", true); 
				}else{ if(mailJ.test(mem_email)){ 
					$('#id_check').text('사용가능한 아이디 입니다.'); 
					$('#id_check').css('color', 'green'); 
					$('#id_check').css('font-size','12px');
					$("#joinForm").attr("disabled", false); 
				} else if(mem_email==''){ 
					$('#id_check').text('아이디를 입력해주세요.'); 
					$('#id_check').css('color', 'red'); 
					$('#id_check').css('font-size','12px');
					$("#joinForm").attr("disabled", true); 
				} else{ 
					$('#id_check').text("이메일 양식을 확인해주세요."); 
					$('#id_check').css('color', 'red'); 
					$('#id_check').css('font-size','12px');
					$("#joinForm").attr("disabled", true); 
				} 
				}
					}
			});
	
	}
});
		


   
   
    
     $("#mem_tel").on("keyup",function(){
     	var inputTel = $("#mem_tel").val();
 		console.log(inputTel);
 		var tmp="";
 		inputTel = inputTel.replace(/[^0-9]/g,'');

 		if(inputTel.length<4){  //01012341234
 			tmp+=inputTel;
 		}else if(inputTel.length<7){ //
 			tmp+=inputTel.substr(0,3); // 010
 			tmp+='-';    
 			tmp+=inputTel.substr(3);  // 010-123
 		}else if(inputTel.length<11){ //010-1234-1 ...
 			tmp += inputTel.substr(0, 3);   // 010
 			tmp += '-';
 			tmp += inputTel.substr(3, 3); //010-123
 			tmp += '-';
 			tmp += inputTel.substr(6); //010-123-412
 		}else{  
 			tmp += inputTel.substr(0, 3);  
 			tmp += '-';
 			tmp += inputTel.substr(3, 4);
 			tmp += '-';
 			tmp += inputTel.substr(7); 
 		}
 		  $("#mem_tel").val(tmp);
     });
           
     
     
    //비밀번호
	   	$(function(){
			$('#mem_pw1').on('keyup',function(){
				 if(pwJ.test($('#mem_pw1').val())){
					    console.log('true');
					    $('#pw_check').text('사용가능한 암호 입니다.');
					    $('#pw_check').css('color','green');
				 }else{
					 	console.log('false');
				    	$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
				    	$('#pw_check').css('color', 'red');
				    	$('#pw_check').css('font-size','12px');
				 }
				})  	   
			});
	 	$(function(){
			$('#mem_pw2').on('keyup', function(){
				 if($('#mem_pw1').val().trim() != $('#mem_pw2').val().trim()){
					    $('#pw_check').text('비밀번호가 일치하지 않습니다.')
					    $('#pw_check').css('color','red');
					    $('#pw_check').css('font-size','12px');
				      }else{
					    $('#pw_check').text('비밀번호 확인');
					    $('#pw_check').css('color','green');
					    $('#pw_check').css('font-size','12px');
				      }
				})  	   
			});  
	//비밀번호 확인-------------
     
     //이름에 특수문자 들어가지 않도록 설정
	    	$(function(){
			$('#mem_name').on('keyup', function(){
				 if(nameJ.test($('#mem_name').val())){
						$("#name_check").text('');
					    $('#name_check').css('font-size','12px');
				      }else{
				    	$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
					    $('#name_check').css('color','red');
					    $('#name_check').css('font-size','12px');
				      }
				})  	   
			});
     
	
	    	//약관동의 체크박스//
	        var checkAll = document.getElementById("checkAll");
	   	 	var checkRow = document.getElementsByName("checkRow");

	   	function selectAll(){
	   		if(checkAll.checked){
	   			for(var i = 0; i < checkRow.length; i++){
	   				checkRow[i].checked = true;
	   			}
	   		} else{
	   			for(var i = 0; i < checkRow.length; i++){
	   				checkRow[i].checked = false;
	   			}
	   		} 
	   	}
	   	
	   	function selectOne(){
	   		var count = 0;
	   		
	   		for(var i = 0; i < checkRow.length; i++){
	   			if(checkRow[i].checked){
	   				count++;
	   			} 
	   		}
	   		
	   		if(count != 2){
	   			checkAll.checked = false;
	   		} else{
	   			checkAll.checked = true;
	   		}
	   	}
	   //약관동의 체크박스//
	        
	   //관심사 체크박스 //
	        $(".ck_interest").click(function(){ // 체크박스 클릭 시 이벤트
	   				countCheckBoxFn();
	   				
	   				if(ck_count > 3){
	   					alert("최대 3개까지 선택가능합니다.");
	   					$(this).prop("checked",false);
	   				}
	   			});
	   			//////////////////////////////////////
	   			function countCheckBoxFn(){ // 선택되어진 체크박스의 개수를 구하는 함수
	   				ck_count=0;
	   				var ck_interest = $(".ck_interest");
	   				ck_interest.each (function (index, item){
	   					if(item.checked == true){
	   						ck_count+=1;
	   					}
	   				});
	   			}
 			
	   		function validate(){
 				var inval_Arr = new Array(9).fill(false);
 				if(mailJ.test($('#mem_email').val())){
 					inval_Arr[0] = true;
 				} else{
 					inval_Arr[0] = false;
 					swal("",'이메일을 확인하세요',"info");
 					$('#mem_email').focus();
 					return false;
 				}
 				// 비밀번호가 같은경우 , 비밀번호 정규식
 				if (($('#mem_pw1').val() == ($('#mem_pw2').val())) 
 						&& pwJ.test($('#mem_pw1').val())) { 
 					inval_Arr[1] = true; 
 				} else { 
 					inval_Arr[1] = false; 
 					swal("",'비밀번호 양식을 확인하세요',"info");
 					$('#mem_pw').focus();
 					return false; 
 				}
 				// 이름 정규식
 				if (nameJ.test($('#mem_name').val())) { 
 					inval_Arr[2] = true; 
 				} else { 
 					inval_Arr[2] = false;
 					swal("",'이름을 확인하세요',"info"); 
 					$('#mem_name').focus();
 					return false; 
 				}
 				// 휴대폰번호 정규식
 				if (phoneJ.test($('#mem_tel').val())) {
 					console.log(phoneJ.test($('#mem_tel').val())); 
 					inval_Arr[5] = true; 
 				} else { 
 					inval_Arr[5] = false; 
 					swal("",'휴대폰번호를 확인하세요',"info"); 
 					$('#mem_tel').focus();
 					return false; 
 				}

 				//성별 확인
 				if($('#gender-radio1').checked==false && $('#gender-radio2').checked==false){
 					inval_Arr[6] = false; 
 					swal("",'성별을 확인하세요',"info");  
 					return false; 
 					} else{ 
 						inval_Arr[6] = true; 
 					}
				//주소 확인
 				if($('#post').val()== '' || $('#address1').val()== '' || $('#address2').val()== ''){ 
 					inval_Arr[7] = false; 
 					swal("",'주소를 입력하세요',"info");
 					$('#address2').focus();
 					return false; 
 				}else{
 					inval_Arr[7] = true;
 				}
				
				//약관동의
 		   		if(!$('#checkAll').prop("checked")){
 		   			inval_Arr[8] = false;
 		   			swal("","약관에 동의해주세요.","info");
 		   		}else{
 		   			inval_Arr[8] = true;
		   			return false;
 		   			
 		   		}
				//전체 유효성 검사 
				var validAll = true; 
				for(var i = 0; i < inval_Arr.length; i++){
					if(inval_Arr[i] == false){ 
						validAll = false; 
					} 
				}
				// 유효성 모두 통과 
				if(validAll == true){ 
					swal("","LIBRERIA 가족이 되어주셔 감사합니다.","info"); 
				} else{ 
					swal("","다시해라.","info"); 
				}
 		}
 });

 	
 				
//로그인 Submit//
  	
  	
//약관동의 체크박스//
     var checkAll = document.getElementById("checkAll");
	 var checkRow = document.getElementsByName("checkRow");

	function selectAll(){
		if(checkAll.checked){
			for(var i = 0; i < checkRow.length; i++){
				checkRow[i].checked = true;
			}
		} else{
			for(var i = 0; i < checkRow.length; i++){
				checkRow[i].checked = false;
			}
		} 
	}
	
	function selectOne(){
		var count = 0;
		
		for(var i = 0; i < checkRow.length; i++){
			if(checkRow[i].checked){
				count++;
			} 
		}
		
		if(count != 2){
			checkAll.checked = false;
		} else{
			checkAll.checked = true;
		}
	}
//약관동의 체크박스//
     
//관심사 체크박스 //
     $(".ck_interest").click(function(){ // 체크박스 클릭 시 이벤트
				countCheckBoxFn();
				
				if(ck_count > 3){
					alert("최대 3개까지 선택가능합니다.");
					$(this).prop("checked",false);
				}
			});
			//////////////////////////////////////
			function countCheckBoxFn(){ // 선택되어진 체크박스의 개수를 구하는 함수
				ck_count=0;
				var ck_interest = $(".ck_interest");
				ck_interest.each (function (index, item){
					if(item.checked == true){
						ck_count+=1;
					}
				});
			} 

	
	</script>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
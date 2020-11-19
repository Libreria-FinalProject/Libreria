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

span.guide{display:none; font-size:12px ; top: 12px; right: 10px;}
span.guideId{display:none; font-size:12px ; top: 12px; right: 10px;}
span.ok{color: green;}
span.error{color: red;}

</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section id="join-form-main" class="account-container">
	<form action="InsertMemberForm.me" method="post" id="joinForm" name="frm1">
		<p class="join-form-top">JOIN</p>
     	 <ul class="join-form-ul">
     	 	<li>
     	 		<input type="text" name="mem_email" id="mem_email" placeholder="아이디(이메일)" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	 	<li class="hidden_line_cl" id="idcheck">
     	 		<span class="guideId error" id=guideemail1 readonly>이메일 형식으로 입력해주세요.</span>
     	 	</li>
     	 	<li class="hidden_line_cl" id="idchecker" style=height:1px;>
     	 		<span class="guideId error" id=guideemail2 readonly>이미 사용중인 아이디(이메일) 입니다.</span>
     	 	</li>
     	 	<li class="hidden_line_cl2" id="idcheckok" style=height:1px;>
     	 		<span class="guideId ok" id=guideemail3 readonly>사용 가능한 아이디(이메일) 입니다.</span>
     	 	</li>
     	 	<li>
     	 		<input type="password" name="mem_pw" id="userPwd1" placeholder="비밀번호" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>

     	 	<li>
     	 		<input type="password" name="mem_pw2" id="userPwd2" title="회원PW 확인" placeholder="비밀번호 확인" autocapitalize="off" autocomplete="off" class="join-form-textarea">
     	 	</li>
     	  	<li class="hidden_line_cl">
     	 		<span class="guide error" id=guidepw1>8자 이상 입력해주세요.</span>
     	 	</li>
     	 	<li class="hidden_line_cl" id="pwcheck" style=height:1px;>
     	 		<span class="guide error" id=guidepw2>동일한 비밀번호를 입력하세요.</span>
     	 	</li>
     	 	<li class="hidden_line_cl" id="pwcheck" style=height:1px;>
     	 		<span class="guide ok" id=guidepw3>암호가 확인 되었습니다.</span>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="mem_name" id="userName" placeholder="이름" autocapitalize="off" autocomplete="off"class="join-form-textarea" >
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide error" id=guidename1>2글자 이상의 이름을 입력해주세요.</span>
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide ok" id=guidename2>2글자 이상의 이름을 입력해주세요.</span>
     	 	</li>
     	 	<li>
     	 		<input type="date" name="mem_birth" id="userBirth" placeholder="생년월일" autocapitalize="off" autocomplete="off" class="join-form-textarea2">
     	 		<input type="radio" value="남" id="gender-radio1" name="mem_gender"/>
     	 		<label class="gender-radio-label" for="gender-radio1"><p class="join-gender-p" name="mem_gender">남</p></label>
     	 		<input type="radio" value="여" id="gender-radio2" name="mem_gender"/>
     	 		<label class="gender-radio-label" for="gender-radio2"><p class="join-gender-p" name="mem_gender">여</p></label>
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide error" id=guidebirth>생년월일을 입력하세요.</span>
     	 	</li>
     	 	<li>
     	 		<input type="text" name="post" id="post" title="회원우편번호" placeholder="우편번호" autocapitalize="off" autocomplete="off" class="postcodify_postcode5" disabled >
     	 		<button type="button" id="postcodify_search_button">검색</button> 
     	 	</li>
     	 	<li>
     	 		<input type="text" name="address1" id="address1" title="회원주소1" placeholder="배송지주소" autocapitalize="off" autocomplete="off" class="postcodify_address" disabled >
     	 	</li>
     	 	<li>
     	 		<input type="text" name="address2" id="address2" title="회원주소2" placeholder="상세주소" autocapitalize="off" autocomplete="off" class="postcodify_extra_info">
     	 	</li>
     	 	<li class="hidden_line_cl">
     	 		<span class="guide error" id=guideaddress>주소를 입력해주세요.</span>
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
     	 			<a onclick="window.open('InsertAgreeOne.me','LIBRARIA','width=1000,height=500,location=no,status=no,scrollbars=yes')" class="dirrhks">약관 보기></a>
     	 			</p>
     	 		</li>
     	 		<li id="jo_tr_ag3">
     	 			<p class="join-li-cl">
     	 			<input type="checkbox" id="join-terms-agree3" name="checkRow" class="join-li-cl-in" onclick="selectOne();">  개인 정보 수집 및 이용(필수)
     	 			<a onclick="window.open('InsertAgreeTwo.me','LIBRARIA','width=1000,height=500,location=no,status=no,scrollbars=yes');" class="dirrhks">내용 확인></a>
     	 			</p>
     	 		</li>
     	 		<li class="hidden_line_cl" style=border:none;>
     	 			<span class="guide error" id=guideagree>이용약관에 동의해주세요.</span>
     	 		</li>
     	 	</ul>
     	 </div>
     	 <div class="join-com">
     	 	<button type="submit" onclick="history.go(-1)" id="join-can-bt">Cancle</button>
     	 	<button type="button" onclick="validate();" id="join-com-bt">Submit</button>
     	 </div>
  
     </form>
     <script>
     
     $(function(){
    	//아이디 중복체크
    	    $('#mem_email').on('keyup',function(){
    	        $.ajax({
    		     type:"POST",
    		     url:"checkSignup",
    		     data:{
    		            "mem_email":$('#mem_email').val()
    		     },
    		     success:function(data){	//data : checkSignup에서 넘겨준 결과값
    		            if($.trim(data)=="YES"){
    		               if($('#mem_email').val()!=''){ 
    		            	   $('#guideemail1').hide();
    		            	   $('#guideemail2').hide();
    		            	   $('#guideemail3').show();
    		               }
    		           	}else{
    		               if($('#mem_email').val()!=''){
    		            	   $('#guideemail1').hide();
    		            	   $('#guideemail2').show();
    		            	   $('#guideemail3').hide();
    		               }
    		            }
    		         }
    		    }) 
    	     })

    	});
//로그인 Submit//    

/* 	$('#userPwd').on'keyup', function(){
		var userPwd = $(this).val().trim();
			
			if($('#userPwd') != $('#userPwd2')){
				$('#guidepw2').show();
				return;
			} 
	} */
	
/* 	
	$('#mem_email').on('keyup', function(){
			var mem_email = $(this).val().trim();
			
			if(mem_email.length <4){
				$('#guideemail1').show();
			}else{
				$('#guideemail1').hide();
			}	
				
				return;

			
			$.ajax({
				url:'dupid.me',
				data:{id:mem_email},
				success:function(data){
					console.log(data);
					if(data == 'true'){
						$('#guideemail3').show();
					}else{
						$('#guideemail2').hide();
						
					}
				}
			});
		});  */
/* 	function chkPW(){
		var pw = $("#userPwd1").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length < 8){
			$('#guidepw1').show();
			return false;
		}else{
			$('#guidepw1').hide();
			return ture;
		}
		return true;
	} */
 	$(function(){
		$('#userPwd1').on('keyup',function(){
			 if($('#userPwd1').length.trim() < 8){
				    $('#guidepw1').show();
				    $('#guidepw2').hide();
				    $('#guidepw3').hide();
			 }else{
			    	$('#guidepw1').hide();
			    	$('#guidepw2').hide();
			    	$('#guidepw3').hide();
			 }
			})  	   
		});
		$('#userPwd1').on('keyup',function(){
			 if($('#userPwd1').length > 8){
				    $('#guidepw1').show();
				    $('#guidepw2').hide();
				    $('#guidepw3').hide();
			 }	   
		});
	//비밀번호 확인--------------
 	$(function(){
		$('#userPwd2').on('keyup', function(){
			 if($('#userPwd1').val().trim() != $('#userPwd2').val().trim()){
				    $('#guidepw2').show();
				    $('#guidepw1').hide();
				    $('#guidepw3').hide();
			      }else{
			    	$('#guidepw2').hide();
			    	$('#guidepw1').hide();
			    	$('#guidepw3').show();
			      }
			})  	   
		}); 
	//비밀번호 확인-------------
	
	//이름 확인-------
	$(function(){
		$('#userName').on('keyup', function(){
			 if($('#userName').length < 2){
				    $('#guidename1').show();
				    $('#guidename2').hide();
			      }else{
			    	$('#guidename2').show();
			    	$('#guidename1').hide();
			      }
			})  	   	 
		$('#userName').on('keyup', function(){
			 if($('#userName').length > 2){
				    $('#guidename2').show();
			      }else{
		 		   	  $('#guidename1').hide();
		 	     }
			}) 
		});
		
	//이름 확인-------
		
  	function validate(){
		
		//성별체크
  		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var genderArr = document.frm1.mem_gender;
		var gChk = false;
		for(var i = 0 ; i < genderArr.length; i++){
			if(genderArr[i].checked == true){
				gChk = true;
				break;
			}
		}

		if($('#userId').val().trim()==0){
			swal('사용 가능한 아이디를 입력해주세요');
			$('#userId').focus();
			return false;
		}else if($('#userPwd').val().trim()==0){
			swal('사용 가능한 비밀번호를 입력해주세요');
			$('#userPwd').focus();
			return false;
		}else if($('#userName').val().trim()==0){
			swal('이름을 입력해주세요');
			$('#userName').focus();
			return false;
		}else if($('#userBirth').val()==0){
			swal('생년월일을 입력해주세요');
			$('#userBirth').focus();
			return false;
		}else if(gChk == false){
			swal('성별을 체크해주세요');
		}else if($('#post').val()==0){
			swal('주소를 입력해주세요');
			$('#post').focus();
			return false;
		}else if($('.join-li-cl-in').is(":checked") != true){
			swal('약관에 동의해주세요');
			$('#join-li-cl-in').focus();
			return false;
		}else{
			$('#joinForm').submit();
			location.href="InsertMemberComplete.me";
		}
	}
	
	$(function(){
		$('#post').on('keyup', function(){
			 if($('#post').val() != 0){
				    $('#guideaddress').hide();
			      }else{
			    	$('#guideaddress').show();
			      }
			})  	   
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
//관심사 체크박스 //
			

	//로그인 유호성 검사//
/* 	function validate(){
		var re = /^[a-zA-Z0-9]{4,12}$/
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var mem_email = document.getElementById("mem_email");
		var mem_pw = document.getElementById("mem_pw");
		var mem_pw2 = document.getElementById("mem_pw2");
		var mem_name = document.getElementById("mem_name");
		
		//이메일
	    if(mem_email.value=="") {
	        alert("이메일을 입력해 주세요");
	        mem_email.focus();
	        return false;
	    }
	    if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
	        return false;
	    }
	    
	    //pw
	    if(!check(re,mem_pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
	         return false;
	     }
	    if(join.mem_pw.value != join.mem_pw2.value) {
	         alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
	         join.mem_pw2.value = "";
	         join.mem_pw2.focus();
	         return false;
	    }
	    if(join.mem_interest[0].checked==false &&
	         join.mem_interest[1].checked==false &&
	         join.mem_interest[2].checked==false &&
	         join.mem_interest[3].checked==false &&
	         join.mem_interest[4].checked==false &&
	         join.mem_interest[5].checked==false &&
	         join.mem_interest[6].checked==false &&
	         join.mem_interest[7].checked==false &&
	         join.mem_interest[8].checked==false &&
	         join.mem_interest[9].checked==false) {
	         alert("관심분야를 골라주세요");
	         return false;
	    }
	    alert("회원가입이 완료되었습니다.");
	} */
	</script>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신용카드 결제</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/pay.css"/>
</head>
<body>
<div class="pay_div" id="pay_div1">
 	<div class="pay_title_div">
 		<span>LIBRERIA</span>
 		<span>신용카드</span>
 	</div>
 	<div class="pay_body">
	 	<div class="pay_info_div">
	 		<span>(주)역삼동 코딩머신</span><br>
	 		<span></span><br>
	 		<span>제공기간 : 별도의 제공기간 없음</span><br>
	 		<span></span>
	 	</div>
	 	<div class="pay_card_div">
	 		<input type="radio" checked name="card_select_radio" class="card_select_radio" value="삼성"><div>삼성</div>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="신한"><div>신한</div>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="우리"><div>우리</div>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="수협"><div>수협</div>
	 		<input type="radio" name="card_select_radio"class="card_select_radio" value="시티"><div>시티</div><br>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="농협"><div>농협</div>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="국민"><div>국민</div>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="롯데"><div>롯데</div>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="현대"><div>현대</div>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="비씨"><div>비씨</div>
	 	</div>
	 	<div class="pay_check_div">
	 		<input type="checkbox" id="ck_pay"><div id="check_div">상기 구매내용을 확인하였습니다.</div>
	 		<button type="button">다음&gt;</button>
	 	</div>
 	</div>
</div>
<!-- --------------------------------------------------------- -->
 <div class="pay_div" id="pay_div2">
 	<div class="pay_title_div">
 		<span>LIBRERIA</span>
 		<span>신용카드</span>
 	</div>
 	<div class="pay_body">
	 	<form method="post" id="cardForm">
	 		<input type="hidden" name="mem_no" value="${loginUser.mem_no }">
	 		<input type="hidden" name="charge_money" id="charge_money">
	 		<input type="hidden" name="charge_way" value="CD">
		 	<div class="pay_cardinfo_div">
		 		<table>
		 			<tr>
		 				<td>카드사</td>
		 				<td>
		 					<input type="text" id="input_card_company" readonly >
		 				</td>
		 			</tr>
		 			<tr>	
		 				<td>카드번호</td>
		 				<td>
		 					<input type="text" maxlength="4" class="input_card_num">-<input type="text" maxlength="4"  class="input_card_num">-<input type="text" maxlength="4"  class="input_card_num">-<input type="text" maxlength="4"  class="input_card_num">
		 					<input type="hidden" name="card_no" id="card_no">
		 				</td>
		 			</tr>
		 			<tr>	
		 				<td>유효기간</td>
		 				<td>
		 					<input type="text" placeholder="월" maxlength="2" id="card_date1">/<input type="text" placeholder="년" maxlength="4" id="card_date2">
		 					<input type="hidden" name="card_expire" id="card_expire_date">
		 				</td>
		 			</tr>
		 			<tr id="card_pwd_tr">	
		 				<td>카드 비밀번호</td>
		 				<td><input type="password" maxlength="4" name="card_pwd" id="card_pwd"></td>
		 			</tr>

		 		</table>
		 	</div>
		 
		 	<div class="pay_check_div">
		 		<button type="button"  >다음&gt;</button>
		 	</div>
	 	</form>
 	</div>
</div>
<!-- --------------------------------------------------------- -->
<div class="pay_div" id="pay_div3">
 	<div class="pay_title_div">
 		<span>LIBRERIA</span>
 		<span>신용카드</span>
 	</div>
 	<div class="pay_body">
	 	<div class="pay_complete_div">
	 	결제가 완료되었습니다.
	 	</div>
	 
	 	<div class="pay_check_div">
	 		<button type="button" id="closeBtn">닫기</button>
	 	</div>
 	</div>
</div>
<!-- ------------------------------------------------------------ -->
<script type="text/javascript">
	$(function(){
		var charge_money = $(opener.document).find("#select_charge_moeny").val();
		$('#charge_money').val(charge_money);
		$('.pay_info_div').find('span').eq(1).text("상품명 : 머니충전 +"+numberWithCommas(charge_money));
		$('.pay_info_div').find('span').eq(3).text("상품 금액: "+numberWithCommas(charge_money)+"원");
		initCardCompany();
	});
	
	$(".pay_card_div").find("div").click(function(){
		var select_cardCompany = $(this).text();
		var select_cardCompanyInput = $('.pay_card_div').find('input');
		for(var i = 0 ; i<select_cardCompanyInput.length ; i++){
			if(select_cardCompany == select_cardCompanyInput[i].value){
				select_cardCompanyInput[i].checked = true;
				initCardCompany();
				break;
			}
		}
		
	});
	
	$('.card_select_radio').click(function(){
		initCardCompany();
	});
	
	$(".input_card_num").keyup(function(){  // 카드번호 정규표현식  
		var input_card_num =$(this).val();
		input_card_num = input_card_num.replace(/[^0-9]/g,'');
		$(this).val(input_card_num);
	});
	
	$('#card_date1').keyup(function(){ // 카드 유효기간 월 정규표현식  [01-12]
		var card_date1 =$(this).val();
		card_date1 = card_date1.replace(/[^0-9]/g,'');
		$(this).val(card_date1);
	});
	 
	$('#card_date2').keyup(function(){  // 카드 유효기간 년 정규표현식  [20xx]
		var card_date2 =$(this).val();
		card_date2 = card_date2.replace(/[^0-9]/g,'');
		$(this).val(card_date2);
	})
	
	$("#card_pwd").keyup(function(){  // 카드 비밀번호 정규표현식 
		var card_pwd =$(this).val();
		card_pwd = card_pwd.replace(/[^0-9]/g,'');
		$(this).val(card_pwd);
	});

	$("#check_div").click(function(){
		if($('#ck_pay').prop("checked")==false){
			$('#ck_pay').prop("checked",true);
		}else{
			$('#ck_pay').prop("checked",false);
		}
		
	});
	$("#pay_div1").find("button").click(function(){ //1단계 -> 2단계 
		if($('#ck_pay').prop("checked")==true){   // 체크박스 클릭시 2단계로 넘어감
			$("#pay_div1").css("display","none");
			$("#pay_div2").css("display","block");			
		}else{   
			swal("","구매내용 확인에 체크해주세요","info");
			$('#ck_pay').focus();
		}
	});
	$("#pay_div2").find("button").click(function(){  // 2단계 -> 3단계
		var validate_check = validate();
		if(validate_check){
			
			var form = $('#cardForm').serialize();
			$.ajax({
				url: "buyMoney2.me",
				type: "post",
				data: form,
				success:function(data){
					if(data==1){
						swal("","결제에 성공했습니다.","success")
						.then((ok)=>{
							if(ok){								
								$("#pay_div2").css("display","none");
								$("#pay_div3").css("display","block")
							}
						});
					}else{
						swal("","결제에 실패하였습니다. 다시 시도해주세요.","warning");
					}
				},
				error:function(){
					alert("ajax 실패")
				}
			});
			//$("#pay_div2").css("display","none");
			//$("#pay_div3").css("display","block");
		}
	});
	
	$('#closeBtn').click(function(){  //  닫기버튼 클릭시
		window.close();
	});

	function initCardCompany(){   // 카드회사 선택시 마다 pay2번째 단계 카드회사 초기화 함수
		$('.card_select_radio').each(function(index, item){
			if(item.checked==true){
				$('#input_card_company').val(item.value);
			}
		});
	
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function validate(){
		////////카드번호 검증 
		var card_no = "";
		$(".input_card_num").each(function(index,item){
			console.log(index);
			console.log(item.value.length);
			if(item.value.length==4){
				if(index<$(".input_card_num").length-1){
					card_no=card_no+item.value+"-";			
				}else{
					card_no=card_no+item.value;			
				}				
			}
		});
		if(card_no.length<19 && card_no.length>=0){
			swal("","카드번호 16자리 모두 입력해주세요.","info");
			$('.input_card_num').focus();
			return false;
		}
		$('#card_no').val(card_no);
		console.log(card_no);
		
		/////////////유효기간 검증
		var cur_date = new Date();
		var cur_date2 = cur_date.getFullYear()+"-"+(cur_date.getMonth()+1)+"-"+cur_date.getDate();
		console.log(cur_date2);
		var card_date= "";
		if($('#card_date1').val().length == 0 || parseInt($('#card_date1').val())>12 ){ //카드 유효기간 월을 쓰지않았을 때
			swal("","카드 유효기간 월을 입력해주세요.","info")
			.then((ok)=>{
				if(ok){
					$('#card_date1').focus();
				}
			});
			return false;
		}else if($('#card_date2').val().length<4){ //카드 유효기간 연도를 모두 쓰지않았을때
			swal("","카드 유효기간 연도를 모두 입력해주세요.(4자리)","info")
			.then((ok)=>{
				if(ok){
					$('#card_date2').focus();
				}
			});
			return false;
		}else{
			card_date=$('#card_date2').val()+"-";
		}
		
		if($('#card_date1').val()<10 && $('#card_date1').val().length < 2){  // 
			card_date=card_date+"0"+$("#card_date1").val()+"-01";
		}else{
			card_date=card_date+$("#card_date1").val()+"-01";
		}
		console.log(card_date);
		$('#card_expire_date').val(card_date);
		
		
		if($('#card_pwd').val().length < 4 ) {
			swal("","카드비밀번호 4자리를 입력해주세요.","info");
			return false;
		}
		return true;
	}
</script>
</body>
</html>
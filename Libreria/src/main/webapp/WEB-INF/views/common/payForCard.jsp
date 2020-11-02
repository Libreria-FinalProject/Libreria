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
	 		<input type="radio" checked name="card_select_radio" class="card_select_radio" value="삼성"><span>삼성</span>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="신한"><span>신한</span>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="우리"><span>우리</span>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="수협"><span>수협</span>
	 		<input type="radio" name="card_select_radio"class="card_select_radio" value="시티"><span>시티</span><br>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="농협"><span>농협</span>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="국민"><span>국민</span>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="롯데"><span>롯데</span>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="현대"><span>현대</span>
	 		<input type="radio" name="card_select_radio" class="card_select_radio" value="비씨"><span>비씨</span>
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
	 	<form method="post">
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
		 					<input type="hidden" name="card_expire_date" id="card_expire_date">
		 				</td>
		 			</tr>
		 			<tr id="card_pwd_tr">	
		 				<td>카드 비밀번호</td>
		 				<td><input type="password" maxlength="4" name="card_pwd"></td>
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
		$('.pay_info_div').find('span').eq(1).text("상품명 : 머니충전 +"+numberWithCommas(charge_money));
		$('.pay_info_div').find('span').eq(3).text("상품 금액: "+numberWithCommas(charge_money)+"원");
		initCardCompany();
	});
	
	$('.card_select_radio').click(function(){
		initCardCompany();
	});
	
	$(".input_card_num").keyup(function(){
		var input_card_num =$(this).val();
		input_card_num = input_card_num.replace(/[^0-9]/g,'');
		$(this).val(input_card_num);
	});
	
	$('#card_date1').keyup(function(){
		var card_date1 =$(this).val();
		card_date1 = card_date1.replace(/0[1-9]|1[0-2]/g,'');
		$(this).val(card_date1);
	});
	

	$("#check_div").click(function(){
		if($('#ck_pay').prop("checked")==false){
			$('#ck_pay').prop("checked",true);
		}else{
			$('#ck_pay').prop("checked",false);
		}
		
	});
	$("#pay_div1").find("button").click(function(){
		if($('#ck_pay').prop("checked")==true){
			$("#pay_div1").css("display","none");
			$("#pay_div2").css("display","block");			
		}else{
			swal("","구매내용 확인에 체크해주세요","info");
			$('#ck_pay').focus();
		}
	});
	$("#pay_div2").find("button").click(function(){
		var validate_check = validate();
		console.log(validate_check);
		if(validate_check){
			$("#pay_div2").css("display","none");
			$("#pay_div3").css("display","block");
		}
	});
	
	$('#closeBtn').click(function(){
		window.close();
	});

	function initCardCompany(){
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
		var cur_date2 = cur_date.getFullYear()+"/"+(cur_date.getMonth()+1)+"/"+cur_date.getDate();
		console.log(cur_date2);
		var card_date= "";
		if($('#card_date1').val().length == 0){ //카드 유효기간 월을 쓰지않았을 때
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
			card_date=$('#card_date2').val()+"/";
		}
		
		if($('#card_date1').val()<10 ){
			card_date=card_date+"0"+$("#card_date1").val()+"/01";
		}else{
			card_date=card_date+$("#card_date1").val()+"/01";
		}
		console.log(card_date);
		$('#card_expire_date').val(card_date);
		
	}
</script>
</body>
</html>
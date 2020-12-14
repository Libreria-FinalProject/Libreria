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
 		<span>등록된 신용카드</span>
 	</div>
 	<div class="pay_body">
	 	<div class="pay_info_div">
	 		<span>(주)역삼동 코딩머신</span><br>
	 		<span></span><br>
	 		<span>제공기간 : 별도의 제공기간 없음</span><br>
	 		<span></span>
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
 		<span>등록된 신용카드</span>
 	</div>
 	<div class="pay_body">
	 	<form method="post" id="cardForm">
	 		<input type="hidden" name="mem_no" value="${loginUser.mem_no }">
	 		<input type="hidden" name="charge_money" id="charge_money">
	 		<input type="hidden" name="charge_way" value="Card">
		 	<div class="pay_cardinfo_div">
		 		<table>
		 			<tr>
		 				<td>카드사</td>
		 				<td>
		 					${registCard.card_company}
		 					<input type="hidden" name="card_company" value="${registCard.card_company }">
		 				</td>
		 			</tr>
		 			<tr>	
		 				<td>카드번호</td>
		 				<td>
			 				${registCard.card_no }	
			 				<input type="hidden" name="card_no" value="${registCard.card_no }">
		 				</td>
		 			</tr>
		 			<tr>	
		 				<td>유효기간</td>
		 				<td>
		 				</td>
		 				<input type="hidden" name="card_expire" id="card_expire_date" value="${registCard.card_expire }">
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
 		<span>등록된 신용카드</span>
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
		var registCard = "${registCard}";
		if(registCard ==""){
			swal("","등록된 카드가 없습니다.\n카드 등록 후 사용해주세요.","error")
			.then((ok)=>{
				if(ok){
					window.close();
				}
			});
		}
		
		var card_expire = '${registCard.card_expire}'; 
		var card_expire_arr = card_expire.split('-');
		$(".pay_cardinfo_div").find('td').eq(5).text(card_expire_arr[1]+" / "+card_expire_arr[0]);
		
		var charge_money = $(opener.document).find("#select_charge_moeny").val();
		$('#charge_money').val(charge_money);
		$('.pay_info_div').find('span').eq(1).text("상품명 : 머니충전 +"+numberWithCommas(charge_money));
		$('.pay_info_div').find('span').eq(3).text("상품 금액: "+numberWithCommas(charge_money)+"원");
	});
	 
	
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
			var form=$('#cardForm').serialize();
			$.ajax({
				url: "buyMoney.me",
				type: "post",
				data: form,
				success:function(data){
					console.log(data);
					if(data==1){
						$("#pay_div2").css("display","none");
						$("#pay_div3").css("display","block")
					}else if(data==0){
						swal("","비밀번호가 일치하지 않습니다.","warning")
						.then((ok)=>{
							if(ok){
								$('#card_pwd').val("");
								$('#card_pwd').focus();
							}
						});
					}else{
						swal("","결제에 실패하였습니다. 다시 시도해주세요.","warning");
					}
					
				},
				error:function(){
					alert("ajax 실패");
				}
			});
			
		}
	});
	
	$('#closeBtn').click(function(){  //  닫기버튼 클릭시
		opener.parent.location.reload();
		window.close();
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function validate(){	
		if($('#card_pwd').val().length < 4 ) {
			swal("","카드비밀번호 4자리를 입력해주세요.","info");
			return false;
		}
		return true;
	}
	
</script>
</body>
</html>
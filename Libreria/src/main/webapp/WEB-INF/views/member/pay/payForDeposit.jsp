<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<title>무통장 입금</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/pay.css"/>
</head>
<body>
<div class="pay_div">
 	<div class="pay_title_div">
 		<span>LIBRERIA</span>
 		<span>무통장 입금</span>
 	</div>
 	<div class="pay_body">
 		<form method="post" id="depositForm">
	 		<input type="hidden" name="mem_no" value="${loginUser.mem_no }">
		 	<input type="hidden" name="charge_money" id="charge_money">
		 	<input type="hidden" name="charge_way" value="DP">
		 	<div class="pay_deposit_div">
		 		<p>
			 		<span>계좌번호 : 111-222222-33-44</span><br>
			 		<span></span><br>
			 		<span>예금주 : (주)역삼동 코딩머신</span><br>
			 		<span></span><br></p>
		 		<p>
		 		<span>* 입금자명은 회원가입 시 입력한 이름으로 기입해 주십시오.</span><br>
		 		&nbsp;&nbsp;이름이 일치하지 않을 경우 혹은 전혀관계 없는 이름으로 기입하실 경우에는<br> 
		 		&nbsp;&nbsp;입금확인이 불가능하므로 주의하시기 바랍니다.
		 		</p>
		 	</div>
		
		 	<div class="pay_check_div">
		 		<button type="button" id="closeBtn">닫기&gt;</button>
		 	</div>
	 	</form>
 	</div>
</div>
<script type="text/javascript">
	$(function(){
		var charge_money = $(opener.document).find("#select_charge_moeny").val();
		$('#charge_money').val(charge_money);
		$('.pay_deposit_div').find('span').eq(1).text("상품명 : 머니충전 +"+numberWithCommas(charge_money));
		$('.pay_deposit_div').find('span').eq(3).text("이체하실 금액: "+numberWithCommas(charge_money)+"원");
	});
	
	$('#closeBtn').click(function(){  //  닫기버튼 클릭시 바로 결제되어 DB반영
		var form = $('#depositForm').serialize();
	
		$.ajax({
			url: "buyMoney3.me",
			type: "post",
			data: form,
			success: function(data){
				console.log(data);
				if(data == 1){
					swal("","결제에 성공하였습니다.","success")
					.then((ok)=>{
						if(ok){
							window.close();
						}
					});
				}else{
					swal("","결제에 실패하였습니다.","error");
				}
			},
			error: function(){
				alert("ajax 실패");
			}
		
		})
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</body>
</html>
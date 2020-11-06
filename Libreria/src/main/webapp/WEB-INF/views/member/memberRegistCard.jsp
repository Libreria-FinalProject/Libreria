<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/registerCard.css"/>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
		<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">마이 페이지</li>
				<li class="side_nav_list_li"><span class="icon_person">회원정보 변경 </span></li>
				<li class="side_nav_list_li"><span class="icon_dollar1">구매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_dollar2">판매내역 조회</span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_card">결제카드 등록</span></li>
				<li class="side_nav_list_li"><span class="icon_wallet">머니 충전</span></li>
				<li class="side_nav_list_li"><span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">결제카드 등록</span>
			<c:if test="${empty registCard }">
				<form method="post" action="newCard.me">
				<input type="hidden" name="mem_no" value="${ loginUser.mem_no }">
				<table id="card_table">
					<tr>
						<td class="td_first">결제사</td>
						<td><select id="select_card" name="card_company">
							<option>삼성</option>
							<option>신한</option>
							<option>우리</option>
							<option>수협</option>
							<option>시티</option>
							<option>농협</option>
							<option>국민</option>
							<option>롯데</option>
							<option>현대</option>
							<option>비씨</option>
							</select></td>
					</tr>
					<tr>
						<td class="td_first">카드번호</td>
						<td><input type="text" class="input_cardNum" maxlength="4"> - <input type="text" class="input_cardNum" maxlength="4"> -  <input type="text" class="input_cardNum" maxlength="4"> - <input type="text" class="input_cardNum" maxlength="4">
							<input type="hidden" name="card_no" id="card_no">
						</td>
					</tr>
					<tr>
						<td class="td_first">결제 비밀번호</td>
						<td><input type="password" id="input_cardPwd" maxlength="4" name="card_pwd"></td>
					</tr>
					<tr>
						<td class="td_first">유효기간</td>
						<td><input type="text" class="input_expDate" id="input_expDate_month" placeholder="월" maxlength="2"> / <input type="text"  class="input_expDate" id="input_expDate_year" placeholder="년" maxlength="4">
							<input type="hidden" name="card_expire" id="card_expire">
						</td>
					</tr>
				</table>
				<button type="submit" id="regist_btn" onclick="return validate()">등록</button>
				</form>
			</c:if>	
			<c:if test="${!empty registCard }">
				<table id="card_table">
					<tr>
						<td class="td_first">결제사</td>
						<td>
							${registCard.card_company }
						</td>
					</tr>
					<tr>
						<td class="td_first">카드번호</td>
						<td>${registCard.card_no }</td>
					</tr>
					<tr>
						<td class="td_first">유효기간</td>
						<td></td>
				</table>
				<button type="submit" id="change_btn">변경</button>
			</c:if>
		</div>
		<script type="text/javascript">
			$(function(){
				
				var card_expire = '${registCard.card_expire}';
				console.log(card_expire);
				var card_expire_arr = card_expire.split('-');
				$("#card_table").find('td').eq(5).text(card_expire_arr[1]+" / "+card_expire_arr[0]);
				
				//////////////////////////////////////////////
				
				$('#side_nav').find('li').eq(1).click(function(){
					location.href="mypage.me";
				});
				$('#side_nav').find('li').eq(2).click(function(){
					location.href="memberBuy.me";
				});
				$('#side_nav').find('li').eq(3).click(function(){
					location.href="memberSell.me";
				});
				$('#side_nav').find('li').eq(4).click(function(){
					location.href="registCard.me";
				});
				$('#side_nav').find('li').eq(5).click(function(){
					location.href="chargeMoney.me";
				});
				$('#side_nav').find('li').eq(6).click(function(){
					location.href="leaveForm.me";
				});	
				
			
				///////////////////////////////
				$(".input_cardNum").on("keyup",function(){
					var input_cardNum = $(this).val();
					input_cardNum =  input_cardNum.replace(/[^0-9]/g,'');
					$(this).val(input_cardNum);
				});
				
				$('#input_cardPwd').on('keyup', function(){
					var input_cardPwd = $(this).val();
					input_cardPwd =  input_cardPwd.replace(/[^0-9]/g,'');
					$(this).val(input_cardPwd);
				});
				
				$('#input_expDate_month').on('keyup', function(){
					var input_expDate_month = $(this).val();
					input_expDate_month =  input_expDate_month.replace(/[^0-9]/g,'');
					$(this).val(input_expDate_month);
				});
				
				$('#input_expDate_year').on('keyup', function(){
					var input_expDate_year = $(this).val();
					input_expDate_year =  input_expDate_year.replace(/[^0-9]/g,'');
					$(this).val(input_expDate_year);
				});
				
			
				$('#change_btn').click(function(){
					swal({
						title: "",		
						text: "카드를 변경하시겠습니까?",
						icon : "info",
						buttons :["취소","확인"]})
					.then((ok)=>{
						if(ok){
							location.href="changeCard.me";
						}
					});
				});
			});
			
			function validate(){
				var input_cardNum_arr = $(".input_cardNum");
				var cardNum = "";
				for(var i=0; i<input_cardNum_arr.length;i++){
					if(input_cardNum_arr[i].value.length<4){
						swal("","카드번호 16자리 모두 입력해주세요.","info")
						.then((ok)=>{
							input_cardNum_arr[i].focus();
						});
						return false;
					}
					
					if( i != input_cardNum_arr.length-1){
						cardNum = cardNum + input_cardNum_arr[i].value+"-";
					}else{
						cardNum = cardNum + input_cardNum_arr[i].value;
					}
				}
				$("#card_no").val(cardNum);
				
				
				
				var input_cardPwd = $('#input_cardPwd').val();
				if(input_cardPwd.length<4){
					swal("","카드 비밀번호는 4자리를 입력해주세요.","info")
					.then((ok)=>{
						if(ok){
							input_cardPwd.focus();
						}
					});
					return false;
				}
				
				var input_expDate_month = $('#input_expDate_month').val();
				var input_expDate_year = $('#input_expDate_year').val();
				
				if(input_expDate_month.length <2 || parseInt(input_expDate_month)>12){
					swal("","카드 유효기간의 월을 정확히 입력해주세요.","info")
					.then((ok)=>{
						if(ok){
							$('#input_expDate_month').focus();
						}
					});
					return false;
				}else if( input_expDate_year.length < 4){
					console.log(input_expDate_year);
					swal("","카드 유효기간의 연도를 정확히 입력해주세요.(4자리)","info")
					.then((ok)=>{
						if(ok){
							$('#input_expDate_year').focus();
						}
					});
					return false;
				}else{
					var expire_date =input_expDate_year+"-"+input_expDate_month+"-01";
					
					$('#card_expire').val(expire_date);
					console.log($('#card_expire').val());
				}
								
			 	swal({
					 title: "",
					 text: "카드를 등록하시겠습니까?",
					 icon : "info",
					 buttons :["취소","확인"]})
				.then((ok)=>{
					 if(ok){
						 return true;
					 }
				});
			}
		</script>
</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
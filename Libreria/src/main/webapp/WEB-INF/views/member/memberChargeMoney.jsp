<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/chargeMoney.css"/>
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
				<li class="side_nav_list_li"><span class="icon_card">결제카드 등록</span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_wallet">머니 충전</span>
					<ul id="sub_ul_wallet">
						<li><span class="selected_li">- 머니 충전</span></li>
						<li><span>- 충전 내역</span></li>
					</ul>
				</li>
				<li class="side_nav_list_li"><span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">머니 충전</span>
			<input type="hidden" id="select_charge_moeny" value="10000">
			<table id="charge_table">
				<tr>
					<th>충전머니</th>
					<th>결제금액</th>
				</tr>
				<tr>
					<td><input type="radio" name="radio_money" value="2000" class="radio_money">+2,000</td>
					<td>2,000원</td>
				</tr>
				<tr>
					<td><input type="radio"  name="radio_money" value="5000" class="radio_money">+5,000</td>
					<td>5,000원</td>
				</tr>
				<tr>
					<td><input type="radio"  name="radio_money" checked value="10000" class="radio_money">+10,000</td>
					<td>10,000원</td>
				</tr>
				<tr class="td_point_bottom">
					<td><input type="radio"  name="radio_money" value="20000" class="radio_money">+20,000</td>
					<td>20,000원</td>
				</tr>
				<tr>
					<td><input type="radio"  name="radio_money" value="30000" class="radio_money">+30,000</td>
					<td>30,000원</td>
				</tr>
				<tr>
					<td><input type="radio"  name="radio_money" value="50000" class="radio_money">+50,000</td>
					<td>50,000원</td>
				</tr>
				<tr class="td_point_bottom">
					<td><input type="radio"  name="radio_money" value="70000" class="radio_money">+70,000</td>
					<td>70,000원</td>
				</tr>
				<tr>
					<td><input type="radio"  name="radio_money" value="100000" class="radio_money">+100,000</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><input type="radio"  name="radio_money" value="150000" class="radio_money">+150,000</td>
					<td>150,000원</td>
				</tr>
				<tr class="td_point_bottom">
					<td><input type="radio"  name="radio_money" value="300000" class="radio_money">+300,000</td>
					<td>300,000원</td>
				</tr>
			</table>
			<div id="div_pharseMethod">
				<span >결제수단</span>
				<div id="div_pharseMethod2">
					<div><input type="radio" name="radio_method" class="radio_method" checked value="card1"> 등록된 카드로 결제</div>
					<div><input type="radio" name="radio_method" class="radio_method"  value="card2"> 다른 신용카드로 결제</div>
					<div><input type="radio" name="radio_method"  class="radio_method" value="deposit"> 무통장입금</div>
					<input type="hidden" id="radio_method_hidden" value="card">
				</div>
				<div id="div_pharseMethod3">
					<input type="checkbox"><div> 상품, 가격, 유의사항 등을 확인하였으며 구매에 동의합니다.</div>
				</div>
			</div>
			<button type="button" id="charge_btn">머니 충전</button>
		</div>
		<script type="text/javascript">
			$(function(){
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
				/* $('#side_nav').find('li').eq(5).click(function(){
					location.href="chargeMoney.me";
				}); */
				$('#sub_ul_wallet').find('li').eq(0).click(function(){
					location.href="chargeMoney.me";
				});
				$('#sub_ul_wallet').find('li').eq(1).click(function(){
					location.href="confirmMoney.me";
				});
				$('#side_nav').find('li').eq(8).click(function(){
					location.href="leaveForm.me";
				});
			});
			
			$("#div_pharseMethod2").find("input").click(function(){
				$("#radio_method_hidden").val($(this).val());
			});
			
			$('#div_pharseMethod2').find("div").click(function(){
				$(this).find('input').prop("checked",true);
				$("#radio_method_hidden").val($(this).find('input').val());
			});		
			
			$('#div_pharseMethod3').find("div").click(function(){
				if($("#div_pharseMethod3").find("input").prop("checked") == false){
					$("#div_pharseMethod3").find("input").prop("checked",true);
				}else{
					$("#div_pharseMethod3").find("input").prop("checked",false);
				}
			});
			$('.radio_money').click(function(){
				$('#select_charge_moeny').val($(this).val());
			});
			
			$("#charge_btn").click(function(){
				if($("#div_pharseMethod3").find("input").prop("checked") == false){
					swal("","구매 동의에 체크해주세요.","info")
					.then((ok)=>{
						if(ok){
							$("#div_pharseMethod3").find("input").focus();
						}
					})
				}else{
					if($('#radio_method_hidden').val() == "card2"){
						var popup= window.open("popupPayForCard.me","신용카드 결제","width=566px,height=591px,scrollbars=no,top=100,left=400");
					}else if($('#radio_method_hidden').val()=='deposit'){
						var popup= window.open("popupPayForDeposit.me","무통장 입금","width=566px,height=591px,scrollbars=no,top=100,left=400");
					}else{
						var popup= window.open("popupPayForReistCard.me?mem_no="+${loginUser.mem_no},"등록된 신용카드 결제","width=566px,height=591px,scrollbars=no,top=100,left=400");
					}
				}
			});
		</script>
	</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
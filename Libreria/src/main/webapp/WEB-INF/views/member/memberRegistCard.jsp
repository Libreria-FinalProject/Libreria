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
			<form method="post">
			<table id="card_table">
				<tr>
					<td class="td_first">결제사</td>
					<td><select id="select_card">
						<option>현대</option>
						<option>신한</option>
						<option>롯데</option>
						</select></td>
				</tr>
				<tr>
					<td class="td_first">카드번호</td>
					<td><input type="text" id="input_cardNum"></td>
				</tr>
				<tr>
					<td class="td_first">결제 비밀번호</td>
					<td><input type="password" id="input_cardPwd"></td>
				</tr>
				<tr>
					<td class="td_first">유효기간</td>
					<td><input type="number" class="input_expDate" placeholder="월"> / <input type="number"  class="input_expDate" placeholder="년"></td>
				</tr>
			</table>
			<button type="submit" id="regist_btn">변경</button>
			</form>
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
				$('#side_nav').find('li').eq(5).click(function(){
					location.href="chargeMoney.me";
				});
				$('#side_nav').find('li').eq(6).click(function(){
					location.href="leaveForm.me";
				});
			});
		</script>
</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/buy&sell.css"/>
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
						<li><span>- 머니 충전</span></li>
						<li><span class="selected_li">- 충전 내역</span></li>
					</ul>
				</li>
				<li class="side_nav_list_li"><span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">충전 내역</span>
			<table id="buy_sell_table" class="confirmMoney_table">
				<tr>
					<th>충전 머니</th>
					<th>결제수단</th>
					<th>충전일자</th>
				</tr>
				<tr>
					<td width="415x" height="40px">+50,000</td>
					<td width="150px">신용카드</td>
					<td width="150px">2020/09/25</td>
				</tr>
				<tr>
					<td width="415x" height="40px">+50,000</td>
					<td width="150px">신용카드</td>
					<td width="150px">2020/09/25</td>
				</tr>
				<tr>
					<td width="415x" height="40px">+50,000</td>
					<td width="150px">신용카드</td>
					<td width="150px">2020/09/25</td>
				</tr>
				<tr>
					<td width="415x" height="40px">+50,000</td>
					<td width="150px">신용카드</td>
					<td width="150px">2020/09/25</td>
				</tr>
				<tr>
					<td width="415x" height="40px">+50,000</td>
					<td width="150px">신용카드</td>
					<td width="150px">2020/09/25</td>
				</tr>
				
			</table>
			<div id="paging_div">
				<button type="button">&lt;</button>
				<button type="button" class="paging_selected_btn">1</button>
				<button type="button">2</button>
				<button type="button">3</button>
				<button type="button">&gt;</button>
			</div>
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
		</script>
	</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
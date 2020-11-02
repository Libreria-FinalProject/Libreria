<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
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
				<li class="side_nav_list_li">&gt; <span class="icon_dollar2">판매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_card">결제카드 등록</span></li>
				<li class="side_nav_list_li"><span class="icon_wallet">머니 충전</span></li>
				<li class="side_nav_list_li"><span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">판매내역 조회</span>
			<table id="buy_sell_table" class="sell_table">
				<tr>
					<th>도서명</th>
					<th>판매일자</th>
					<th>판매확정일자</th>
					<th>상태</th>
				</tr>
				<tr>
					<td width="340px" height="50px">눈물을 마시는 새</td>
					<td width="120px">2020/09/25</td>
					<td width="120px">2020/09/27</td>
					<td width="100px">+5000머니</td>
				</tr>
				<tr>
					<td width="340px" height="40px">눈물을 마시는 새</td>
					<td width="120px">2020/09/25</td>
					<td width="120px">2020/09/27</td>
					<td width="100px">+5000머니</td>
				</tr>
				<tr>
					<td width="340px" height="40px">눈물을 마시는 새</td>
					<td width="120px">2020/09/25</td>
					<td width="120px">2020/09/27</td>
					<td width="100px">+5000머니</td>
				</tr>
				<tr>
					<td width="340px" height="40px">눈물을 마시는 새</td>
					<td width="120px">2020/09/25</td>
					<td width="120px">2020/09/27</td>
					<td width="100px">+5000머니</td>
				</tr>
				<tr>
					<td width="340px" height="40px">눈물을 마시는 새</td>
					<td width="120px">2020/09/25</td>
					<td width="120px">2020/09/27</td>
					<td width="100px">+5000머니</td>
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
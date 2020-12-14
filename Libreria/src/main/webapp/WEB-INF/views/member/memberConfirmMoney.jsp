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
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
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
				<c:if test="${ empty moneyList  }">
					<tr>
						<td colspan="3">내역이 없습니다.</td>
					</tr>				
				</c:if>
				<c:if test="${!empty moneyList }">
				<c:forEach var="m" items="${moneyList}" varStatus="status">
					<tr class="moneyTr">
						<td width="415x" height="40px"></td>
						<c:if test="${m.charge_way=='Card'}">
							<td width="150px">신용카드</td>						
						</c:if>
						<c:if test="${m.charge_way == 'Mutong' }">
							<td width="150px">무통장입금</td>
						</c:if>
						<td width="150px">${m.charge_date }</td>
					</tr>
					<script>
						var charge_money = "${m.charge_money}";
						$('tr').eq(${status.index}+1).find('td').eq(0).text("+ "+numberWithCommas(charge_money));
					</script>
				</c:forEach>
				</c:if>
			</table>
			<div id="paging_div">
			<c:if test="${pi.currentPage>1}">
				<c:url var="before" value="confirmMoney.me">
					<c:param name="page" value="${pi.currentPage-1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${before}'">&lt;</button>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:if test="${p eq pi.currentPage}">
					<button type="button"  class="paging_selected_btn">${p }</button>
				</c:if>
				
				<c:if test="${p ne pi.currentPage }">
					<c:url var="pagination" value="confirmMoney.me">
							<c:param name="page" value="${ p }"/>
					</c:url>
					<button type="button" onclick="location.href='${pagination}'">${p}</button>
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage < pi.endPage }">
			<c:url var="after" value="confirmMoney.me">
					<c:param name="page" value="${pi.currentPage+1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${after}'">&gt;</button>
			</c:if>
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
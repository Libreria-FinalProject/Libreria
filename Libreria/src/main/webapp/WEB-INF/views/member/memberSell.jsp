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
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
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
				<c:if test="${empty sellList }">
					<td colspan="4" style="text-align: center;">조회 결과가 없습니다.</td>
				</c:if>
				<c:if test="${!empty sellList }">
				<c:forEach var="s" items="${sellList }"  varStatus="status"> 
					<tr>
						<td width="340px" height="50px">${s.b_title }</td>
						<td width="120px">${s.sell_date}</td>
						<td width="120px">${s.sell_decide_date }</td>
						<td width="100px"></td>
					</tr>
					<script>
						var sell_decide_date = "${s.sell_decide_date}";
						var sell_money ="${s.sell_money}";
						if(sell_decide_date != ''){
							$('tr').eq(${status.index}+1).find("td").eq(3).text("+ "+numberWithCommas(sell_money)+"머니");
						}else{
							$('tr').eq(${status.index}+1).find("td").eq(3).text("대기중");
						}
						
					</script>
				</c:forEach>
				</c:if>

			</table>
		
			<div id="paging_div">
			<c:if test="${pi.currentPage>1}">
				<c:url var="before" value="memberSell.me">
					<c:param name="page" value="${pi.currentPage-1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${before}'">&lt;</button>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:if test="${p eq pi.currentPage}">
					<button type="button"  class="paging_selected_btn">${p }</button>
				</c:if>
				
				<c:if test="${p ne pi.currentPage }">
					<c:url var="pagination" value="memberSell.me">
							<c:param name="page" value="${ p }"/>
					</c:url>
					<button type="button" onclick="location.href='${pagination}'">${p}</button>
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage < pi.endPage }">
			<c:url var="after" value="memberSell.me">
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
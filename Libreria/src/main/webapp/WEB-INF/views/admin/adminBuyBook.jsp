<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/buy&sell.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
		<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">관리자 페이지</li>
				<li class="side_nav_list_li"><span class="icon_person">회원관리 </span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_dollar1">상품구매</span></li>
				<li class="side_nav_list_li"><span class="icon_dollar2">상품등록</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">판매내역 조회</span>
			<table id="buy_sell_table" class="sell_table admin_buy_table">
				<tr>
					<th>도서명</th>
					<th>판매일자</th>
					<th>희망머니</th>
					<th>상세정보</th>
				</tr>
				<tr>
					<td>눈물을 마시는 새</td>
					<td>2020/09/25</td>
					<td >5,000</td>
					<td><button onclick="">상세정보</button></td>
				</tr>
				<tr>
					<td>눈물을 마시는 새</td>
					<td>2020/09/25</td>
					<td >5,000</td>
					<td><button onclick="">상세정보</button></td>
				</tr>
				<tr>
					<td>눈물을 마시는 새</td>
					<td>2020/09/25</td>
					<td >5,000</td>
					<td><button onclick="">상세정보</button></td>
				</tr>
				<tr>
					<td>눈물을 마시는 새</td>
					<td>2020/09/25</td>
					<td >5,000</td>
					<td><button onclick="">상세정보</button></td>
				</tr>
				<tr>
					<td>눈물을 마시는 새</td>
					<td>2020/09/25</td>
					<td >5,000</td>
					<td><button onclick="">상세정보</button></td>
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
		
		<div id="admin_popup">
			<span>도서명 : 눈물을 마시는 새</span><br>
			<span>장르 : 소설</span><br>
			<span>저자 : 이영도</span><br>
			<span>출판사 : 황금가지</span><br>
			<span>상태 : 중고(80%)</span><br>
			<span>희망머니 : 5,000</span><br>
			<div id="admin_popup_buttondiv">
			<button id="popup_close_btn">닫기</button><button onclick="" >구매</button>			
			</div>
		</div>
	</section>
	<script type="text/javascript">
			$(function(){
				$('#side_nav').find('li').eq(1).click(function(){
					location.href="adminpage.ad";
				});
				$('#side_nav').find('li').eq(2).click(function(){
					location.href="buyBook.ad";
				});
				$('#side_nav').find('li').eq(3).click(function(){
					location.href="insertBook.ad";
				});
				
				$('#popup_close_btn').click(function(){
					$('#admin_popup').css("display","none");
				});
			});
		</script>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
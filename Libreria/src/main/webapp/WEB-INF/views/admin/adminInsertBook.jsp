<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/registerCard.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
		<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">관리자 페이지</li>
				<li class="side_nav_list_li"><span class="icon_person">회원관리 </span></li>
				<li class="side_nav_list_li"><span class="icon_dollar1">상품구매</span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_dollar2">상품등록</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">상품 등록</span>
			<form method="post">
			<table id="admin_bookinsert_table">
				<tr>
					<td class="td_first">유형</td>
					<td>
						<input type="radio" name="book_type"><span> 새로운 도서 등록</span><br>
						<input type="radio" name="book_type"><span> 회원에게 구매한 도서 등록</span><br>
						<select>
							<option>눈물의 마시는 새,이영도,2020.09.29</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_first">도서명</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td class="td_first">저자</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td class="td_first">출판사</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td class="td_first">저자 소개</td>
					<td><textarea></textarea></td>
				</tr>
				<tr>
					<td class="td_first">책 소개</td>
					<td><textarea></textarea></td>				
				<tr>
					<td class="td_first">커버 이미지</td>
					<td><input type="file" ></td>
				</tr>
			</table>
			<button type="submit" id="regist_btn">등록</button>
			</form>
		</div>
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
			});
		</script>
	</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
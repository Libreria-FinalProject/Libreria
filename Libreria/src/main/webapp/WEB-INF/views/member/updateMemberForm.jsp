<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/updateMember.css"/>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
	<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">마이 페이지</li>
				<li class="side_nav_list_li">&gt; <span class="icon_person">회원정보 변경 </span></li>
				<li class="side_nav_list_li"><span class="icon_dollar1">구매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_dollar2">판매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_card">결제카드 등록</span></li>
				<li class="side_nav_list_li"><span class="icon_wallet">머니 충전</span></li>
				<li class="side_nav_list_li"><span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">회원정보 변경</span>
			<form method="post">
				<table id="memberInfo_table">
					<tbody>
						<tr>
							<td class="td_first">이메일</td>
							<td><input type="text" name="mem_email"readonly></td>
						</tr>
						<tr>
							<td  class="td_first">이름</td>
							<td><input type="text" name="mem_name" readonly></td>
						</tr>
						<tr>
							<td   class="td_first">비밀번호 변경</td>
							<td id="td_password">
							    <input type="password" placeholder="현재 비밀번호"><br>
								<input type="password" placeholder="새 비밀번호"><br>
								<input type="password" placeholder="새 비밀번호 확인">
							</td>
						</tr>
					
						<tr>	
							<td class="td_first">연락처</td>
							<td><input type="tel"></td>
						</tr>
						<tr>
							<td class="td_first">배송지</td>
							<td id="td_address"><input type="text"><button type="button">검색</button><br>
							<input type="text"><br>
							<input type="text"></td>
						</tr>
						<tr >
							<td  class="td_first">관심사</td>
							<td id="td_interest">
								<input type="checkbox" name="ck_interst"><span> 소설 </span>
								<input type="checkbox" name="ck_interst"><span> 경영/경제 </span>
								<input type="checkbox" name="ck_interst"><span> 자기계발 </span>
								<br>
								<input type="checkbox" name="ck_interst"><span> 에세이/시 </span>
								<input type="checkbox" name="ck_interst"><span> 여행 </span>
								<input type="checkbox" name="ck_interst"><span> 종교 </span>
								<br> 
								<input type="checkbox" name="ck_interst"><span> 외국어 </span>
								<input type="checkbox" name="ck_interst"><span> 과학 </span>
								<input type="checkbox" name="ck_interst"><span> 컴퓨터/IT</span></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" id="update_btn">변경</button>
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
					location.href="leave.me";
				});
			});
		</script>
</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
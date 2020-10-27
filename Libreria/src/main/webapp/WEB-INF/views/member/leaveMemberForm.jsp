<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/leave.css"/>
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
				<li class="side_nav_list_li"><span class="icon_wallet">머니 충전</span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">회원 탈퇴</span>
			<div id="leave_div">
				<span class="font_violet">"다음 사항을 꼭 확인해주세요."</span><br>
				<span>사용하지 않은 머니는 즉시 소멸되며 환불받을 수 없습니다.</span><br>
				<span class="font_red">잔여머니 : 0원</span><br>
				<span>탈퇴가 완료되면 가입한 이메일로 가입할 수 없습니다.</span><br>
				<span class="font_violet">"본인 확인을 위해 비밀번호를 입력해주세요."</span><br>
				<input type="password" placeholder="비밀번호 입력"><br>
				<div id="leave_subdiv">
					<span class="warning_icon"></span>탈퇴가 완료된 계정은 다시 복구할 수 없습니다.
				</div> 
				<div id="leave_subdiv2">
					<input type="checkbox"> <span>위 내용을 이해했으며, 모두 동의합니다.</span><br>
					<button type="button">회원 탈퇴</button>
				</div>
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
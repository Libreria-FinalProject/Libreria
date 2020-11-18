<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Libreria</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
</head>
<body>
	<nav class="" id="nav_container">
			<div id="nav_body">
				<a class="" href="/libreria" id="a_brand">LIBRERIA</a>
				<div id="div_search">
					<img alt="검색" src="${pageContext.request.contextPath}/resources/images/icon_search.png">
					<input type="text" id="input_search" placeholder="검색어를 입력하세요">
				</div> 
	
				<c:if test="${ empty sessionScope.loginUser }">
					<div id="div_head_btns">
						<button class="btn_head" onclick="location.href='enrollView.me'">회원가입</button>
						<button class="btn_head" onclick="location.href='loginForm.me'">로그인</button>
					</div>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser }">
					<div id="div_head_btns">
						<c:if test="${ loginUser.mem_grade eq 'user'}">
							<button class="btn_head" onclick="location.href='mypage.me'">마이페이지</button>
						</c:if>
						<c:if test="${ loginUser.mem_grade eq 'admin'}">
							<button class="btn_head" onclick="location.href='adminpage.ad'">관리자페이지</button>
						</c:if>
						
						<button class="btn_head" onclick="location.href='logout.me'">로그아웃</button>
					</div>
				</c:if>
			</div>
			<div id="nav_menu">
				<ul id="menu_ul">
					<li id="menu_li"></li>
					<li>국내도서</li>
					<li>외국도서</li>
					<li>중고도서</li>
					<li>고객센터</li>
					<li>장바구니</li>
				</ul>
			</div>
	</nav>
	<script>
	 	$('#menu_li').click(function(){
			location.href = "bookCateList.bo?bcf_no=1";
		}); 
	
	
	
	</script>
	
	
	</body>
</html>
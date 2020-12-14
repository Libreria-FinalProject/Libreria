<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Libreria</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/ba69187994.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
</head>
<body>
	<nav class="" id="nav_container">
			<div id="nav_body">
				<a class="" href="/libreria" id="a_brand">LIBRERIA</a>
				<div id="div_search">
					<img alt="검색" src="${pageContext.request.contextPath}/resources/images/icon_search.png">
					<input type="text"  id="input_search" placeholder="검색어를 입력하세요">
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
					<!-- <li>외국도서</li> -->
					<li>중고도서</li>
					<li id="service_li"><span>고객센터</span>
						<ul>
							<li>FAQ</li>
							<li>Q&A</li>
							<li>공지사항</li>
						</ul>
					</li>
					<c:if test="${!empty sessionScope.loginUser }">
					<li id="UserBasket">장바구니</li>
					</c:if>
					<c:if test="${ empty sessionScope.loginUser }">
					<li id="UserBasketNotLogin">장바구니</li>
					</c:if>
				</ul>
			</div>
	</nav>
	<script>
	 	$('#menu_li').click(function(){
			location.href = "bookCateList.bo?bcf_no=1";
		}); 
	 	
	 	$('#menu_ul').find('li').eq(2).click(function(){
			location.href = "sellBookForm.bo";
		}); 
	 	
	 	$('#service_li').find('span').click(function(){
			location.href="FAQList.bd";		
	 	}); 
	 	
	 	$("#service_li").find('li').eq(0).click(function(){
	 		console.log("FAQ");
	 		location.href="FAQList.bd";
	 	});
	 	
		$("#service_li").find('li').eq(1).click(function(){
			console.log("QNA");
			location.href="QNAList.bd";
	 	});
		
		$("#service_li").find('li').eq(2).click(function(){
			location.href="NoticeList.bd";
		});
	 	
	 	$("#service_li").hover(function(){
	 		$(this).find('ul').css("display","block");
	 	}, function(){
	 		$(this).find('ul').css("display","none");
	 	});
	
	 	/* $('#menu_li').click(function(){
			location.href = "bookCateList.bo";
		});  */
	 	
		$('#UserBasket').click(function(){
			location.href = "basketList.pay";
		});
		
		$('#UserBasketNotLogin').click(function(){
			swal ( "접근불가" ,  "로그인 후 사용 가능합니다." ,  "error" )
		})
		
	
		$("#input_search").keyup(function(e){
			var word = $(this).val();
			
			if(e.keyCode == 13){
				
				if(word == ""){
					$('#input_search').focus();
					swal("검색 오류","검색어가 없습니다. 검색어를 확인해주세요.","error");
				}else{
					location.href =  "searchWordList.bo?word="+word;
				}				
			
			
			
			}
		});


	
	
	</script>
	
	
	</body>
</html>
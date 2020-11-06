<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">



</style>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/book/bookCategoryPage.css"/>
</head>
<body>
<!-- 헤더 -->
<c:import url="../common/header.jsp"></c:import>

<section>
      <article>
      	<div id="nav_cate">
      		<ul id="book_cate_ul">
				<li class="main_book_cate">소설
					<ul id="sub_book_cate">
						<li>소설전체</li>
						<li>한국소설</li>
						<li>미국소설소설</li>
						
					</ul>
				</li>
				<li class="main_book_cate"><a>문학</a></li>
				<li class="main_book_cate"><a>에세이</a></li>
				<li class="main_book_cate"><a>컴퓨터</a></li>
				<li class="main_book_cate"><a>종교</a></li>
				<li class="main_book_cate"><a>외국어</a></li>
				<li class="main_book_cate"><a>만화</a></li>
				<li class="main_book_cate"><a>유아</a></li>
				<li class="main_book_cate"><a>자기계발</a></li>
				<li class="main_book_cate"><a>카테고리 종류</a></li>
				<li class="main_book_cate"><a>카테고리 종류</a></li>
				<li class="main_book_cate"><a>카테고리 종류</a></li>
				<li class="main_book_cate"><a>카테고리 종류</a></li>
				<li class="main_book_cate"><a>카테고리 종류</a></li>
				<li class="main_book_cate"><a>카테고리 종류</a></li>
				<li class="main_book_cate"><a>카테고리 종류</a></li>
      		</ul>
      	</div>
      
      	<div id="content_div">
      		<div id='contentHead'>
      		 	<p>카테고리 이름</p>
      		</div>
      		<div id="content_sub_cate" >
      			<ul>
      				<li>홈</li>
      				<li>신간</li>
      				<li>베스트셀러</li>
      				<li>전체</li>
      			</ul>
      			
      		</div>
      		
      		<div id="menu_bar" class="bot_mar">
      			<div id="content_sub_cate_sel"></div>
      		</div>
      		
      		
      		<div>
      			<div id="sub_menu_sel" class="bot_mar">
      				<p>신간</p>
      			</div>
      				<div class="sub_menu_hr">
      			</div>
      				<button class='sub_menu_btn'>전체보기</button>
      		</div>
      		
      		
      		<div class="book_salary">
      		
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				  		
      		</div>
      	
      		
      		
      		
      		<!--  구분 -->
      		
      		<div>
      			<div id="sub_menu_sel" class="bot_mar">
      				<p>인기</p>
      			</div>
      				<div class="sub_menu_hr">
      			</div>
      				<button class='sub_menu_btn'>전체보기</button>
      		</div>
      		<div class="book_salary">
      		
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book</h3>
					
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
				<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover1.jpg" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">Book Title</h3>
						<p class="book_writer_cl">저자</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : 15000원</p>
					</div>
				</div>
      		
      		
      	</div>
      	<br>
    
      	<br>
      	</div>
      </article>
   
   </section>

<!-- 풋터 -->
<c:import url="../common/footer.jsp"></c:import>
	<script>
		$(function(){
			$('.book_wrapper').click(function(){
				location.href = "bookDetail.bo";
			})
			
		});
	
	
	</script>
</body>
</html>
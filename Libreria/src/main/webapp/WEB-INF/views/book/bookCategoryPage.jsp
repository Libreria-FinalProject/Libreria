<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<!-- 카테고리 DB연결  -->
				<c:forEach var="bcf" items="${bcfList}">
					<li class="main_book_cate">
						<a class="bfc_class">${bcf.bcf_ct}
							<input id="bcf_no" name='bcf_no' type="hidden" value="${ bcf.bcf_no }">
						</a>
						
						<ul id="sub_book_cate">
						
							<c:forEach var="bsc" items="${bscList }">
								<c:if test="${ bcf.bcf_no eq bsc.bcf_no }">
								<li><a>${ bsc.bc_ct }</a></li>
								</c:if>
							</c:forEach>
						
						</ul>
						
					</li>
				</c:forEach>
      		</ul>
      	</div>
      	<script>
      		$(function(){
      			$('.main_book_cate').click(function(){
      				var bcf_no = $(this).find('#bcf_no').val();
      				
      				console.log(bcf_no);
      				location.href="bookCateList.bo?bcf_no="+bcf_no;
      			})
      			
      		})
      	
      	</script>
      
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
      		
      		<!-- 신간 div  -->
      		<div>
      			<div id="sub_menu_sel" class="bot_mar">
      				<p>신간</p>
      			</div>
      				<div class="sub_menu_hr">
      			</div>
      				<button class='sub_menu_btn'>전체보기</button>
      		</div>
      		
      		
      		<div class="book_salary">
      			<c:forEach var="bList" items="${bList}">					
					<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${bList.file_path}${bList.change_name}" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">${bList.b_title}</h3>
						<p class="book_writer_cl">${bList.bwp_name }</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : ${ bList.b_price } 원</p>
					</div>
				</div>
				</c:forEach>  		
      		</div>
      	
      		
      		
      		
      		<!-- 인기 div 구분 -->
      		
      		<div>
      			<div id="sub_menu_sel" class="bot_mar">
      				<p>인기</p>
      			</div>
      				<div class="sub_menu_hr">
      			</div>
      				<button class='sub_menu_btn'>전체보기</button>
      		</div>
      		<div class="book_salary">
      		
      		
      		<div class="book_salary">
      			<c:forEach var="bPopList" items="${bPopList}">					
					<div class="book_wrapper">
					<div class="book_cover_cl"><img src="${bPopList.file_path}${bPopList.change_name}" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">${bPopList.b_title}</h3>
						<p class="book_writer_cl">${bPopList.bwp_name }</p>
						<p class="book_score_cl">평점 : ☆☆☆☆☆</p>
						<p class="book_price_cl">구매 : ${ bPopList.b_price } 원</p>
					</div>
				</div>
				</c:forEach>  		
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
			console.log();
				
			$('.book_wrapper').click(function(){
				location.href = "bookDetail.bo";
			})
			
		});
	
	
	</script>
</body>
</html>
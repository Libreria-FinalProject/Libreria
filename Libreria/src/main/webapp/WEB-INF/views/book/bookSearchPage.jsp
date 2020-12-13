<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/book/bookSearchPage.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
	<article>
	<input type="hidden" id="word" value="${ word }"/>
	<div id="content_div">
		<div id="searchPage_header">
			<h2 class="sp_header">'${ word }' 검색 결과 </h2>
			<c:if test="${ !empty bList }">
				<c:if test="${ result == 2 }">책이름 검색결과가 없어 저자검색결과로 대체됩니다.</c:if>
			</c:if>
			<c:if test="${ result != 2 }">
			<c:if test="${ !empty bList }">
				<select id="order_box" class="order_type">
					<option value="1" <c:if test="${ sortTypeDetail == 1 }"> selected </c:if>>책제목</option>
					<option value="2" <c:if test="${ sortTypeDetail == 2 }"> selected </c:if>>저자</option>
				</select>
			</c:if>
			</c:if>
		</div>
		<script>
			$('#order_box').change(function(){
				var word = $('#word').val();
				var sortTypeDetail = $(this).val();
				
				location.href = "searchWordList.bo?word="+word+"&sortTypeDetail="+sortTypeDetail;
				
			});
		
		</script>
		<c:if test="${ empty bList }">
			<c:forEach begin="1" end="12">
				<br>
			</c:forEach>
			<h2 class="ep_list">검색결과가 없습니다.</h2>	
			<c:forEach begin="1" end="12">
				<br>
			</c:forEach>
		</c:if>
	
		<div id="book_info_content">
			<ul class="book_info_cl">
			<c:forEach var="bDetail" items="${bList}">
				<li class="book_info_ulli_cl">	
						<div class="book_wrapper">
						<input type="hidden" id="b_no" value="${ bDetail.b_no }"/>
							<div class="bookInfo_left"><img src="${bDetail.file_path}${bDetail.change_name}" class="book_thumnail"></div>
							<div class="bookInfo_right">
								<h3 class="booK_name_cl">${ bDetail.b_title }</h3>
								<ul class="book_write_star_pub">
									<li>${bDetail.bwp_name }</li>	
									<li><img src="/libreria/resources/images/Product_review_star_avg.png" class="review_list_buyer_star"> (${bDetail.avg_star_people }명)</li>	
									<li>${ bDetail.b_pub_name }</li>	
									<li>${ bDetail.bcf_ct } > ${ bDetail.bc_ct }</li>	
								</ul>
								<p class="book_infomation_cl">
									${bDetail.b_content}
								</p>
								<br>
								<p class="book_price_cl">구매 : <span class="book_price_cl_value"><fmt:formatNumber value="${ bDetail.b_price }"/>원</span></p>
							
							</div>
						</div>
					</li>
			</c:forEach>
			</ul>
			
		</div>
		
		
		<br>
		<br>
		<c:if test="${ !empty bList }">
		<div id="book_info_page">
					<ul class="paging_number">
						<c:if test="${ pi.maxPage > 10 }">
						<!-- page -10버튼 처리 -->
						<c:if test="${ pi.currentPage <= 1 }">
							<li><button class="paging_num_btn" id="paging_before_btn">&lt;&lt; &nbsp;</button><input id="pagin_btn" type="hidden" value="${ before10 }"/></li>	
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before10" value="searchWordList.bo">
								<c:param name="page" value="${ pi.startPage - 10 }"/>
								<c:param name="word" value="${ word }"/>
								<c:param name="sortTypeDetail" value="${sortTypeDetail }"/>
							</c:url>
							<li><button class="paging_num_btn" id="paging_before_btn">&lt;&lt; &nbsp;</button><input id="pagin_btn" type="hidden" value="${ before10 }"/></li>	
						</c:if>
						</c:if>
					
						<!-- 이전 버튼 처리  -->
						<c:if test="${ pi.currentPage <= 1 }">
							<li><button class="paging_num_btn" id="paging_before_btn">&lt; &nbsp;</button><input id="pagin_btn" type="hidden" value="${ before }"/></li>	
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="searchWordList.bo">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="word" value="${ word }"/>
								<c:param name="sortTypeDetail" value="${sortTypeDetail }"/>
							</c:url>
							<li><button class="paging_num_btn" id="paging_before_btn">&lt; &nbsp;</button><input id="pagin_btn" type="hidden" value="${ before }"/></li>	
						</c:if>
						
						
						<!-- 페이징 넘버 처리 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<!-- 페이지가 같을때 -->
							<c:if test="${ p eq pi.currentPage }">
								<li><button class="paging_num_btn_sel" >${ p }</button><input id="pagin_btn" type="hidden" value="${ pagination }"/></li>
							</c:if>
							
							<!-- 같지않을떄 -->
							<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="searchWordList.bo">
								<c:param name="page" value="${ p }"/>
								<c:param name="word" value="${ word }"/>
								<c:param name="sortTypeDetail" value="${sortTypeDetail }"/>
							</c:url>
								<li><button class="paging_num_btn" >${ p }</button><input id="pagin_btn" type="hidden" value="${ pagination }"/></li>
							</c:if>
						</c:forEach>
						
						<!-- 다음 버튼 -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<li><button class="paging_num_btn" id="paging_next_btn">&gt;</button><input id="pagin_btn" type="hidden" value="${ after }"/></li>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="bookCateSelAllList.bo">
								<c:param name="page" value="${ pi.currentPage+1 }"/>
								<c:param name="word" value="${ word }"/>
								<c:param name="sortTypeDetail" value="${sortTypeDetail }"/>
							</c:url>
							<li><button class="paging_num_btn" id="paging_next_btn">&gt;</button><input id="pagin_btn" type="hidden" value="${ after }"/></li>
						</c:if>
						<c:if test="${ pi.maxPage > 10 }">
						<!-- 페이지  + 10  -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<li><button class="paging_num_btn" id="paging_next_btn">&gt;&gt;</button><input id="pagin_btn" type="hidden" value="${ after10 }"/></li>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after10" value="searchWordList.bo">
								<c:param name="page" value="${ pi.startPage+10 }"/>
								<c:param name="word" value="${ word }"/>
								<c:param name="sortTypeDetail" value="${sortTypeDetail }"/>
							</c:url>
							<li><button class="paging_num_btn" id="paging_next_btn">&gt;&gt;</button><input id="pagin_btn" type="hidden" value="${ after10 }"/></li>
						</c:if>
						</c:if>
						
					</ul>
		
		</div>
		</c:if>
		<br>
		<br>
		<br>
		
	</div>
	</article>
</section>
<c:import url="../common/footer.jsp"></c:import>
<script>
	$(function(){
		$('.paging_num_btn').click(function(){
				var page = $(this).parent().find('#pagin_btn').val();
				location.href = page; 
			});
		
		
		$('.book_wrapper').click(function(){
			var b_no = $(this).find('#b_no').val();
			
		
			location.href = "bookDetail.bo?b_no="+b_no;
		});
	})

</script>
</body>
</html>
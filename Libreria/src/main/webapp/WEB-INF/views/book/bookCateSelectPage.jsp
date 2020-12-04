<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libreria</title>
<style type="text/css">
</style>
   <link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/book/bookCategorySelPage.css"/>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
   
   
   <section>
   <input type="hidden" id="recent_bc" value="${ recent_bc }"/>
	<input type="hidden" id="recent_bcf" value="${ recent_bcf }"/>
	<input type="hidden" id="sortType" value=""/>
	<input type="hidden" id="sortTypeDetail" value="${sortTypeDetail }"/>
      <article>
      	<div id="nav_cate">
      		<ul id="book_cate_ul">
				<!-- 카테고리 DB연결  -->
				<c:forEach var="bcf" items="${bcfList}">
					<li class="main_book_cate">
						<a class="bfc_class">${bcf.bcf_ct}<input id="bcf_no" name='bcf_no' type="hidden" value="${ bcf.bcf_no }"></a>
						<ul id="sub_book_cate">
							<c:forEach var="bsc" items="${bscList }">
								<c:if test="${ bcf.bcf_no eq bsc.bcf_no }">
									<c:choose>
										<c:when test="${ recent_bc eq bsc.bc_no}">
											<li class="sub_book_cate">
												<a class="selected_sub_cate_cl">${ bsc.bc_ct }<input type="hidden" id="bc_no" name="bc_no" value="${ bsc.bc_no }"></a>
											</li>		
										</c:when>		
										<c:otherwise>
											<li class="sub_book_cate">
												<a>${ bsc.bc_ct }<input type="hidden" id="bc_no" name="bc_no" value="${ bsc.bc_no }"></a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>	
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
      		</ul>
      	</div>
      
      	<div id="content_div">
      		<div id='contentHead'>
      		 	<p>카테고리 이름</p>
      		</div>
      		<div id="content_sub_cate" >
      			<ul id="sub_cate_ul">
      				<li id="book_cate_sel_home">홈</li>
      				<li id="book_cate_sel_new_b">신간</li>
      				<li id="book_cate_sel_best_b">베스트셀러</li>
      				<li id="book_cate_sel_all_b">전체</li>
      			</ul>
      			
      		</div>
      		
      		<div id="menu_bar" class="sub_menu_bot_mar">
      			<div id="content_sub_cate_sel"></div>
      		</div>
      		
      		
      		<div>
      			<div id="sub_menu_sel" class="bot_mar">
      				<ul>
      					<c:if test="${ all eq  1 }">
	      					<li id="popSort">인기순</li>
	      					<li id="newSort">최신순</li>
	      					<li id="revStarSort">평점순</li>
	      					<li id="revManySort">리뷰많은순</li>
      					</c:if>
      			</ul>
      			</div>
      
      		</div>
      		<script>
      			var sub = $('#sortTypeDetail').val();
      			
      			$(function(){
      				if(sub == 1){
      					$('#popSort').css({"font-weight":"800","color":"black"});
      				}else if(sub == 2){
      					$('#newSort').css({"font-weight":"800","color":"black"});
      				}else if(sub == 3){
      					$('#revStarSort').css({"font-weight":"800","color":"black"});
      				}else if(sub ==4){
      					$('#revManySort').css({"font-weight":"800","color":"black"});
      				}
      			})
      		
      			$('#popSort').click(function(){
      				var bc_no = $('#recent_bc').val();
					var bcf_no = $('#recent_bcf').val();
					console.log("음");
					if(bc_no == 0){
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&sortTypeDetail="+1;
					}else{
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&bc_no="+bc_no+"&sortTypeDetail="+1;
					}
      			});
      			$('#newSort').click(function(){
      				var bc_no = $('#recent_bc').val();
					var bcf_no = $('#recent_bcf').val();
					console.log("음");
					if(bc_no == 0){
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&sortTypeDetail="+2;
					}else{
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&bc_no="+bc_no+"&sortTypeDetail="+2;
					}
      			});
      			$('#revStarSort').click(function(){
      				var bc_no = $('#recent_bc').val();
					var bcf_no = $('#recent_bcf').val();
					console.log("음");
					if(bc_no == 0){
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&sortTypeDetail="+3;
					}else{
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&bc_no="+bc_no+"&sortTypeDetail="+3;
					}
      			});
      			$('#revManySort').click(function(){
      				var bc_no = $('#recent_bc').val();
					var bcf_no = $('#recent_bcf').val();
					console.log("음");
					if(bc_no == 0){
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&sortTypeDetail="+4;
					}else{
						location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&bc_no="+bc_no+"&sortTypeDetail="+4;
					}
      			});
      			
      			
      			
      			
      		
      		
      		</script>
      		
      		
      		<div class="book_salary">
      			<c:forEach var="bList" items="${bList}">					
					<div class="book_wrapper">	 
					<input type="hidden" value="${bList.b_no }" name="b_no" id="b_no">
					<div class="book_cover_cl"><img src="${bList.file_path}${bList.change_name}" class="book_thumnail"></div>
					<div class="book_info_cl">
						<h3 class="booK_name_cl">${bList.b_title}</h3>
						<p class="book_writer_cl">${bList.bwp_name }</p>
						<p class="book_score_cl">평점 : 
						
						<c:forEach var="i" begin="1" end="5">
							<c:if test="${bList.avg_star >= i }">
								<img src="/libreria/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
							</c:if>
							<c:if test="${ bList.avg_star < i  }">						
								<c:choose>
									<c:when test="${ bList.avg_star-i < 0 && bList.avg_star-i > -1 }">
										<img src="/libreria/resources/images/Product_review_star_avg_half.png" class="review_list_buyer_star">
									</c:when> 
									<c:otherwise>
										<img src="/libreria/resources/images/Product_review_star_avg_null.png" class="review_list_buyer_star">
									</c:otherwise>
								</c:choose>
							</c:if>

						</c:forEach>
						<!-- ★☆☆☆☆☆ -->
						</p>
						<p class="book_price_cl">구매 : <span class="book_price_cl_value"><fmt:formatNumber value="${ bList.b_price }"/>원</span> </p>
					</div>
				</div>
				</c:forEach> 
				<br>
				<br>
				<div>
					<ul class="paging_number">
						<c:if test="${ pi.maxPage > 10 }">
						<!-- page -10버튼 처리 -->
						<c:if test="${ pi.currentPage <= 1 }">
							<li><button class="paging_num_btn" id="paging_before_btn">&lt;&lt; &nbsp;</button><input id="pagin_btn" type="hidden" value="${ before10 }"/></li>	
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before10" value="bookCateSelAllList.bo">
								<c:param name="page" value="${ pi.startPage - 10 }"/>
								<c:param name="bc_no" value="${ recent_bc }"/>
								<c:param name="bcf_no" value="${ recent_bcf }"/>
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
							<c:url var="before" value="bookCateSelAllList.bo">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="bc_no" value="${ recent_bc }"/>
								<c:param name="bcf_no" value="${ recent_bcf }"/>
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
							<c:url var="pagination" value="bookCateSelAllList.bo">
								<c:param name="page" value="${ p }"/>
								<c:param name="bc_no" value="${ recent_bc }"/>
								<c:param name="bcf_no" value="${ recent_bcf }"/>
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
								<c:param name="bc_no" value="${ recent_bc }"/>
								<c:param name="bcf_no" value="${ recent_bcf }"/>
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
							<c:url var="after10" value="bookCateSelAllList.bo">
								<c:param name="page" value="${ pi.startPage+10 }"/>
								<c:param name="bc_no" value="${ recent_bc }"/>
								<c:param name="bcf_no" value="${ recent_bcf }"/>
								<c:param name="sortTypeDetail" value="${sortTypeDetail }"/>
							</c:url>
							<li><button class="paging_num_btn" id="paging_next_btn">&gt;&gt;</button><input id="pagin_btn" type="hidden" value="${ after10 }"/></li>
						</c:if>
						</c:if>
						
					</ul>
				</div>
      		</div>
      		<!--  구분 -->
      	<br>
      	<br>
      	</div>
      </article>
      
   
   </section>
   <c:import url="../common/footer.jsp"></c:import>
   <c:if test="${ all eq  1 }">
  		<script>
   		$('#content_sub_cate_sel').css({"left":"165px","width":"30px"});
   		$('#book_cate_sel_all_b').css({"font-weight":"800","color":"black"});
	   </script>
   </c:if>
  <script>
      		$(function(){
      			$('.paging_num_btn').click(function(){
      				var page = $(this).parent().find('#pagin_btn').val();
      				location.href = page; 
      			})
				$('#bc_no').parent().parent().parent().parent().find('.bfc_class').css({'background': '#1f8ce6','border-radius':'2px','color': '#fff'});								
      			
      			var bc_no = null;			
      			
 				$('.sub_book_cate').click(function(){
      				bc_no = $(this).find('#bc_no').val();	
      			
      			}); 
      			
      			$('.main_book_cate').click(function(){
      				var bcf_no = $(this).find('#bcf_no').val();
      				
      				if(bc_no == null){
      					location.href="bookCateList.bo?bcf_no="+bcf_no;
      				}else{
      					location.href="bookCateList.bo?bcf_no="+bcf_no+"&bc_no="+bc_no;
      				}
      				
      			})
      			
      			
      			
      			
      			
      			
      		})
      		
      		$(function(){
      				$('#book_cate_sel_home').click(function(){
      					var bc_no = $('#recent_bc').val();
						var bcf_no = $('#recent_bcf').val();
      					console.log("왜 안출력?");
						if(bc_no == 0){
	      					location.href="bookCateList.bo?bcf_no="+bcf_no;
	      				}else{
	      					location.href="bookCateList.bo?bcf_no="+bcf_no+"&bc_no="+bc_no;
	      				}
      					
      				});
      				
					$('#book_cate_sel_new_b').click(function(){
						location.href = "";
      				});
					$('#book_cate_sel_best_b').click(function(){
						location.href = "";
      				});
					$('#book_cate_sel_all_b').click(function(){
						
						var bc_no = $('#recent_bc').val();
						var bcf_no = $('#recent_bcf').val();
						
						if(bc_no == 0){
							location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no;
						}else{
							location.href = "bookCateSelAllList.bo?bcf_no="+bcf_no+"&bc_no="+bc_no;
						}
      				});
      			});
      		
      	
      	</script>
	<script>
		$(function(){
			$('.book_wrapper').click(function(){
				var b_no = $(this).find('#b_no').val();
				
			
				location.href = "bookDetail.bo?b_no="+b_no;
			})
			
		});
	
	
	</script>
   
</body>
</html>
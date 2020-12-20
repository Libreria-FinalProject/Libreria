<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/book/bookDetailPage.css"/>
<style type="text/css">
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
 	<article>
 		<c:set var="avg_star1" value="0"/>
 		<c:set var="avg_star2" value="0"/>
 		<c:set var="avg_star3" value="0"/>
 		<c:set var="avg_star4" value="0"/>
 		<c:set var="avg_star5" value="0"/>
 		<c:set var="name" value="${ loginUser.mem_name }"/>
 		<input type="hidden" value="${ name }" id="login_name">
		<div id="content_div">
			<div id="book_detail_info">
				<!-- 책 이미지 -->
				<div id="book_tumbnail">
					<img src="${bDetail.file_path}${bDetail.change_name}" id="book_tumbnail_img">
				</div>
				
				<!-- 책 설명 부분 div -->
				<div id="book_detail_head_wapper">	
					<div>
						<p id="book_detail_cate_info">${ bDetail.bcf_ct }  > ${ bDetail.bc_ct } </p>
						<h3 class="book_detail_title">${ bDetail.b_title }</h3>
					</div>
					<div id="book_detail_head_middle">
						<p>
						<c:forEach var="i" begin="1" end="5">
							<c:if test="${bDetail.avg_star >= i }">
								<img src="/libreria/resources/images/Product_review_star_avg.png" class="review_list_avg_star">
							</c:if>
							<c:if test="${ bDetail.avg_star < i  }">						
								<c:choose>
									<c:when test="${ bDetail.avg_star-i < 0 && bDetail.avg_star-i > -1 }">
										<img src="/libreria/resources/images/Product_review_star_avg_half.png" class="review_list_avg_star">
									</c:when> 
									<c:otherwise>
										<img src="/libreria/resources/images/Product_review_star_avg_null.png" class="review_list_avg_star">
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						 
						 <span class="avg_star_people_cl">( ${bDetail.avg_star_people }명 )</span></p>
						<br>
					    <p class="book_writer_pub">${bDetail.b_pub_date} </p>
						<p class="book_writer_pub">${bDetail.bwp_name } <span> 저</span></p>
						<p class="book_writer_pub">${ bDetail.b_pub_name } <span> 출판</span></p>
					</div>
					<div id="book_detail_buy_buttom">
						<h3 class="book_detail_title" style="color: #1f8ce6;"><fmt:formatNumber value="${ bDetail.b_price }"/>원</h3>
						<ul>
							<%-- <li class="book_buy_ic_cl"><img id="book_add_heart"src="${pageContext.request.contextPath}/resources/images/Product_heart.png"></li> --%>
							<c:if test="${!empty sessionScope.loginUser }">
							<li  class="book_buy_ic_cl " id="basket"><img id="book_add_shopCart"src="${pageContext.request.contextPath}/resources/images/Product_shoppingcart.png"></li>
							</c:if>
							<c:if test="${ empty sessionScope.loginUser }">
							<li  class="book_buy_ic_cl " id="buyNotLogin"><img id="book_add_shopCart"src="${pageContext.request.contextPath}/resources/images/Product_shoppingcart.png"></li>
							</c:if>
							
							
							<%-- <li  class="book_buy_ic_cl"><img id="book_add_gift"src="${pageContext.request.contextPath}/resources/images/Product_gift.png"></li> --%>
							<c:url value="DirectBuy.pay" var="DirectBuy">
                                <c:param name="bookTitle" value="${ bDetail.b_title }" />
                                <c:param name="bookImg" value="${bDetail.change_name}" />
                                <c:param name="bookPrice" value="${ bDetail.b_price }" /> 
                                <c:param name="bookNo" value="${bDetail.b_no}" />
                            </c:url> 
                            <c:if test="${!empty sessionScope.loginUser }">
							<li class="book_buy_cl"><a href="${DirectBuy}"><button id="book_buy_btn">구매하기</button></a></li>
							</c:if>
							<c:if test="${ empty sessionScope.loginUser }">
							<li class="book_buy_cl" id="buyNotLogin2"><button id="book_buy_btn">구매하기</button></li>
							</c:if>
						</ul>
					
					</div>
					
				</div>
			
			</div><!-- BookDeailInfo_div -->
			<div id="book_intro" class="book_info_index">
				<h3 class="book_info_index_title">책소개<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<p class="book_info_intro" id="book_intro_p"> 
					${bDetail.b_content}
				</p>
			
			
			
			</div><!-- Book_intro -->
			<div id="book_pub_intro" class="book_info_index">
				<h3 class="book_info_index_title">출판사 서평<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<p class="book_info_intro" id="book_pub_intro_p"> 
					${ bDetail.b_pub }
			
			</div><!-- Book_pub_intro -->
			
			
			<div id="book_writer" class="book_info_index">
				<h3 class="book_info_index_title">저자 소개<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<div id="book_writer_wapper">
				<h3 >${bDetail.bwp_name }</h3>
				<p class="book_info_intro" id="book_write_intro_p">	
					${ bDetail.bwp_intro }
				</p>
			</div><!--  book_writer_wapper -->
			
			</div><!-- book_writer -->
			
			<div id="book_review" class="book_info_index">
				<h3 class="book_info_index_title">리뷰</h3>
				<div class="book_review_wapper">
					<div id="review_input_left">
						<ul class="review_input_ul">
						
							<li><span class="review_avg_span">구매자 별점</span></li>
							<li><h3><fmt:formatNumber value="${ bDetail.avg_star }" pattern="#.#"/></h3></li>
							<li>
								<c:forEach var="i" begin="1" end="5">
									<c:if test="${bDetail.avg_star >= i }">
										<img src="/libreria/resources/images/Product_review_star_avg.png" class="Product_review_avr_img">
									</c:if>
									<c:if test="${ bDetail.avg_star < i  }">						
										<c:choose>
											<c:when test="${ bDetail.avg_star-i < 0 && bDetail.avg_star-i > -1 }">
												<img src="/libreria/resources/images/Product_review_star_avg_half.png" class="Product_review_avr_img">
											</c:when> 
											<c:otherwise>
												<img src="/libreria/resources/images/Product_review_star_avg_null.png" class="Product_review_avr_img">
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</li>
							
							<li><br></li>
							
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>5</span>
								<div class="review_bar"><div class="review_avg_bar" id="review_avg_bar_5"></div></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>4</span>
								<div class="review_bar"><div class="review_avg_bar" id="review_avg_bar_4"></div></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>3</span>
								<div class="review_bar"><div class="review_avg_bar" id="review_avg_bar_3"></div></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>2</span>
								<div class="review_bar"><div class="review_avg_bar" id="review_avg_bar_2"></div></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>1</span>
								<div class="review_bar"><div class="review_avg_bar" id="review_avg_bar_1"></div></div>
							</li>
						
						</ul>
					
					</div>
					<div id="review_input_right">
						<ul class="review_input_ul">
							<li><span class="review_avg_span">이 책을 평가해주세요</span></li>
							<li>
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" id="review_star_value_1" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" id="review_star_value_2" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" id="review_star_value_3" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" id="review_star_value_4" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" id="review_star_value_5" class="Product_review_input_img">	
							</li>
							<li>
								<textarea id="rev_content" name="rev_content"class="review_input_textarea_cl" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개될 수 있습니다."></textarea>
								<input id="mem_no" name="mem_no" type="hidden" value="${loginUser.mem_no}"/>
								<input type="hidden" name="rev_star" id="rev_star_input" value="0"/>
							</li>
							<li>
								<button class="review_input_btn">리뷰 남기기</button>
							</li>
						</ul>
					</div><!-- review_input-right -->
					<br>
					
					<div id="review_list_section">
						<div id="review_list_header">
						<ul class="review_list_head_select_ul_cl">
							<li class="review_list_head_left"><h3>구매자</h3></li>
							<!-- <li class="review_list_head_left"><h3>전체</h3></li> -->
							<li class="review_list_head_right">
								<ul>
									<li><span id="review_srot_old" class="review_list_select_sub_sort">오래된순</span></li>	
									<li><span id="review_srot_lastest" class="review_list_select_sub_sort">최신순</span></li>	
									<li><span id="review_star_low"class="review_list_select_sub_sort">별점 낮은순</span></li>	
									<li><span id="review_star_high" class="review_list_select_sub_sort">별점 높은순</span></li>
								</ul>
							</li>
							
						
						</ul>						
						
						</div><!-- review_list_header -->
						<div id="review_list_content">
							<c:forEach var="review" items="${ rList }">
								<c:choose>
										<c:when test="${ review.rev_star eq 1 }">
											<c:set var="avg_star1" value="${ avg_star1+1 }"/>
										</c:when>
										<c:when test="${ review.rev_star eq 2 }">
											<c:set var="avg_star2" value="${ avg_star2+1 }"/>
										</c:when>
										<c:when test="${ review.rev_star eq 3 }">
											<c:set var="avg_star3" value="${ avg_star3+1 }"/>
										</c:when>
										<c:when test="${ review.rev_star eq 4 }">
											<c:set var="avg_star4" value="${ avg_star4+1 }"/>
										</c:when>
										<c:when test="${ review.rev_star eq 5 }">
											<c:set var="avg_star5" value="${ avg_star5+1 }"/>
										</c:when>
								</c:choose>
							</c:forEach>
							<ul id="review_list_content_ul">
								<c:forEach var="review" items="${ rList }">
									<li> 
										<div id="review_list_content_left">
											<ul>
												<li>
													<c:forEach var="i" begin="1" end="5">
														<c:choose>
															<c:when test="${ i <= review.rev_star }">
																<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
															</c:when>
															<c:otherwise>
																<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" class="review_list_buyer_star">											
															</c:otherwise>
															
														</c:choose>
													</c:forEach>
												</li>
												<li>
													<span class="review_reply_writer">${review.mem_name }</span>
												</li>
												<li>
													<span class="review_reply_date">${ review.rev_date }</span>
													<button class="review_reply_report">신고</button>
												</li>
											</ul>
										</div><!-- review_list_content_left -->
										<div id="review_list_content_right">
											<ul>
												<li id="review_list_reply_content_li">
													<p id="review_list_reply_content_view">
														<input type="text" size="100" value="${ review.rev_content }" readonly class="review_content_text" id="rev_content_${ review.rev_no }">
														<input type="hidden" id="rev_no" value="${ review.rev_no }"/>
													</p>
												</li>
												<li id="review_list_reply_info_li">
													
													<div>
													<c:if test="${loginUser.mem_name eq  review.mem_name }">
														<button id="reviewDelete" class="review_list_reply_delete_btn">삭제하기</button>
														<button id="reviewUpdate" class="review_list_reply_update_btn">수정하기</button>
													</c:if>
														<%-- <button class="review_list_reply_btn"><img id="review_good_img" src="${pageContext.request.contextPath}/resources/images/Product_review_good.png"><span>0</span></button> --%>
													</div>
												</li>
											</ul>
										</div><!-- review_list_content_right -->
									</li>							
									</c:forEach>
							</ul> 
							<!-- <div id="review_list_reply_more_wapper">
								<button id="review_list_reply_more_btn">더보기</button>
							</div> -->
						</div><!-- review_list_content -->
					</div><!-- review_list_section -->
				</div> <!-- book_review_wapper -->
	
			</div><!-- book_review -->

		</div><!-- </div> content_div -->
		<br>
		<br>
		<br>
		<br>
		
 	</article>
   </section>
   
   
   <c:import url="../common/footer.jsp"></c:import>

	<script>
	$(function(){
		var avg_peo = ${bDetail.avg_star_people };
		var avg1 = ${avg_star1};
		var avg2 = ${avg_star2};
		var avg3 = ${avg_star3};
		var avg4 = ${avg_star4};
		var avg5 = ${avg_star5};
		
		var avg1_star = (avg1/avg_peo)*100;
		var avg2_star = (avg2/avg_peo)*100;
		var avg3_star = (avg3/avg_peo)*100;
		var avg4_star = (avg4/avg_peo)*100;
		var avg5_star = (avg5/avg_peo)*100;
		
		$('#review_avg_bar_1').width(avg1_star+"px");
		$('#review_avg_bar_2').width(avg2_star+"px");
		$('#review_avg_bar_3').width(avg3_star+"px");
		$('#review_avg_bar_4').width(avg4_star+"px");
		$('#review_avg_bar_5').width(avg5_star+"px");
		$('#review_srot_old').css({'color':'black','font-weigth':'1000'});
		
		var re_btn = 0;
		var star_btn = 0;
		
 		/*$('.review_list_reply_update_btn').click(function(){
			if(re_btn==1){
				//수정 한 후
				var rev_no = $(this).parent().parent().parent().find('#rev_no').val();
				var rev_content = $(this).parent().parent().parent().find('#rev_content_'+rev_no).val();
				re_btn =0;
				
				$.ajax({
					url: "reviewUpdate.bo",
					data  : {"rev_no":rev_no,"rev_content":rev_content},
					success : function(data){
						
						if(data=="success"){
							location.reload(); 
						}
					}
				})
			}else if(re_btn==0){
				console.log("update눌림");
				var rev_no = $(this).parent().parent().parent().find('#rev_no').val();
				var rev_content = $(this).parent().parent().parent().find('#rev_content_'+rev_no).val();
				$(this).parent().parent().parent().find('#review_list_reply_content_view').css({"border":"1px solid #d1d5d9"});
				$(this).parent().parent().parent().find('#rev_content_'+rev_no).attr("readonly",false);
				$(this).text("수정완료");
				re_btn = 1;
			};
		}); */
		
		$(document).on('click','.review_list_reply_update_btn',function(){
	 		if(re_btn==1){
			//수정 한 후
				var rev_no = $(this).parent().parent().parent().find('#rev_no').val();
				var rev_content = $(this).parent().parent().parent().find('#rev_content_'+rev_no).val();
				re_btn =0;
				
				$.ajax({
					url: "reviewUpdate.bo",
					data  : {"rev_no":rev_no,"rev_content":rev_content},
					success : function(data){
						
						if(data=="success"){
							location.reload(); 
						}
					}
				})
			}else if(re_btn==0){
				var rev_no = $(this).parent().parent().parent().find('#rev_no').val();
				var rev_content = $(this).parent().parent().parent().find('#rev_content_'+rev_no).val();
				$(this).parent().parent().parent().find('#review_list_reply_content_view').css({"border":"1px solid #d1d5d9"});
				$(this).parent().parent().parent().find('#rev_content_'+rev_no).attr("readonly",false);
				$(this).text("수정완료");
				re_btn = 1;
			};
		});
		
		

	
		$(document).on('click','.review_list_reply_delete_btn',function(){
			swal({
   				title: "",
   				text: "해당 댓글을 삭제하시겠습니까?",
   				icon: "warning",
   				buttons: ["취소","삭제"],
   				dangerMode: true})
   			.then((ok)=>{
   				if(ok){
   					var rev_no = $(this).parent().parent().parent().find('#rev_no').val();
   					
   					$.ajax({
   						url: "reviewDelete.bo",
   						data  : {"rev_no":rev_no},
   						success : function(data){
   							if(data=="success"){
   								location.reload();
   							}
   						}
   					})
   	   	   		
   				}
   			});
			
			
		});
		
		$('.review_input_btn').click(function(){
			//별점에 대한 평점을 먼저 주어야함 
			var b_no = ${bDetail.b_no};
			var mem_no = $('#mem_no').val();
			var rev_star = $('#rev_star_input').val();
			var rev_content = $('#rev_content').val();
			
			
			
			
			if(mem_no != ""){
				if(rev_content == ""){
					swal("평점 등록 에러","내용을 작성해주세요.","error");
				}else{
				
				$.ajax({
					url: "reviewInsert.bo",
					data : {"b_no":b_no,"mem_no":mem_no,"rev_star":rev_star,"rev_content":rev_content},
					success : function(data){
						if(data=="success"){
							location.reload(); 
						}
					}
				})
				}
			}else{
				swal("평점 등록 에러","로그인 후 사용해주시길 바랍니다.","error");
			};
			
		});
	
		$('#review_star_value_1').hover(function(){
			if(star_btn ==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			}
		},function(){
			if(star_btn ==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			}
		}).click(function(){
			$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			star_btn = 1;
			$('#rev_star_input').val("1");
		});
		
		
		$('#review_star_value_2').hover(function(){
			if(star_btn ==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			}
		},function(){
			if(star_btn ==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			}
		}).click(function(){
			$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			star_btn = 1;
			$('#rev_star_input').val("2");
		});
		
		
		$('#review_star_value_3').hover(function(){
			if(star_btn ==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			}
		},function(){
			if(star_btn==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			}else if(star_btn==1){
				/* $('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png"); */
			}
		}).click(function(){
			$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			star_btn = 1;
			$('#rev_star_input').val("3");
		});
		
		
		
		$('#review_star_value_4').hover(function(){
			if(star_btn==0){	
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			}
		},function(){
			if(star_btn==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			}else if(star_btn==1){
				/* $('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png"); */
			}
		}).click(function(){
			$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			star_btn = 1;
			$('#rev_star_input').val("4");
		});
		
		$('#review_star_value_5').hover(function(){
			if(star_btn==0){	
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			}
			
		},function(){
			if(star_btn==0){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				
			}else if(star_btn==1){
				/* $('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png"); */
				
			}
			
		}).click(function(){
			$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			star_btn = 1;
			$('#rev_star_input').val("5");
		});
		
		
		
			/* $('#review_star_value_5').click(function(){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
	
			}).mouseover(function(){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
				$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png");
			}).mouseout(function(){
				$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
				$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			}); */
		
		/* ,function(){
			$('#review_star_value_1').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_2').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_3').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_4').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
			$('#review_star_value_5').attr("src","${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png");
		} );*/
		
		
		$('#review_srot_lastest').click(function(){
			var b_no = ${bDetail.b_no};
			$('#review_star_high').css({'color':'#808991','font-weigth':'700'});
			$('#review_srot_lastest').css({'color':'black','font-weigth':'1000'});
			$('#review_srot_old').css({'color':'#808991','font-weigth':'700'});
			$('#review_star_low').css({'color':'#808991','font-weigth':'700'});
			$.ajax({
				url: "reviewSortLastest.bo",
				data : {"b_no":b_no},
				success : function(data){
						$('#review_list_content_ul').empty();
						var mydata = '';
						var star = '';
						var loginName = $('#login_name').val();
						var re_del_btn = '';
						
						for(i=0;i<data.length;i++){
							re_del_btn = '';
							star = '';
							if(data[i].mem_name == loginName  ){
								re_del_btn = '<button id="reviewDelete" class="review_list_reply_delete_btn">삭제하기</button> <button id="reviewUpdate" class="review_list_reply_update_btn">수정하기</button>';
							}
							
							
							for(var a=1; a<=5; a++){
								
								if(a <= data[i].rev_star){
									star = 	star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">';			
								}else{
									star = star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" class="review_list_buyer_star">';					
								}
							}
							mydata = mydata+'<li><div id="review_list_content_left"><ul><li>'+
							star+ 
							'<li><span class="review_reply_writer">'+data[i].mem_name+'</span></li><li><span class="review_reply_date">'+
							data[i].rev_date+
							'</span> <button class="review_reply_report">신고</button></li></ul></div>'+
							'<div id="review_list_content_right"><ul><li id="review_list_reply_content_li"><p id="review_list_reply_content_view"><input type="text" size="100" value="'+data[i].rev_content+'"'+
							'readonly class="review_content_text" id="rev_content_'+data[i].rev_no+'">'+
							'<input type="hidden" id="rev_no" value="'+data[i].rev_no+'"/></p></li><li id="review_list_reply_info_li"><div>'+
							re_del_btn+	
							/* ' <button class="review_list_reply_btn"><img id="review_good_img" src="${pageContext.request.contextPath}/resources/images/Product_review_good.png"><span>0</span></button>'+ */
							'</div></li></ul></div></li>';
						}
						
						$('#review_list_content_ul').append(mydata); 
				}
			})
			 
		});
		$('.intro_plus').click(function(){
			var p = $(this).parent().parent().find('.book_info_intro');
			p.css("max-height","100%");
		})
		$('#review_srot_old').click(function(){
			var b_no = ${bDetail.b_no};
			$('#review_star_high').css({'color':'#808991','font-weigth':'700'});
			$('#review_srot_lastest').css({'color':'#808991','font-weigth':'700'});
			$('#review_srot_old').css({'color':'black','font-weigth':'1000'});
			$('#review_star_low').css({'color':'#808991','font-weigth':'700'});
			$.ajax({
				url: "reviewSortOld.bo",
				data : {"b_no":b_no},
				success : function(data){
						$('#review_list_content_ul').empty();
						var mydata = '';
						var star = '';
						var loginName = $('#login_name').val();
						var re_del_btn = '';
						
						for(i=0;i<data.length;i++){
							re_del_btn = '';
							star = '';
							if(data[i].mem_name == loginName  ){
								re_del_btn = '<button id="reviewDelete" class="review_list_reply_delete_btn">삭제하기</button> <button id="reviewUpdate" class="review_list_reply_update_btn">수정하기</button>';
							}
							
							
							for(var a=1; a<=5; a++){
								
								if(a <= data[i].rev_star){
									star = 	star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">';			
								}else{
									star = star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" class="review_list_buyer_star">';					
								}
							}
							mydata = mydata+'<li><div id="review_list_content_left"><ul><li>'+
							star+ 
							'<li><span class="review_reply_writer">'+data[i].mem_name+'</span></li><li><span class="review_reply_date">'+
							data[i].rev_date+
							'</span> <button class="review_reply_report">신고</button></li></ul></div>'+
							'<div id="review_list_content_right"><ul><li id="review_list_reply_content_li"><p id="review_list_reply_content_view"><input type="text" size="100" value="'+data[i].rev_content+'"'+
							'readonly class="review_content_text" id="rev_content_'+data[i].rev_no+'">'+
							'<input type="hidden" id="rev_no" value="'+data[i].rev_no+'"/></p></li><li id="review_list_reply_info_li"><div>'+
							re_del_btn+	
							/* ' <button class="review_list_reply_btn"><img id="review_good_img" src="${pageContext.request.contextPath}/resources/images/Product_review_good.png"><span>0</span></button>'+ */
							'</div></li></ul></div></li>';
						}
						
						$('#review_list_content_ul').append(mydata); 
				}
			})
			 
		});
		$('#review_star_high').click(function(){
			var b_no = ${bDetail.b_no};
			$('#review_star_high').css({'color':'black','font-weigth':'1000'});
			$('#review_srot_lastest').css({'color':'#808991','font-weigth':'700'});
			$('#review_srot_old').css({'color':'#808991','font-weigth':'700'});
			$('#review_star_low').css({'color':'#808991','font-weigth':'700'});
			
			$.ajax({
				url: "reviewSortStarH.bo",
				data : {"b_no":b_no},
				success : function(data){
						$('#review_list_content_ul').empty();
						var mydata = '';
						var star = '';
						var loginName = $('#login_name').val();
						var re_del_btn = '';
						
						for(i=0;i<data.length;i++){
							re_del_btn = '';
							star = '';
							if(data[i].mem_name == loginName  ){
								re_del_btn = '<button id="reviewDelete" class="review_list_reply_delete_btn">삭제하기</button> <button id="reviewUpdate" class="review_list_reply_update_btn">수정하기</button>';
							}
							
							
							for(var a=1; a<=5; a++){
								
								if(a <= data[i].rev_star){
									star = 	star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">';			
								}else{
									star = star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" class="review_list_buyer_star">';					
								}
							}
							mydata = mydata+'<li><div id="review_list_content_left"><ul><li>'+
							star+ 
							'<li><span class="review_reply_writer">'+data[i].mem_name+'</span></li><li><span class="review_reply_date">'+
							data[i].rev_date+
							'</span> <button class="review_reply_report">신고</button></li></ul></div>'+
							'<div id="review_list_content_right"><ul><li id="review_list_reply_content_li"><p id="review_list_reply_content_view"><input type="text" size="100" value="'+data[i].rev_content+'"'+
							'readonly class="review_content_text" id="rev_content_'+data[i].rev_no+'">'+
							'<input type="hidden" id="rev_no" value="'+data[i].rev_no+'"/></p></li><li id="review_list_reply_info_li"><div>'+
							re_del_btn+	
							/* ' <button class="review_list_reply_btn"><img id="review_good_img" src="${pageContext.request.contextPath}/resources/images/Product_review_good.png"><span>0</span></button>'+ */
							'</div></li></ul></div></li>';
						}
						
						$('#review_list_content_ul').append(mydata); 
				}
			})
			 
		});
			

		$('#review_star_low').click(function(){
			var b_no = ${bDetail.b_no};
			$(this).css({'color':'black','font-weigth':'1000'});
			$('#review_srot_lastest').css({'color':'#808991','font-weigth':'700'});
			$('#review_srot_old').css({'color':'#808991','font-weigth':'700'});
			$('#review_star_high').css({'color':'#808991','font-weigth':'700'});
			
			$.ajax({
				url: "reviewSortStarL.bo",
				data : {"b_no":b_no},
				success : function(data){
						$('#review_list_content_ul').empty();
						var mydata = '';
						var star = '';
						var loginName = $('#login_name').val();
						var re_del_btn = '';
						
						for(i=0;i<data.length;i++){
							re_del_btn = '';
							star = '';
							if(data[i].mem_name == loginName  ){
								re_del_btn = '<button id="reviewDelete" class="review_list_reply_delete_btn">삭제하기</button> <button id="reviewUpdate" class="review_list_reply_update_btn">수정하기</button>';
							}
							
							
							for(var a=1; a<=5; a++){
								
								if(a <= data[i].rev_star){
									star = 	star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">';			
								}else{
									star = star+' <img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg_null.png" class="review_list_buyer_star">';					
								}
							}
							mydata = mydata+'<li><div id="review_list_content_left"><ul><li>'+
							star+ 
							'<li><span class="review_reply_writer">'+data[i].mem_name+'</span></li><li><span class="review_reply_date">'+
							data[i].rev_date+
							'</span> <button class="review_reply_report">신고</button></li></ul></div>'+
							'<div id="review_list_content_right"><ul><li id="review_list_reply_content_li"><p id="review_list_reply_content_view"><input type="text" size="100" value="'+data[i].rev_content+'"'+
							'readonly class="review_content_text" id="rev_content_'+data[i].rev_no+'">'+
							'<input type="hidden" id="rev_no" value="'+data[i].rev_no+'"/></p></li><li id="review_list_reply_info_li"><div>'+
							re_del_btn+	
							/* ' <button class="review_list_reply_btn"><img id="review_good_img" src="${pageContext.request.contextPath}/resources/images/Product_review_good.png"><span>0</span></button>'+ */
							'</div></li></ul></div></li>';
						}
						
						$('#review_list_content_ul').append(mydata); 
				}
			})
			 
		});
		
		
		
		
	
	});
	
	
	</script>
	<script>
	//민혁님 부분 스크립트 
	$('#basket').on('click',function(){
	   console.log("클릭");
	   //var bookNum = $('#b_no').val();
	   var bookNum = ${bDetail.b_no};
	   //addReply.bo ==>'success'
	   $.ajax({
	      url:'payment.pay',
	      data:{bookNum : bookNum},
	      type:"get",
	      success:function(data){
	         if(data == "seccessInsert"){
	            swal ( "장바구니 추가" ,  "장바구니에 추가되었습니다." ,  "success" );
	         }
	         if(data == "seccessDelete"){
		            swal ( "장바구니 삭제" ,  "장바구니에 삭제되었습니다." ,  "error" );
		         }
	      }
	   })
	});

	$('#buyNotLogin').click(function(){
		swal ( "접근불가" ,  "로그인 후 사용 가능합니다." ,  "error" )
	});
	$('#buyNotLogin2').click(function(){
		swal ( "접근불가" ,  "로그인 후 사용 가능합니다." ,  "error" )
	});

</script>


</body>
</html>
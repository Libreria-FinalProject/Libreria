<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
						<p class="book_writer_pub">${bDetail.bwp_name } <span> 저</span></p>
						<p class="book_writer_pub">${ bDetail.b_pub_name } <span> 출판</span></p>
					</div>
					<div id="book_detail_buy_buttom">
						<h3 class="book_detail_title" style="color: #1f8ce6;"><fmt:formatNumber value="${ bDetail.b_price }"/>원</h3>
						<ul>
							<li class="book_buy_ic_cl"><img id="book_add_heart"src="${pageContext.request.contextPath}/resources/images/Product_heart.png"></li>
							<li  class="book_buy_ic_cl "  onclick="location.href='payment.pay'"><img id="book_add_shopCart"src="${pageContext.request.contextPath}/resources/images/Product_shoppingcart.png"></li>
							<li  class="book_buy_ic_cl"><img id="book_add_gift"src="${pageContext.request.contextPath}/resources/images/Product_gift.png"></li>
							<c:url value="DirectBuy.pay" var="DirectBuy">
                                <c:param name="bookTitle" value="bookName" />
                                <c:param name="bookImg" value="1" />
                                <c:param name="bookPrice" value="10000" /> 
                                <c:param name="bookNo" value="5" />
                            </c:url> 
                    		 <li class="book_buy_cl"><a href="${DirectBuy}"><button id="book_buy_btn">구매하기</button></a></li>
						</ul>
					
					</div>
					
				</div>
			
			</div><!-- BookDeailInfo_div -->
			<div id="book_intro" class="book_info_index">
				<h3 class="book_info_index_title">책소개<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<p class="book_info_intro" id="book_info"> 
					${bDetail.b_content}
				</p>
			
			
			
			</div><!-- Book_intro -->
			<div id="book_pub_intro" class="book_info_index">
				<h3 class="book_info_index_title">출산사 서평<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<p class="book_info_intro"> 
					${ bDetail.b_pub }
			
			</div><!-- Book_pub_intro -->
			
			
			<div id="book_writer" class="book_info_index">
				<h3 class="book_info_index_title">저자 소개<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<div id="book_writer_wapper">
				<h3 >${bDetail.bwp_name }</h3>
				<p class="book_info_intro" 	>	
					세계적인 미래연구기구 ‘밀레니엄 프로젝트’의 한국 지부 (사)유엔미래포럼 대표. 20년 동안 주한 영국대사관, 10년간 호주대사관 수석보좌관으로 활동했으며, 세계인공일반지능협회, 코딩없는세상 인공지능플랫폼 WEM, 테크캐스트 글로벌 등 20여 개 글로벌 미래연구기구의 한국 대표로 있다. 현재 청와대일자리위원회 위원, 육군미래혁신자문위원, 2030 부산월드엑스포 범시민유치위원, 건설교통부 도로정책심의위원, 블록체인AI 뉴스 편집인으로 활동하고 있다. 미국 AI 분야의 대가로 불리는 전(前) 미국과학재단 NSF AI 연구 프로그램 디렉터인 폴 워보스(Paul Werbos) 박사, 비트코인 재단의 브록피어스(Brogk Pierce) 회장, 라이트하우스원 CEO이자 실리콘밸리의 거인인 피터 허시버그(Peter Hirshberg) 회장, 싱귤래리티넷, 인공일반지능협회 및 오픈코그재단의 벤 고르첼(Ben Goertzel) 회장과 존스홉킨스대학교의 스타트업 인실리코 메디슨의 CEO 알렉스 자보론코프(Alex Zhavoronkov)와 함께 블록체인과 미래예측에 관한 연구를 진행하고 있다. 또한 미국 기회특구를 디자인하는 MIT 미디어랩의 존 클리핑거(John Clippinger) 박사와 세계적 블록체인AI 기업 비트퓨리의 발레리 바빌로프(Valery Vavilov) 회장, 스탠퍼드대학교 교수이자 태양광 에너지 전문가인 토니 세바(Tony Seba) 리싱크X 대표 등과 교류하며 해외의 미래예측을 가장 발 빠르게 국내에 소개하고 있다.<br>
					경북대학교에서 프랑스어를 전공했고 미국 서던캘리포니아대학교에서 교육학 석사를, 성균관대학교에서 사회복지학 박사과정을 수료했다. 2006년부터 연세대학교 실내건축학과에서 미래예측에 대해 강의하고 있다. 그 밖에도 전국 대학을 비롯해 교육과학부, 기획재정부, 산업통상자원부 등의 정부 부처와 KBS, EBS, 국내외 기업 등에서 미래예측에 대해 강연을 하고 있다. 미래의 필연적인 메가트렌드와 일자리의 변화, 그에 따른 교육의 방향, 사회, 과학기술 등 거의 모든 분야에서 명쾌한 미래 뉴스를 전달하기 위해 해마다 미래예측서를 발표하고 있다. 저서로는 《세계미래보고서》 시리즈를 비롯해 《블록체인 혁명 2030》, 《주거혁명 2030》, 《일자리 혁명 2030》, 《메이커의 시대》, 《인공지능 혁명 2030》(공저) 등 다수가 있다.<br>
					  <br>
					제롬 글렌(Jerome Glenn)<br>
					밀레니엄 프로젝트 회장, 세계미래연구기구협의회 회장으로 있다. 지난 40년간 정치, 교육, 과학, 산업, 정부 등의 미래를 연구했고 &lt;뉴욕 타임스&gt;를 비롯한 여러 매체에 미래예측 글을 기고하고 있다. CIA 2020 리포트와 미국 주요 기관의 미래 프로젝트에 참가했으며 한국을 여러 차례 방문하여 급변하는 미래의 다양한 가능성을 정부와 기업인들에게 제시한 바 있다.
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
							<div id="review_list_reply_more_wapper">
								<button id="review_list_reply_more_btn">더보기</button>
							</div>
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
		$('.review_list_reply_update_btn').click(function(){
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
		});
		
		
		
		

	
	
		$('.review_list_reply_delete_btn').click(function(){
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
		})

		$('.review_input_btn').click(function(){
			//별점에 대한 평점을 먼저 주어야함 
			var b_no = ${bDetail.b_no};
			var mem_no = $('#mem_no').val();
			var rev_star = $('#rev_star_input').val();
			var rev_content = $('#rev_content').val();
			
			if(rev_star!=0){
				$.ajax({
					url: "reviewInsert.bo",
					data : {"b_no":b_no,"mem_no":mem_no,"rev_star":rev_star,"rev_content":rev_content},
					success : function(data){
						if(data=="success"){
							location.reload(); 
						}
					}
				})
			}else{
				console.log("별점 및 내용을 작성하세요");
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
	$('#Basket').on('click',function(){
	   
	   var bookNum = $('#b_no').val();
	   
	   //addReply.bo ==>'success'
	   $.ajax({
	      url:'payment.pay',
	      data:{bookNum : bookNum},
	      type:"get",
	      success:function(data){
	         if(data == "success"){
	            alert("complate");
	         }
	      }
	   })
	});


</script>


</body>
</html>
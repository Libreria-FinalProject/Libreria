<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/book/bookDetailPage.css"/>
<style type="text/css">


   
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
 	<article>
 	
		<div id="content_div">
			<div id="book_detail_info">
				<!-- 책 이미지 -->
				<div id="book_tumbnail">
					<img src="${bDetail.file_path}${bDetail.change_name}" id="book_tumbnail_img">
				</div>				
				
				
				
				<!-- 책 설명 부분 div -->
				<div id="book_detail_head_wapper">	
					<div>
						<p id="book_detail_cate_info">소설  > 기타 국가 소설 </p>
						<h3 class="book_detail_title">${ bDetail.b_title }</h3>
					</div>
					<div id="book_detail_head_middle">
						<p>☆☆☆☆☆ 0점 <span>(5명)</span></p>
						<br>
						<p class="book_writer_pub">${bDetail.bwp_name } <span> 저</span></p>
						<p class="book_writer_pub">${ bDetail.b_pub_name } <span> 출판</span></p>
					</div>
					<div id="book_detail_buy_buttom">
						<h3 class="book_detail_title" style="color: #1f8ce6;">${bDtail.b_price }</h3>
						<ul>
							<li class="book_buy_ic_cl"><img id="book_add_heart"src="${pageContext.request.contextPath}/resources/images/Product_heart.png"></li>
							<li  class="book_buy_ic_cl"><img id="book_add_shopCart"src="${pageContext.request.contextPath}/resources/images/Product_shoppingcart.png"></li>
							<li  class="book_buy_ic_cl"><img id="book_add_gift"src="${pageContext.request.contextPath}/resources/images/Product_gift.png"></li>
							<li class="book_buy_cl"><button id="book_buy_btn">구매하기</button></li>
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
							<li><h3>5.0</h3></li>
							<li>
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_avr_img">
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_avr_img">
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_avr_img">
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_avr_img">
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_avr_img">
							</li>
							
							<li><br></li>
							
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>5</span>
								<div class="review_bar"></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>4</span>
								<div class="review_bar"></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>3</span>
								<div class="review_bar"></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>2</span>
								<div class="review_bar"></div>
							</li>
							<li>
								<span class="review_star_span"><img src="${pageContext.request.contextPath}/resources/images/Product_review_star.png" class='reivew_star_img'>1</span>
								<div class="review_bar"></div>
							</li>
						
						</ul>
					
					</div>
					<div id="review_input_right">
						<ul class="review_input_ul">
							<li><span class="review_avg_span">이 책을 평가해주세요</span></li>
							<li>
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_input_img">	
								<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="Product_review_input_img">	
							</li>
							<li>
								<textarea class="review_input_textarea_cl" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개될 수 있습니다."></textarea>
							
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
							<li class="review_list_head_left"><h3>전체</h3></li>
							<li class="review_list_head_right">
								<ul>
									<li><span class="review_list_select_sub_sort">최신순</span></li>	
									<li><span class="review_list_select_sub_sort">공감순</span></li>	
									<li><span class="review_list_select_sub_sort">별점 높은순</span></li>	
									<li><span class="review_list_select_sub_sort">별점 낮은순</span></li>
								</ul>
							</li>
							
						
						</ul>						
						
						</div><!-- review_list_header -->
						<div id="review_list_content">
							<ul id="review_list_content_ul">
								<li> 
									<div id="review_list_content_left">
										<ul>
											<li>
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
											</li>
											<li>
												<span class="review_reply_writer">작성자</span>
											</li>
											<li>
												<span class="review_reply_date">2020-10-29</span>
												<button class="review_reply_report">신고</button>
											</li>
										</ul>
									</div><!-- review_list_content_left -->
									<div id="review_list_content_right">
										<ul>
											<li id="review_list_reply_content_li">
												<p id="review_list_reply_content_view">
													세계최고의 작품이라고 생각합니다. 여러방면으로 생각할 수  있는 기회를 주어주고 오늘 점심 뭐먹지 뭐먹으라끼? 저녁은 뭐dasd먹지 술은 뭘먹지sadsa?
													dasdasd
													<br>
												</p>
											</li>
											<li id="review_list_reply_info_li">
												<div>
													<button class="review_list_reply_btn">삭제하기</button>
													<button class="review_list_reply_btn">수정하기</button>
													<button class="review_list_reply_btn"><img id="review_good_img" src="${pageContext.request.contextPath}/resources/images/Product_review_good.png"><span>0</span></button>
												</div>
											</li>
										</ul>
									</div><!-- review_list_content_right -->
								</li>
								
								<li> 
									<div id="review_list_content_left">
										<ul>
											<li>
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
												<img src="${pageContext.request.contextPath}/resources/images/Product_review_star_avg.png" class="review_list_buyer_star">
											</li>
											<li>
												<span class="review_reply_writer">작성자</span>
											</li>
											<li>
												<span class="review_reply_date">2020-10-29</span>
												<button class="review_reply_report">신고</button>
											</li>
										</ul>
									</div><!-- review_list_content_left -->
									<div id="review_list_content_right">
										<ul>
											<li id="review_list_reply_content_li">
												<p id="review_list_reply_content_view">
													세계최고의 작품이라고 생각합니다. 여러방면으로 생각할 수  있는 기회를 주어주고 오늘 점심 뭐먹지 뭐먹으라끼? 저녁은 뭐dasd먹지 술은 뭘먹지sadsa?
													dasdasd
													<br>
												</p>
											</li>
											<li id="review_list_reply_info_li">
												<div>
													<button class="review_list_reply_btn">삭제하기</button>
													<button class="review_list_reply_btn">수정하기</button>
													<button class="review_list_reply_btn"><img id="review_good_img" src="${pageContext.request.contextPath}/resources/images/Product_review_good.png"><span>0</span></button>
												</div>
											</li>
										</ul>
									</div><!-- review_list_content_right -->
								</li>
								
							
							
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





</body>
</html>
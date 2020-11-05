<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  	
 
   @import url(http://fonts.google.com/earlyaccess/nanumgothic.css);
  
  
   *{
      margin: 0px;
      padding: 0px;
      font-family: 'Nanum Gothic';
      outline:0;
   }
   section{
      margin: 0 auto;
      width:1000px;

   }
   #nav_container{
      height: 170px;
      background-color: rgb(94, 107, 159);
      border: none;
      border-radius: 0px;
      vertical-align: middle;
   }
   #nav_body{
   
       padding-top: 40px;
       width: 1000px;
       margin: 0px auto;
   }
   #a_brand{
      font-family: "Arial Black";
      font-weight: bold;
      font-size:33px;
      color: rgb(255, 255, 255);
      text-decoration: none;
   }
   #input_search{
      margin-left: 15px;
      padding: 6px 12px;
       width: 300px;
       height: 100%;
       background: #fff;
       border: 1px solid #ccc;
       border-radius: 4px;
       font-size: 14px;
       vertical-align: super;
   }
   #div_head_btns{
      display: inline;
      margin-left: 285px;
   }
   .btn_head{
      vertical-align: inherit;
       background-color: rgb(60, 68, 101);
       color:white;
       border: none;
       border-radius: 5px;
       font-weight: bold;
       font-size: 15px;
       width: 90px;
       height: 35px;   
   }
   .btn_head:hover{
      cursor: pointer;
   }
   
   #nav_menu{
      height: 40px;
      background-color: #ffffff;
      margin-top: 43px;
      border-bottom: 1px solid #e6e6e6;
   }
   #menu_ul{
      width:1000px;
      margin: 0 auto;
   }
   #menu_ul > li{
      list-style: none;
      float: left;
      margin: 5px 30px 0px 30px;
      font-size: 20px;
      font-weight: bold;
   }
   #menu_li{
      background-image: url("images/menu-symbol.png");
      background-repeat: no-repeat;
      background-size: contain;
      width: 28px;
       height: 26px;
       margin: 5px 0px !important;
   }
   #footer_container{
      background-color: rgb(48, 53, 56);
      height:150px;
      color: #ffffff;
   }   
   #footer_container > div{
      margin: 0 auto;
      padding-top: 50px;
      width:1000px;
      
   }
   
   #footer_container > div >span {
      padding: 10px;
   }
   
   
   /* book_detail */
   #book_detail_info{
   letter-spacing:-1px;
   		width:1000px;
   		height: 350px;
   		/* border: 1px solid; */
   		padding: 40px 29px;
   
   }
   
   #book_tumbnail{
   		width: 200px;
   		height: 300px;
   		display: inline-block;
   }
   #book_tumbnail_img{

	   	display: block;
	    left: 0;
	  	top: 0;
	  	width: 100%;
	  	height: 100%;
   
   }
   #book_detail_head_wapper{
   	display: inline-block;
   	width: 750px;
    float: right;
   }
   #book_detail_cate_info{
   	 font-size: 14px;
   	 color: #333;
   	
   }
   
   .book_detail_title{
   
   	font-size: 30px;
    line-height: 1.3em;
    color: #333;
    font-weight: 700;
    word-break: keep-all;
    margin-top: 12px;
    margin-bottom:12px;
    display: inline-block;
   
  
   }
   
   #book_detail_head_middle{
   		margin: 20px 0;
   		color: #666;
   		font-size: 15px;
   		line-height: 1em;
   }
   .book_writer_pub{
   		font-size: 13px;
    	color: #666;
	    line-height: 1em;
	    font-weight: 700;
	    cursor: pointer;
	    margin-bottom:15px;
   
   }
   .book_writer_pub>span{
   		font-weight: normal;
   
   }
   
   #book_detail_buy_buttom{
   		padding-top:60px;
   }
   
    #book_detail_buy_buttom>ul{
    	float:right;
    	list-style: none;
    	
    }
 
   .book_buy_ic_cl{
   	width: 40px;
   	height: 40px;
   	background-repeat: no-repeat;
    background-size: contain;
    float:left;
	margin-right:15px;  

    padding:10px;
    text-align: center;
    border : 1px solid #808991;
	cursor: pointer;
	border-radius: 10px;
   }
   #book_add_heart{
   		width:30px;
   		height:30px;
   		opacity: 0.6;
   		position: relative;
   		top: 4px;
   		border: -2px solid ;
   		
   }
   
   #book_add_shopCart{
  		 width:30px;
   		height:30px;
   		opacity: 0.6;
   		position: relative;
   		top: 4px;
   		left:2px;
   		border: -2px solid ;
   }
   #book_add_gift{
   		width:30px;
   		height:30px;
   		opacity: 0.6;	
   		position: relative;
   		top: 2px;
   		border: -2px solid ;
   }
   
   #book_add_buy{
   	width: 100px;
   	text-align:center;
   	margin-right:30px;
   	margin-left:30px;
   	
   
   }
   
   #book_buy_btn{
   	border :none;
   	width: 130px;
   	height: 60px;
   	font-size: 15px;
   	background-color: rgb(94, 107, 159);
   	color:white;
   	cursor: pointer;
   	    font-weight: bold;
    letter-spacing: -1px;
    border-radius:5px;
   }
	.book_buy_cl{
		float:left;
		cursor: pointer;
		margin-right: 60px;
		
	}
	.intro_plus{
		width: 30px;
		height: 30px;
		float: right;
		text-align: center;
		 border: 2px solid #5e6b9f; 
		 border-radius:5px;
		/* border:none; */
		cursor: pointer;
		background: white;
		
		
	}
	
	.book_info_index{
		    padding: 0px 29px;
		    margin-bottom:20px;
		    
	
	}
	.book_info_index_title{
	font-size: 20px;
    color: #59667a;
    font-weight: 700;
    letter-spacing: -.03em;
    padding-bottom:10px;
    border-bottom: 2px solid #808991;
    
	
	}
	
	.book_info_intro{
		line-height: 1.8em;
    	font-size: 13px;
    	color: #333;
    	word-break: keep-all;
    	margin-top:15px;
    	overflow: hidden;
    	height: 185px;
    	letter-spacing:-1px;
	
	}
	
	#book_writer_wapper{
		margin-top:15px;
		letter-spacing:-1px;
	
	}
	.book_review_wapper{
	
	
	}
	#review_input_left{
	
		display: table-cell;
    	width: 150px;
    	padding: 32px 0 20px 0;
   		 text-align: center;
   		 cursor: default;
	}
	#review_input_right{
		display: table-cell;
   		 vertical-align: top;
   		 width: 1000px;
   		 text-align: center;
   		 padding-top:20px;
		padding-left:10%;
	}
	
	
	.Product_review_avr_img{
		width:20px;
		height: 20px;
		
	}
	.Product_review_input_img{
		width: 50px;
		height: 50px;
		
		
	}
	.review_bar{
		width: 100px;
		height: 10px;
		border: none;
		background:#e8edf3;
		display: inline-block;
	
	}
	.review_input_ul{
		list-style: none;
	}
	.reivew_star_img{
		width: 15px;
		height:15px;
		opacity: 0.6;
	
	}
	.review_star_span{
		font-size:15px;
		margin-top: 8px;
    	color: #808991;
		
	
	}
	.review_avg_span{
		font-size: 12px;
	    color: #808991;
	    font-weight: 600;
	}
	.review_input_textarea_cl{
		    border: 2px solid #d1d5d9;
		    border-radius: 5px;
		    box-sizing: border-box;
		    width: 100%;
		    height: 120px;
		    font-weight: 700;
		    letter-spacing: -1px;
		    color: #a7b1bb;
		    padding: 12px 15px;
		    resize: vertical;
		    font-size: 15px;
		    
	
	}
	.review_input_btn{
		float:right;
		width: 100px;
		height: 35	px;
		border-radius:5px;
		background: #8fc6f3;
    	border: 1px solid #0077d9;
    	box-shadow: 0 1px 1px 0 rgba(31,140,230,.3);
    	color:#fff;
    	font-size: 12px;
   		 padding: 8px 18px;
   		 font-weight: 700;
    display: inline-block;
    text-align: center;
    letter-spacing: -1px;
	}
	.review_list_section{
		margin-top:15px;
		
	}
	.review_list_head_select_ul_cl{
		list-style: none;
		
	}
	
	
	.review_list_head_left{
		float:left;
		margin-right:15px;
	}
	
	#review_list_header{
		width:100%;
		height:30px;
		border-bottom:2px solid #808991;
	
	}
	.review_list_head_right>ul{
		float:right;
		list-style:none;
	}
	.review_list_head_right>ul>li{
		float:right;
		margin-right:10px;
	
	}
	.review_list_select_sub_sort{
		font-size: 12px;
    font-weight: 700;
    color: #808991;
    cursor: pointer;
	}
	
	#review_list_content_ul{
		list-style: none;
		margin-top:12px;
		
	
	}
	#review_list_content_ul>li{
		border-bottom: 1px solid #d1d5d9;
		
	}
	#review_list_content_left{
		display: table-cell;
		width: 150px;
	}
	#review_list_content_right{
		display: table-cell;
		width:850px;
		vertical-align: top;
	
	}

	
	#review_list_content_left>ul{
		padding: 1px 10px;
		list-style: none;
		text-align: left;
		margin-top: 12px;
  		margin-bottom: 12px;
	}
	.review_list_buyer_star{
		    width: 15px;
    		height: 15px;
    		margin-right: -7px;
	}
	.review_reply_writer{
		    font-size: 12px;
		    font-weight: 700;
		    color: #212529
	}
	.review_reply_date{
			 font-size: 12px;
		    font-weight: 700;
		    color: #808991;
		    line-height: 16px;
	}
	
	.review_reply_report{
		color: #808991;
	    font-size: 12px;
	    line-height: 16px;
	    border: none;
	    background:white;
	    cursor: pointer;
	
	}
	
	#review_list_content_right>ul{
		list-style: none;
		text-align: left;
  		margin-top: 12px;
  		margin-bottom: 12px;
	}
	#review_list_reply_content_li{
		width: 95%;
		display:inline-block;
		min-height:30px;
		padding-bottom: 10px;
		padding:3px 3px;
		padding-right: 20px;
   		
		
	}
	#review_list_reply_content_view{
		font-size: 13px;
   		color: #212529;
   		line-height: 1.7em;
   		word-break: break-all;
	
	}
	#review_list_reply_info_li{
		float:right;
		padding-right: 20px;
		margin-bottom:10px;
	
	}	
	#review_good_img{
	
		width: 15px;
		height: 15px; 
		margin-right: 5px;
	}
	.review_list_reply_btn{
		width: 80px;
		height: 30px;
		color: #808991;
	    background: #fff;
	    border: 1px solid #d1d5d9;
	    border-radius: 4px;
	    font-weight: 700;
	    display: inline-block;
	    text-align: center;
	    cursor: pointer;
		
	}
	#review_list_reply_more_wapper{
		
		margin-top:15px;
	}
	
	#review_list_reply_more_btn{

		height: 40px;
		
		display: block;
   		width: 100%;
    	border: 2px solid #d1d5d9;
    	background: #fff;
    	border-radius: 3px;
    	text-align: center;
    	color: #1f8ce6;
    	font-size: 13px;
    	font-weight: bold;
    	cursor: pointer;
    	outline:0;
		
	}
	
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
					<img src="${pageContext.request.contextPath}/resources/images/book_cover.bmp" id="book_tumbnail_img">
				</div>				
				
				
				
				<!-- 책 설명 부분 div -->
				<div id="book_detail_head_wapper">	
					<div>
						<p id="book_detail_cate_info">소설  > 기타 국가 소설 </p>
						<h3 class="book_detail_title">레스코프 중단 편집</h3>
					</div>
					<div id="book_detail_head_middle">
						<p>☆☆☆☆☆ 0점 <span>(5명)</span></p>
						<br>
						<p class="book_writer_pub">니콜레이 레스코프 <span> 저</span></p>
						<p class="book_writer_pub">지식을만드는지식 <span> 출판</span></p>
					</div>
					<div id="book_detail_buy_buttom">
						<h3 class="book_detail_title" style="color: #1f8ce6;">14,000원</h3>
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
					우리에게 익숙한 지난 200년은 모두 잊어라!
					<br>
					전 세계 66개국, 4,500명의 전문가와 학자, 기업인이
					긴급 진단한 정치·경제·사회의 대변혁!
					<br>
					포스트 코로나 시대를 대비하며 읽어야 할 단 한 권의 책!
					<br>
					<br>
					전 세계 66개국, 4,500명의 전문가와 학자, 기업인이
					긴급 진단한 정치·경제·사회의 대변혁!
					<br>
					
					거대한 혼돈 속에서 새로운 질서를 제시하다!
					<br>
					<br>
					지금, 우리는 코로나19라는 예기치 못한 위기로 혼돈의 상황에 놓여 있다. 코로나 팬데믹 이후 인류의 삶은 어떻게 변화되고, 
					패러다임의 대전환 속에서 어떤 질서로 재편될까? 
					<br>
					《세계미래보고서 2021》 ‘포스트 코로나 특별판’에는 코로나 팬데믹 이후 찾아올 정치, 경제, 사회, 교육 전 분야의 대변혁에 대한 세계 66개국, 4,500명의 전문가와 학자, 기업인의 긴급 진단과 전망이 담겨 있다.
					세계경제포럼(WEF, World Economic Forum)에서 발표한 자료에 따르면 코로나바이러스는 세계화, 도시화 및 기후변화와 일치하는 더 빈번한 전염병 패턴이 된다.
					<br> 코로나 팬데믹 같은 글로벌 전염병이 과거보다는 더 정규적으로 더 자주 일어날 것이며, 사회의 물리적 연결성이 강화됨에 따라 미래 전염병은 더 빠른 속도로 확산한다는 뜻이다. 
					<br>
					<br>
					유발 하라리는 “코로나 폭풍은 지나갈 것이다. 하지만 우리가 내린 선택은 앞으로 몇 년 동안 우리 삶을 변화시킬 것이다.”라고 말했다. 코로나 팬데믹 이후 인류 문명은 엄청난 지각 변동을 맞게 될 것이고, 세상이 작동하는 방식은 완전히 달라질 것이다.
					《세계미래보고서》는 매년 세상을 움직이는 메가트렌드, 첨단 기술의 발전 및 그것이 창조해낼 미래에 주목해왔다. 그러나 《세계미래보고서 2021》 ‘포스트 코로나 특별판’에서는 코로나19라는 아주 특별한 위기가 만들어낸 사회 전반의 변화와 대응, 그로 인해 완전히 달라질 미래 세상에 대해 훨씬 더 많은 지면을 할애했다. 코로나19가 전 분야에서 불러일으킨 변화와 혼란의 소용돌이는 더욱 확산될 것이며, 미래에 대한 예측불가능성은 더욱 커질 것이다. 이 책에서는 핀테크 시장의 판도를 바꾼 인공지능, 도심 부동산 불패의 신화를 깬 재택근무, 대학 학위를 무용지물로 만든 온라인 교육, 콘퍼런스, 여행 분야의 변신을 주도한 가상현실, 공유경제의 가속화와 독립형 근로자의 확산, 일자리의 파괴와 기본소득제 실험, 신의 영역에 도전하는 생명공학까지 대전환의 서막이 생생하게 펼쳐진다.전 세계 66개국, 4,500명의 전문가와 학자, 기업인이
					긴급 진단한 정치·경제·사회의 대변혁!
					<br>
					거대한 혼돈 속에서 새로운 질서를 제시하다!
					<br>
					지금, 우리는 코로나19라는 예기치 못한 위기로 혼돈의 상황에 놓여 있다. 코로나 팬데믹 이후 인류의 삶은 어떻게 변화되고, 패러다임의 대전환 속에서 어떤 질서로 재편될까? 《세계미래보고서 2021》 ‘포스트 코로나 특별판’에는 코로나 팬데믹 이후 찾아올 정치, 경제, 사회, 교육 전 분야의 대변혁에 대한 세계 66개국, 4,500명의 전문가와 학자, 기업인의 긴급 진단과 전망이 담겨 있다.
					세계경제포럼(WEF, World Economic Forum)에서 발표한 자료에 따르면 코로나바이러스는 세계화, 도시화 및 기후변화와 일치하는 더 빈번한 전염병 패턴이 된다. 코로나 팬데믹 같은 글로벌 전염병이 과거보다는 더 정규적으로 더 자주 일어날 것이며, 사회의 물리적 연결성이 강화됨에 따라 미래 전염병은 더 빠른 속도로 확산한다는 뜻이다. 유발 하라리는 “코로나 폭풍은 지나갈 것이다. 하지만 우리가 내린 선택은 앞으로 몇 년 동안 우리 삶을 변화시킬 것이다.”라고 말했다. 코로나 팬데믹 이후 인류 문명은 엄청난 지각 변동을 맞게 될 것이고, 세상이 작동하는 방식은 완전히 달라질 것이다.
					《세계미래보고서》는 매년 세상을 움직이는 메가트렌드, 첨단 기술의 발전 및 그것이 창조해낼 미래에 주목해왔다. 그러나 《세계미래보고서 2021》 ‘포스트 코로나 특별판’에서는 코로나19라는 아주 특별한 위기가 만들어낸 사회 전반의 변화와 대응, 그로 인해 완전히 달라질 미래 세상에 대해 훨씬 더 많은 지면을 할애했다. 코로나19가 전 분야에서 불러일으킨 변화와 혼란의 소용돌이는 더욱 확산될 것이며, 미래에 대한 예측불가능성은 더욱 커질 것이다. 이 책에서는 핀테크 시장의 판도를 바꾼 인공지능, 도심 부동산 불패의 신화를 깬 재택근무, 대학 학위를 무용지물로 만든 온라인 교육, 콘퍼런스, 여행 분야의 변신을 주도한 가상현실, 공유경제의 가속화와 독립형 근로자의 확산, 일자리의 파괴와 기본소득제 실험, 신의 영역에 도전하는 생명공학까지 대전환의 서막이 생생하게 펼쳐진다.
				
				</p>
			
			
			
			</div><!-- Book_intro -->
			<div id="book_pub_intro" class="book_info_index">
				<h3 class="book_info_index_title">출산사 서평<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<p class="book_info_intro"> 
					팬데믹이 몰고온 폭풍과 새로운 기회를 위한 리셋!<br>
						<br>
						얼마 전 프란체스코 교황이 연설에서 이렇게 언급했다. “신은 언제나 용서하시고, 인간은 가끔 용서하지만, 자연은 용서를 모른다.” 환경오염으로 인한 기후변화, 자연재해, 지구 온난화 등은 사실 인간이 만들어낸 문제들이다. 그것을 해결하지 않으면 재앙이 찾아올 것이라는 《세계미래보고서》의 예측과 시그널은 수도 없이 많았다. 우리를 습격한 코로나19 역시 언젠간 오고야 말 재앙 중 하나였음에 틀림없다. 《월스트리트 저널》은 팬데믹 같은 글로벌 전염병이 과거보다는 더 정규적으로, 더 자주 일어난다고 발표했다. 전 세계 인구가 증가하고, 도심화로 생활공간의 밀도가 높아지는 데다 글로벌화로 인한 빠른 연결성 때문이다.<br>
						오랜 역사를 두고 전염병의 연대기는 이어져왔다. 그렇기에 코로나19만이 문제가 아니다. 미래의 팬데믹은 더 많이, 더 빨리, 더 심각한 사망자를 낳는 전염병으로 다가오게 된다. 물론 흑사병으로 인구의 3분의 1이 죽음을 맞던 시절처럼 속수무책으로 당하고 있지만은 않을 것이다. 발전된 기술로 구축된 문명사회가 코로나19를 빨리 퍼져나가게 했듯 아이러니하지만, 그 기술 덕분에 심각한 위기에 빨리 대응할 수도 있다. 미래학자 게르트 레온하르트는 “위기는 기회다, 놓치지 말라. 재창조하고, 소통하고, 협력하라.”라고 말했다. 코로나19의 습격은 분명 위기지만, 우리가 어떻게 변화하느냐에 따라 새로운 기회가 될 수 있다. 그리고 그 기회로 나아가는 새로운 길을 이 책에서 발견할 수 있을 것이다.<br>
						제4차 산업혁명은 예고편에 불과했다.<br>
						100배 더 예측불가능한 포스트 코로나 시대를 돌파하기 위한 생존 전략!<br>
						<br>
						제4차 산업혁명은 블록체인, 인공지능, 로봇, 유전자 편집, 자율주행차, 우주여행 등의 실험이 현실과 조우하며 발전하는 모습을 우리에게 선사했다. 그리고 누구보다 빨리 누구보다 정확하게 《세계미래보고서》는 그러한 미래를 전망해왔고, 현실로 증명되는 것을 독자들과 함께 목격해왔다. 인공지능 로봇이 정치인이 되어 대통령 선거에 출마하고, 유전자 편집과 생명공학의 발전으로 인간 수명이 증가하고 있으며, 우주여행도 코앞의 현실로 다가왔다. 파괴적 혁신으로 가득한 아이디어들은 오랜 성숙의 시간을 거쳐 세상을 바꾸는 기술로 인정받았고, 상상으로만 가능했던 일들이 이뤄졌다. <br>
						그러나 코로나 팬데믹이 가져올 폭풍우에 비하면 제4차 산업혁명은 예고편에 불과하다. 예상치 못한 바이러스의 침공은 우리가 살고 있는 세상의 토대를 뒤흔들고 있으며, 전망해왔던 미래의 모습을 전면 재수정하도록 요구하고 있다. 어쩌면 익숙했던 지난 200년의 역사를 모두 잊어야 할지도 모른다. 거스를 수 없는 위기와 그로 인한 변화의 폭풍이 몰아치는 와중에 길을 잃지 않으려면 우리는 어떻게 대응하고, 무엇을 선택하며, 어떤 미래를 전망해야 할까? <br>
						2020년 초 세계경제포럼이 ‘위대한 리셋’(Great Reset)을 어젠다로 제시하며 움직임을 본격화하고 있다. 클라우스 슈밥 세계경제포럼 회장은 위기 속에서도 우리가 힘을 합쳐 신속하게 행동한다면, 즉 위대한 리셋을 실행한다면 이 위기를 극복하고 더 나은 세상으로 나아갈 수 있다고 말한다. 교육, 국가 정책, 비즈니스, 의료, 사회적 계약과 근로 조건에 이르기까지 각계각층, 모든 분야에서의 개조를 목표로 연대하고 신속하게 행동해야 할 때가 왔다. 개인, 기업, 국가가 연결되어 맞물려 돌아가는 상황에서 단독 생존이란 무의미하다. 한 국가의 합심을 넘어 전 세계의 모든 국가가 참여해야 하며 모든 산업 분야가 다 변해야 한다. <br>
						<br>
						 <br>
						사회, 경제, 비즈니스, 교육, 의료…<br>
						코로나19가 바꿔놓은 새로운 변화가 몰려온다!<br>
						<br>
						코로나19 이후 팬데믹 쇼크는 또다시 도래할 것이며, 이제 인류는 코로나 이전으로 돌아갈 수 없다는 예측이 지배적이다. 이와 관련해 박영숙 대표는 이렇게 말한다. “코로나19는 우리가 살고 있는 세상의 체제를 뿌리부터 흔들고 있다. 자연환경, 산업과 일자리, 국가와 정치, 금융과 부동산, 교육, 삶의 방식과 태도까지 모든 면에서 원하든 원하지 않든 변화가 요구된다. 변화하는 세상을 거부할 것이 아니라, 누구보다 빨리 그 변화를 받아들이고 적응하는 지혜와 기민함을 발휘해야 할 때다.”<br>
						이 책에서는 코로나 팬데믹 이후 마주하게 될 핵심적 변화들을 8가지 섹션으로 나누어 다루고 있다. 부, 교육, 우주시대, 시민, 국가와 정치, 복지, 비즈니스와 일자리, 기술과 문명이 그것이다. 비대면 문화가 일상화되면서 온라인으로의 이동은 가속화될 것이다. 재택근무와 화상회의가 늘고, 원격수업이 본격화하면서 온라인을 통한 초연결 사회는 더욱 강화된다. 교육 분야도 급격하게 변화하는데 특히 대학이 소멸한다. 2020년 7월 구글, 마이크로소프트 등이 대학교 졸업생을 필요로 하지 않는다고 발표했다. ‘포춘 100대 기업’ 중 대학 졸업장을 기피하는 기업은 절반이나 된다. 재택근무 보편화로 도심이 공동화되고 외곽으로의 이주가 늘면서 부동산 시장이 전면 달라지고, 디지털화폐 전쟁과 핀테크의 발달로 금융권도 새로이 재편된다. <br>
						코로나의 재앙은 선진 자본주의 국가들의 비효율적인 의료 시스템과 부실한 의료 서비스의 맹점을 여실히 드러냈다. 이는 결국 공공과 복지의 문제로 귀결된다. 전 세계가 이윤 추구와 성장이라는 모토로 달려왔으나, 그것이 지닌 심각한 폐해가 이번 사태로 증명됐다. 성장보다는 공공과 복지, 각자도생이 아니라 공존의 가치가 왜 중요한지 다시금 일깨워준다. 팬데믹 이후 각국에서 기본소득제에 대한 논의가 다시금 활발하게 이뤄지고 있는 것도 이런 맥락에서다.<br>
						세상은 온라인으로 더 긴밀히 연결되면서 좁아지고 있다. 인류는 인종, 민족, 국가뿐 아니라 전 분야를 막론하고 운명 공동체로 엮여 있다. 그리고 우리의 예측을 벗어난 거대하고 급격한 변화들이 속속 일어날 것이다. 이 파괴적인 변화를 읽어내고 올바른 선택을 하는 사람들만이 미래를 준비할 수 있다. 그리고 그것은 인류가 공존하고 공생하는 방향에 초점을 맞춰야 하며, 이 책이 그 방향을 제시하는 나침반이자 훌륭한 안내서가 되어줄 것이다.
										</p>
			
			</div><!-- Book_pub_intro -->
			
			
			<div id="book_writer" class="book_info_index">
				<h3 class="book_info_index_title">저자 소개<button class="intro_plus"><img src="${pageContext.request.contextPath}/resources/images/Product_plus.png" style="width: 20px; height:20px;"></button></h3>
				<div id="book_writer_wapper">
				<h3 >박영숙</h3>
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
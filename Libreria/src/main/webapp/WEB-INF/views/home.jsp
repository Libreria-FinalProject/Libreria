<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/home.css"/>
</head>
<body>
<c:import url="common/header.jsp"></c:import>
<section>
		<div id="new_books_div">
		 <div>
		 <div id="new_books_indiv">
			<span>집 앞 서점에 방금 나온 신간!</span><br>
			<ul class="new_book_ul">
			<c:forEach var="book" items="${recentBooks }" varStatus="status">
				<li class="new_book" onclick="detailBook(${book.b_no})">
					<div class="new_book_img"></div>
		 			<div class="new_book_title">${book.b_title }</div>
		 			<div  class="new_book_writer">${book.bwp_name }</div>
		 		</li>
		 		<script>
		 			$('.new_book_ul').find('.new_book_img').eq("${status.index}").css("background-image","url('${book.file_path}${book.change_name}')");
		 		</script>
			</c:forEach>
			</ul>	
		<div id="new_book_btns">
			<button class="left_btn">&lt;</button>
			<button class="right_btn">&gt;</button>
		</div>
		</div>
		</div>
	</div>
	<!------------------------------------>
	<div id="bestsellerDiv">
		<h2 id="bestsellerHead">베스트셀러 > </h2>
		<div>
			<ul>
			<c:forEach var="book" items="${bestsellerBooks }" varStatus="status">
				<c:if test="${status.index<3 }">
					<li class="bestseller" style="grid-row: ${status.index+1}; grid-column:1;">
			    </c:if>
			    <c:if test="${status.index<6 && status.index>2 }">
			    	<li class="bestseller" style="grid-row: ${status.index-2}; grid-column:2;">
			    </c:if>
			    <c:if test="${status.index<9 && status.index>5 }">
			    	<li class="bestseller" style="grid-row: ${status.index-5}; grid-column:3;">
			    </c:if>
					<div class="bestseller_img" onclick="detailBook(${book.b_no})"></div>
					<div class="bestseller_content">
						<h3>${status.index+1}</h3>
						<div>
							<span class="bestseller_title" onclick="detailBook(${book.b_no})">${book.b_title }</span><br>
							<span>${book.bwp_name }</span><br>
							<span>
							<c:if test="${book.avg_star==0 }"><c:forEach begin="1" end="5"><img class="star" src="resources/images/Product_review_star_avg_null.png"></c:forEach></c:if>
							<c:if test="${book.avg_star>0 && book.avg_star!=5 }">
							<c:forEach begin="1" end="${book.avg_star }"><img class="star" src="resources/images/Product_review_star_avg.png"></c:forEach><c:forEach begin="1" end="${5-book.avg_star }"><img class="star" src="resources/images/Product_review_star_avg_null.png"></c:forEach>
							</c:if>	
							<c:if test="${book.avg_star==5 }">
							<c:forEach begin="1" end="5"><img class="star" src="resources/images/Product_review_star_avg.png"></c:forEach>
							</c:if>
							</span>
						</div>
					</div>
				</li>
				<script>
					$(".bestseller_img").eq("${status.index}").css("background-image","url('${book.file_path}${book.change_name}')");
				</script>
			</c:forEach>
				
			</ul>
		</div>
	</div>
	<!-- ------------------------ -->
	<div id="randomNovelDiv">
		<div id="randomNoverHead">이 소설은 어때?</div>
		<div id="randomNovelBody">
			<ul id="randomNovel_ul">
			<c:forEach var="book" items="${randomNovelBooks}">
				<li class="randomNovel_li">
					<div class="randomNovel_img" onclick="detailBook(${book.b_no})" style="background-image: url('${book.file_path}${book.change_name }');"></div>
					<div class="randomNovel_title" onclick="detailBook(${book.b_no})">${book.b_title }</div>
					<div class="randomNovel_writer">${book.bwp_name }</div>
				</li>
			</c:forEach>
		
			</ul>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
	});
	
	 var recentNum = 1;
	 $('.left_btn').click(function(){
		 $('.new_book_ul').css("transform","translateX(0px)");
		 if(recentNum == 1){
			 $('.new_book_ul').css("transform","translateX("+2*-940+"px)");
			 recentNum=3;
		 }else if(recentNum ==2){ 
			 $('.new_book_ul').css("transform","translateX(0px)");
			 recentNum =1;
		 }else{
			 $('.new_book_ul').css("transform","translateX(-940px)");
			 recentNum=2;
		 }
		 console.log(recentNum);
	 });
	 $('.right_btn').click(function(){
		 
		 if(recentNum != 3){
			 var move = recentNum*-940;
			 $('.new_book_ul').css("transform","translateX("+move+"px)");
			 recentNum++;
		 }else{
			 $('.new_book_ul').css("transform","translateX(0px)");
			 recentNum =1;
		 }
	 });
	 $("#bestsellerHead").click(function(){
	 	location.href="bookCateBestList.bo?bcf_no=1";
	 })
	 function detailBook(b_no){
		 location.href="bookDetail.bo?b_no="+b_no;
	 }
	
	</script>
</section>
<c:import url="common/footer.jsp"></c:import>
</body>
</html>

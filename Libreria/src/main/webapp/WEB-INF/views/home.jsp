<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<style type="text/css">
	 #new_books_div{
	 	background-color:#0e0e3e;
	 	height: 230px;
	 	padding: 20px 160px;
	 	color: #ffffff;
	 	font-size: 14px;
	 }
	 #new_books_indiv{
	 	height: 100%;
	 	width: 100%;
	 	overflow: hidden;
	 }
	 .new_book{
	 	border: 1px solid white;
	 	display: inline-block;
	 	width: 100px;
	 	height: 180px;
	 	margin: 15px 15px;
	 }
	 .new_book_img{
	 	border:1px solid red;
	 	height: 130px;
	 	width:100%;
	 	display: inline-block;
	 }
	 .new_book_title{
	 }
	 
	 .new_book_writer{
	 
	 }
	</style>
</head>
<body>
<c:import url="common/header.jsp"></c:import>
<section>
	<article><img src=" ${pageContext.request.contextPath}/resources/images/main1.png" style="width: 950px;"/></article>
	<div id="new_books_div">
		 <div id="new_books_indiv">
			 집 앞 서점에 방금 나온 신간!<br>
			 <div class="view_div">
		 	<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf1</div>
		 		<div  class="new_book_writer">asdf</div>
		 	</div>
		 	<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf2</div>
		 		<div  class="new_book_writer">asdf</div>
		 	</div>
		 	<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf3</div>
		 		<div  class="new_book_writer">asdf</div>
		 	</div>
		 	<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf4</div>
		 		<div  class="new_book_writer">asdf</div>
		 	</div>
		 	<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf5</div>
		 		<div class="new_book_writer">asdf</div>
		 	</div>
		 	</div>
		 	
		 	<div class="view_div">
		 	<div class="new_book">
		 		<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf6</div>
		 		<div class="new_book_writer">asdf</div>
		 	</div>
		 	
		 		<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf7</div>
		 		<div class="new_book_writer">asdf</div>
		 	</div>
		 	
		 		<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf8</div>
		 		<div class="new_book_writer">asdf</div>
		 	</div>
		 	
		 		<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf9</div>
		 		<div class="new_book_writer">asdf</div>
		 	</div>
		 	
		 		<div class="new_book">
		 		<div class="new_book_img"></div>
		 		<div class="new_book_title">asdf10</div>
		 		<div class="new_book_writer">asdf</div>
		 	</div>
		 	 </div>
		 	

		 </div>
	</div>
</section>
<c:import url="common/footer.jsp"></c:import>
</body>
</html>

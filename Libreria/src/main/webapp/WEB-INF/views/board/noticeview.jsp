<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libreria</title>
<style type="text/css">
   @import url(http://fonts.google.com/earlyaccess/nanumgothic.css);
   *{
      margin: 0px;
      padding: 0px;
      font-family: 'Nanum Gothic';
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

   .notice_title{
       padding-top: 75px;
       padding-bottom: 40px;
       font-size: 35px;
       font-weight: bold;
   }

   .notice_content{
       padding:10px;
       font-size: 15px;
   }

   .notice_content > p {
       padding-bottom:10px;
       padding-top: 10px;
   } 
   .list_button{
       padding:20px   
   }

   .back{
       background-color:rgb(94, 107, 159);
       color:white;
       font-size:20px;
       padding:5px;
   }

   .rectify{
       background-color:rgb(94, 107, 159);
       color:white;
       font-size:20px;
       padding:5px;
   }

   .delete{
       background-color:rgb(94, 107, 159);
       color:white;
       font-size:20px;
       padding:5px;
   }

   #notice_comment{
       padding:10px;
   }

   #comment{
       font-size: 20px;
       padding-bottom: 20px;
   }

   #comment-input{
       font-size: 15px;
       width: 400px;
       padding-left: 10px;
       height: 30px;
   }


   a:link { color: black; text-decoration: none;}
   a:visited { color: black; text-decoration: none;}
   a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
   <nav class="" id="nav_container">
         <div id="nav_body">
            <a class="" href="#" id="a_brand">LIBRERIA</a>
            <input type="text" id="input_search" placeholder="검색어를 입력하세요">
            <div id="div_head_btns">
               <button class="btn_head">회원가입</button>
               <button class="btn_head">로그인</button>
            </div>
         </div>
         <div id="nav_menu">
            <ul id="menu_ul">
               <li id="menu_li"></li>
               <li>국내도서</li>
               <li>외국도서</li>
               <li>중고도서</li>
               <li>고객센터</li>
               <li>장바구니</li>
            </ul>
         </div>
   </nav>
   <section>
       <div class="notice_header">
        <h1 class="notice_title">
            	카드 등록이 제대로 되지 않습니다.
        </h1>  
    </div>
    <div class="nickname" style="padding-left: 10px; padding-bottom: 20px;">
        작성자 :  <!--${} 작성자 데이터 가져와서 입력 -->
    </div>
    <div class="categoty" style="padding-left: 10px; padding-bottom: 20px;">
        카테고리 : <!--${} 선택한 카테고리 데이터 가져와서 입력 -->
    </div>
    <div class="notice_content">
        <p>안녕하세요.</p>
        <p>제가 이번에 처음 가입을 하고 카드 등록을 하려고 하는데</p>
        <p>카드 번호와 CVC번호와 비밀번호를 전부 제대로 입력을 했는데도 계속해서 일치 하지 않는다고 경고창이 나오네요</p>
        <p>그래서 책을 대여를 하지 못하고 있습니다. 최대한 빠른 해결을 부탁드립니다.</p>
    </div>

    <div id="notice_comment"> <!-- 댓글은 관리자만 작성이 가능 -->
        <div id="comment">댓글 : <!--${} 댓글 데이터 가져와서 입력 -->
        <input id="comment-input" placeholder="댓글을 입력해 주세요."> 
        <button id="submit" style="font-size: 15px; padding:4px;">등록</button></div>
    </div>

    <div class="list_button" align="center">
        <button class="back">목록으로</button>
        <button class="rectify" onclick='alert("현재 등록 되어 있는 문의 사항을 수정 하시겠습니까?")'>수정하기</button> <!-- 작성자만이 버튼이 보이고 다른 사용자에겐 보이지 않는다.-->
        <button class="delete" onclick='alert("현재 등록 되어 있는 문의 사항을 삭제 하시겠습니까?")'>삭제하기</button> <!-- 작성자/관리자 경우 버튼이 보이고, 비로그인 사용자 혹은 비작성자인 경우 버튼이 보이지 않는다. -->
    </div>
    
    <!-- 목록으로는 사용자 전체 확인 가능, 수정하기는 작성자만이 가능 삭제하기는 작성자와 관리자만이 가능-->
   </section>
   <footer id="footer_container">
      <div>
         <span>서울시 강남구 역삼동 남도빌딩</span> | <span>대표 : 김대표</span> | <span>사업자등록번호 : 123-45-67890</span>
         <br><br>
         <span>Copyright(C) LIBRERIA  all  rights reserved.</span>
      </div>
   </footer>
</body>
</html>
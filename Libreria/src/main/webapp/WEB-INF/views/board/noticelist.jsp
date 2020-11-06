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

   .notice_write{
      font-size: 20px;
      font-weight: bold;
      background-color:rgb(94, 107, 159);
      color:white;
      padding:5px;
   }

   .notice_title{
      text-align:center;
      font-size:50px;

   }

   .notice_list{
      text-align: left;
      padding:10px;
      font-size:20px;
   }

   .notice_list_font{
      font-size: 20px;   
      font-weight: bold;

   }

   .notice_write{
      font-size: 20px;
      font-weight: bold;
      background-color:rgb(94, 107, 159);
      color:white;
      padding:5px;
   }
   
   .write_button{
      size: 20px;
      padding: 10px;

   }
   a:link { color: black; text-decoration: none;}
   a:visited { color: gray; text-decoration: none;}
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
        <h1 class="notice_title">문의 사항</h1>
         <br><br>
         <div>
            <ul class="notice_list">
               <a href="#1" class="notice_list_font">[문의 사항] 10월 20일 홈페이지 점검 안내</a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#2" class="notice_list_font">[문의 사항] 이용 방법 안내</a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#3" class="notice_list_font">[문의 사항] 중고도서 구매 및 판매 방법 안내</a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#4" class="notice_list_font">[문의 사항] 추석 연휴로 인한 배송 지연 안내</a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#5" class="notice_list_font">[문의 사항] </a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#6" class="notice_list_font">[문의 사항] </a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#7" class="notice_list_font">[문의 사항] </a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#8" class="notice_list_font">[문의 사항] </a>
            </ul>
            <hr>
            <ul class="notice_list">
               <a href="#9" class="notice_list_font">[문의 사항] </a>
            </ul>
            <hr>
         </div>  
         <ul class="write_button" align="right">
         <button class="notice_write">문의 사항 작성</button>
                  <!--작성버튼은 회원만 보이도록 로그인 되었을 경우의 관리자와 회원으로 구분, 회원으로 구분된 사용자만 보이도록 hidden 걸기-->
         </ul>

   <br><br>
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
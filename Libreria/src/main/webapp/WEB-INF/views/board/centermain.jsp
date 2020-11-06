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
       font-size: 30px; color:Black; font: border 3; padding-bottom: 5px;
   }
   .notice_list_item{
        padding-top: 10px; padding-bottom: 10px; color:black;
   }
   .notice_list_font{
        text-decoration: none;
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
    <br><br>
    <div class="notice">
        <h3 class="notice_title"><a href="boardlist.jsp">공지사항</a></h3>
        <ul class="notice_list">
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[공지사항]중고도서 구매 및 판매 방법 안내에 관한 공지사항 입니다.</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[공지사항]이용 방법 안내에 관한 공지사항입니다.</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[공지사항]카드 등록 방법에 관한 공지사항입니다.</a>
            </li>
            <hr>
        </ul>
    </div>

    <br><br><br><br>

    <div class="notice">
        <h3 class="notice_title"><a href="FAQlist.jsp">FAQ</a></h3>
        <ul class="notice_list">
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[FAQ] 도서 환불 / 취소 방법에 관한 FAQ</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[FAQ] 아이디 / 패스워드 찾기에 관한 FAQ</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[FAQ] 등록한 카드 해지 방법에 관한 FAQ</a>
            </li>
            <hr>
        </ul>
    </div>

    <br><br><br><br>

    <div class="notice">
        <h3 class="notice_title"><a href="noticelist.jsp">문의사항</a></h3>
        <ul class="notice_list">
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[문의사항]중고도서 구매 후 환불 방법은 없나요?</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[문의사항]카드 등록이 제대로 되지 않습니다.</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[문의사항]책 배송기간이 길어지고 있어 취소를 하려 하는데 환불이 가능한가요?</a>
            </li>
            <hr>
        </ul>
    </div>
    <br><br><br><br><br><br>
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
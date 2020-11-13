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

   .board_write_title{
     font-weight: bold;
     font-size: 35px;
     padding-top: 40px;
     padding-bottom: 30px;
   }

   .board_write_content{
       padding-bottom: 10px;
   }

   .content_title{
       display: block;
       width: 75%;
       min-height: 30px;
       border: 1xp solid;
       overflow: hidden;
       resize: none;
       word-break: break-all;
       font-size: 20px;
       line-height: 17px;
       outline: none;
       padding-top: 15px;
       padding-left: 15px;
   }

   .content_content{
       display: block;
       width: 75%;
       min-height: 350px;
       border: 1xp solid;
       overflow: hidden;
       resize: none;
       word-break: break-all;
       font-size: 20px;
       line-height: 17px;
       outline: none;
       padding-top: 20px;
       padding-left: 15px;
   }f
   
   .board_write_content > textarea{
       word-spacing: normal;
       text-transform: none;
       text-indent: 0px;
       text-shadow: none;
       text-align: start;
       cursor: text;
       overflow-wrap: break-word;
   }

   .write_button{
       padding-top: 10px;
       padding-bottom: 25px;
   }

   .content_write{
       background-color:rgb(94, 107, 159);
       color:white;
       font-size:20px;
       padding:5px;
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
   <form action="binsert.bn" method="post" enctype="Multipart/form-data">
   <section align="center">
         <div class="board_write_header" >
             <h1 class="board_write_title">공지 사항 작성</h1>
         </div>
         <div>
         	<h1>작성자: <input type="text" name="memNo" readonly value="관리자" style="background-color: gray"></h1>
         </div>
         <div class="board_write_content" align="center">
             <textarea class="content_title" placeholder="제목을 입력 해주세요"></textarea>
         </div>
         <div class="board_write_content" align="center">
             <textarea class="content_content" placeholder="내용을 입력 해주세요"></textarea>
         </div>
         <div class="write_button">
            <input type="submit" value="작성하기" class="content_write"> &nbsp;
         </div>
   </section>
   </form>
   <footer id="footer_container">
      <div>
         <span>서울시 강남구 역삼동 남도빌딩</span> | <span>대표 : 김대표</span> | <span>사업자등록번호 : 123-45-67890</span>
         <br><br>
         <span>Copyright(C) LIBRERIA  all  rights reserved.</span>
      </div>
   </footer>
</body>
</html>
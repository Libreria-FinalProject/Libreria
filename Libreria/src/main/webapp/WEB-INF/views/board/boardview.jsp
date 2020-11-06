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

   .board_title{
       padding-top: 75px;
       padding-bottom: 40px;
       font-size: 35px;
       font-weight: bold;
   }

   .board_content{
       padding:10px;
       font-size: 15px;
   }

   .board_content > p {
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

   .delete{
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
   <section>
       <div class="board_header">
        <h1 class="board_title">
            [공지사항] 추석 연휴로 인한 배송 지연 안내
        </h1>  
    </div>
    <div class="board_content">
        <p>안녕하세요 LIBRERIA 입니다.</p>
        <p>다가 오는 추석 연휴(9월 30일 ~ 10월 4일)와 한글날(10월 9일)로 인하여 배송이 지연됨을 알려 드립니다</p>
        <p>우선 배송은 9월 25일까지 신청해주시는 것을 마감으로 하고 그 이후 부턴 모든 연휴가 끝난 후인 10월 12일 부터 순차적으로 출고를 진행 할 예정 입니다.</p>
        <p>이 기간 동안엔 고객센터 또한 운영 되지 않아 문의 사항에 답변이 달리지 않게 됩니다. 문의 사항에 올려 주시는 내용은 10월 5일부터 순차적으로 답변해드릴 예정 입니다.</p>
        <p>문의 해주시는 내용 중 자주 다른분들께서도 많이 문의해주시는 사항에 대한 것은 FAQ를 통해 확인하실수 있으니 많이 이용해 주시기 바랍니다.</p>
        <p>풍성하고 즐거운 한가위 보내시기 바랍니다.
        <br>감사합니다.</p>
    </div>
    <div class="list_button" align="center">
        <button class="back">목록으로</button>
        <button class="delete" onclick='alert("현재 등록 되어 있는 공지 사항을 삭제 하시겠습니까?")'>삭제하기</button><!-- 관리자만이 보임 -->
    </div>
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
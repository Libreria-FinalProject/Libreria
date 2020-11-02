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
   #delData{
       width:600px;
       padding-top:30px;
       padding-bottom:30px;
   }

   #dataBox{
       width:600px;
       display:flex;
       flex-direction:column;
       align-items:center;
       justify-content:center;
       margin:auto;
       padding-top:50px;
       padding-bottom:50px;
   }
   #dataBox>label{
       margin-bottom:20px;
   }

   #dataBox>label:nth-child(3){
       padding-top:20px;
       padding-bottom:20px;
   }


    .dataInput{
        width:300px;
        height:40px;
        border:1px solid lightgray;
        border-radius:5px;
        padding-left:10px;
        box-sizing:border-box;
    }
    .dataInput3{
        width:250px;
    }
    .dataBtn3{
        width:50px;
        height:41px;
        background:rgb(60, 68, 101);
        color:white;
        border-radius:5px;
        border:none;
    }
    .btn1{
        width:150px;
        height:41px;
        background:lightgrey;
        color:white;
        border-radius:5px;
        border:none;
    }

    .btn2{
        width:150px;
        height:41px;
        background:rgb(60, 68, 101);
        color:white;
        border-radius:5px;
        border:none;
    }


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

   <section id="delData">
    <label class="delTitle">배송정보 확인</label>
    <div id="dataBox">
        <label><input type="text" class="dataInput dataInput1" placeholder="" value="김춘신"></label>
        <label><input type="text" class="dataInput dataInput2" placeholder="" value="010-5657-8870"></label>
        <label><input type="text" class="dataInput dataInput3" placeholder="" value="772-245"><input type="button" class="dataBtn3" value="검색"></label>
        <label><input type="text" class="dataInput dataInput4" placeholder="" value="서울시 강남구 테헤란로 57"></label>
        <label><input type="text" class="dataInput dataInput5" placeholder="" value="남부빌딩3층 301호"></label>
        <label><input type="button" value="취소하기" class=" btn btn1"><input type="button"value="주문하기"class=" btn btn2"></label>


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
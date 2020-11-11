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

   #basket{
       width:100%;
       min-height:400px; 
       margin-top:20px;
       margin-bottom:50px;
       display:flex;
       justify-content:center;

   }
   #basket_Left{
       width:650px;
       min-height:400px; 
       border:1px solid gray;
       margin-right:20px;
       margin-left:20px;
       border-top:none;
   }
   #basket_Right{
       
   }
   #Right_top{
    width:300px;
       height:120px;
       border:1px solid rgb(94, 107, 159);
       margin-right:10px;
       display:flex;
       justify-content:top;
       align-items:left;
       flex-direction:column;
       position:relative;
       padding-top:20px;
   }
    #allPrice{
        width:280px;
        height:50px;
        background: rgb(94, 107, 159);
        
        position:absolute;
        bottom:0px;
        text-align:center;
       line-height:50px;
       background:rgb(94, 107, 159);
       color:white;

       display:flex; 
       align-items:center;
       justify-content:space-between;
       padding-left:10px;
       padding-right:10px;
    }

   #Right_bot{
    width:300px;
       height:50px;
       border:1px solid rgb(94, 107, 159);
       margin-right:10px;
       display:flex;
       justify-content:top;
       align-items:left;
       flex-direction:column;
       margin-top:10px;
       text-align:center;
       line-height:50px;
       background:rgb(94, 107, 159);
       color:white;
   }

   .priceBox{
       display:flex; 
       align-items:center;
       justify-content:space-between;
       padding-left:10px;
       padding-right:10px;

   }
   
   .selectBookBox{
       padding:10px;
       color:rgb(94, 107, 159);
       font-weight:bold;

   }

   #left_top{
       display:flex;
       justify-content:center;
   }
   #left_top>div{
       width:50%; 
       border:1px solid gray;
       height:50px; 
       text-align:center;
       line-height:50px;
       box-sizing:border-box;
      
   }
   #left_top>div:first-child{
       border-bottom:none;
       border-left:none;
   }
   #left_top>div:nth-child(2){
       background:gray;
   }
   #productBox{
       width:600px;
       height:90px;
        border-bottom:1px solid gray;
        
        padding:10px;
        display:flex;
        flex-direction:center;
        justify-content:left;
        align-items:center;
        margin:auto;
   }
   
   #productBox>img{
       width:70px; 
       height:90px;
       margin-left:30px;
   }
   #productBox>div{
       margin-left:70px;
       display:flex;
       flex-direction:column;
   }
   #alongPrice{
       margin-left:200px;
       font-weight:bold;
       color:rgb(60, 68, 101);
   }
   .allSelect{
       border-bottom:1px solid black;;
       width:620px;
       margin-left:15px;
       display:block;
       padding-bottom:10px;
   }
   .allSelect2{
       width:400px;
       margin-left:15px;
       display:inline-block;
   }
   #lastSelectBox{
       display:flex;
       
   }
   #selectPriceDelete{
       margin-left:200px;
       width:100px;
       
   }
  

 
   #popUp{
       width:300px;
       height:200px;
       background:gray;
       position:absolute;
       top:calc(50% - 100px);
       left:calc(50% - 150px);
       display:flex;
       align-items:center;
       justify-content:center;
       flex-direction:column;
    
   }
   #popUp>button{
       margin-top:20px;
       width:75px;
       height:30px; 
       background:rgb(94, 107, 159);
       border:none;
       color:white;
   }
   #contentBox{
       margin-bottom:20px;
   }
   #btnInfo{
       border:none;
       width:80px;
       height:30px;
       background:white;
       margin-right:10px;
       border-radius:5px;
       font-weight:bold;
       border:1px solid lightgray;
   }
   #btnDelete{
    border:none;
       width:80px;
       height:30px;
       background:white;
       margin-right:10px;
       border-radius:5px;
       font-weight:bold;
       border:1px solid lightgray;
       
   }
   #titleBox{
       width:150px;
   }
   #btnBox{
       width:200px;
   }

   #selectPriceDelete{
    border:none;
       width:100px;
       height:30px;
       margin-right:10px;
       border-radius:5px;
       font-weight:bold;
       border:1px solid lightgray;
       background:white;
   }

   #titleName{
       padding-left:15px;
   }

   #mainSection{
       padding-top:30px;
   }

    #popUp{
       width:300px;
       height:200px;
       background:gray;
       position:absolute;
       top:calc(50% - 100px);
       left:calc(50% - 150px);
       display:flex;
       align-items:center;
       justify-content:center;
       flex-direction:column;
    
   }

   #popUp>button{
       margin-top:20px;
       width:75px;
       height:30px; 
       background:rgb(94, 107, 159);
       border:none;
       color:white;
   }

   #DeleteBtnBox{
       display:flex;
       align-items:center;
   }
   #DeleteBtnBox>button{
    margin-top:20px;
       width:75px;
       height:30px; 
       background:rgb(94, 107, 159);
       border:none;
       color:white;
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
   <section id="mainSection">
       <label id="titleName">장바구니</label>
      <div id="basket">
        <div id="basket_Left">
            <div id="left_top">
                <div id="canBuyBox">구매 가능</div>
                <div></div>
            </div>
            
            <div id="contentBox">
                    <br>
                    <label class="allSelect"><input type="checkbox"  id="allSel" class="allSelClass" onclick="allCheck();"> 전체선택 </label>
                    
                

                <div id="productBox">
                    <label><input type="checkbox" name="SelectBook"onclick="whatAll();"> </label>
                    <img src="./진격의거인31.JPG">
                    <div id="titleBox">
                        <label>책 제목</label>
                         <label>책 저자</label>
                         <input type="hidden" value="bookNo" id="BookNo">
                         <div id="btnBox"><button id="btnInfo" onclick="location.href='inpo.pay'">상세보기</button><button id="btnDelete" onclick="location.href='delete.pay'">삭제</button></div>
                        </div>
                    <label id="alongPrice" class="money">10000</label>원
                </div>

                <div id="productBox">
                        <label><input type="checkbox" name="SelectBook"onclick="whatAll();"> </label>
                        <img src="./진격의거인31.JPG">
                        <div id="titleBox">
                            <label>책 제목</label>
                             <label>책 저자</label>
                             <input type="hidden" value="bookNo" id="BookNo">
                             <div id="btnBox"><button id="btnInfo" onclick="location.href='inpo.pay'">상세보기</button><button id="btnDelete" onclick="location.href='delete.pay'">삭제</button></div>
                            </div>
                        <label id="alongPrice" class="money">10000</label>원
                    </div>

                    <div id="productBox">
                            <label><input type="checkbox" name="SelectBook" onclick="whatAll();"> </label>
                            <img src="./진격의거인31.JPG">
                            <div id="titleBox">
                                <label>책 제목</label>
                                 <label>책 저자</label>
                                 <input type="hidden" value="bookNo" id="BookNo">
                                 <div id="btnBox"><button id="btnInfo" onclick="location.href='inpo.pay'">상세보기</button><button id="btnDelete" onclick="location.href='delete.pay'">삭제</button></div>
                                </div>
                            <label id="alongPrice" class="money">10000</label>원
                        </div>

                <br>
                <div id="lastSelectBox">
                <label class="allSelect2"><input type="checkbox" id="allSel" class="allSelClass" onclick="allCheck();"> 전체선택 </label>
                <button id="selectPriceDelete" onclick="selectDelete()">선택상품삭제</button>
                </div>
            </div>

            
        </div>
        <div id="basket_Right">
            <div id="Right_top">
            <label class="selectBookBox">총 2권을 선택하셧습니다.</label>
            <label class="priceBox" id="AllPrice"><label>총 상품가격 </label><label  class="money">price</label></label>
            <label id="allPrice"><label>결제가격</label><label  class="money">price</label> </label>
            </div>
            <div id="Right_bot" onclick="location.href='payment1.pay'">결제하기</div>
        </div>

            
      </div>

      
   
   </section>

   <div id="popUp">
    <label>정말 삭제하시겟습니까?</label>
    <div id="DeleteBtnBox">
    <button>확인</button>&nbsp;<button>취소</button>
    </div>
    </div>

   <footer id="footer_container">
      <div>
         <span>서울시 강남구 역삼동 남도빌딩</span> | <span>대표 : 김대표</span> | <span>사업자등록번호 : 123-45-67890</span>
         <br><br>
         <span>Copyright(C) LIBRERIA  all  rights reserved.</span>
      </div>
   </footer>
</body>

<script>
    var allSel = document.getElementById("allSel");
    var myCheck = document.getElementsByName("SelectBook");
    var allSelClass = document.getElementsByClassName("allSelClass");

    var flag = "false";

    

    
    function whatAll(){
        if(flag = "true"){
            allSel.checked = false;
            flag = "false";
        }
        if(flag = "false"){
            for(var i=0; i<myCheck.length; i++){
                if(myCheck[i].checked == false){
                    allSel.checked = false;
                    allSelClass[0].checked = false;
                    allSelClass[1].checked = false;
                    flag = "false";
                    break;
                }else if(myCheck[i].checked == true){
                    allSel.checked = true;
                    allSelClass[0].checked = true;
                    allSelClass[1].checked = true;
                    flag = " true"; 
                }
            }
        }
    }

    function allCheck(){
        if(flag == 'false'){
            for(var i =0; i<myCheck.length; i++){
                myCheck[i].checked = true;
                allSelClass[0].checked = true;
                    allSelClass[1].checked = true;
            }
            flag = "true";
        }else{
            for(var i = 0; i<myCheck.length; i++){
                myCheck[i].checked = false;
                allSelClass[0].checked = false;
                    allSelClass[1].checked = false;
            }
            flag = "false";
        }
    }
    
    var money = document.getElementsByClassName("money");
    console.log(money);
    console.log(money[0].innerHTML);
    var mon1innerHTML
    money.toLocaleString();

	function selectDelete(){
		
		var checkItem = [];
		
		for(var i=0; i<myCheck.length; i++){
			if(mycheck[i].checked == true){
				checkItem.puch(mycheck[i]);
			}
		}
		
		location.href="<%= request.getContextPath()%>/selectDelete.pay?list="+ checkItem;
	}
    
    
    
    
    
    
    
    
    
    
</script>
</html>
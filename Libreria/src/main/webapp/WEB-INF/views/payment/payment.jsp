<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
       margin-top:0px;
       margin-bottom:50px;
       display:flex;
       justify-content:center;

   }
   #basket_Left{
       width:650px;
       min-height:400px; 
       margin-right:20px;
       margin-left:20px;
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
       margin-left:275px;
   }
   .allSelect{
       margin:15px;
   }
   #selectPriceDelete{
       margin-left:430px;
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

  #contentTitle{
       width:100%;
       min-height:50px; 
       margin-top:25px;
       margin-bottom:0px;
       display:flex;
       justify-content:center;

   }
   #contentTitle label:nth-child(1){
       width:640px;
   }
   #contentTitle label:nth-child(2){
       width:300px;
       margin-left:20px;
   }

   #alongPrice{
       margin-left:180px;
       font-weight:bold;
       color:rgb(76, 83, 107);
   }
   #Quantity{
        margin-left:140px;
        width:30px;
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

   #basket_Right{
       
    }
    #Right_top{
     width:300px;
        height:400px;
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
        align-items:center;
        flex-direction:column;
        margin-top:10px;
        text-align:center;
        line-height:50px;
        background:rgb(94, 107, 159);
        color:white;
        cursor:pointer;
    }
 
    .priceBox{
        display:flex; 
        align-items:center;
        justify-content:space-between;
        padding-left:10px;
        padding-right:10px;
        margin-bottom:30px;
 
    }

    .priceBox2{
        display:flex; 
        align-items:center;
        padding-left:10px;
        padding-right:10px;
        margin-bottom:30px;
 
    }
    .selectBookBox{
       padding:10px;
       color:rgb(94, 107, 159);
       font-weight:bold;

   }
   .priceBox{
       display:flex; 
       align-items:center;
       justify-content:space-between;
       padding-left:10px;
       padding-right:10px;

   }

</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   
   <section>
      <div id="contentTitle">
      <label>주문목록</label> 
      <label>결제정보</label> 
      </div>
      <div id="basket">
        <div id="basket_Left">
            <div id="left_top">
            </div>
            

		<c:forEach items="${ BasketInfo }" var="basket">
			<div>
                    <hr>
                    <div id="productBox">
                            
                            <img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover${ basket.img_no }.jpg">
                            <div id="titleBox">
                                <label id="bookName">${ basket.b_title }</label>
                                 
                                </div>
                                
                            	<label id="alongPrice">${ basket.b_price }원</label>
                        </div>
                <br>
            </div>
		</c:forEach> 



            
        </div>
        <div id="basket_Right">
        		<form action="MethodOfPayment.pay">
                <div id="Right_top">
                <label class="selectBookBox">총 <label id="allBookCount"></label>권을 선택하셧습니다.</label>
                <label class="priceBox" id="AllPrice"><label>총 상품가격 </label><label class="AllPrice"></label>원</label>
                <label class="priceBox"><label>결제가격</label><label class="AllPrice"></label>원</label>
                <input type="hidden" class="AllPrice2" name="AllPrice2">
                <hr>
                <label class="selectBookBox"> 결제수단</label>
                <label class="priceBox2"><input type="radio" name="pay" value="Mutong"  checked="checked">무통장입금</label>
                <label class="priceBox2"><input type="radio" name="pay" value="Sinyong">신용카드</label>
                <label class="priceBox2"><input type="radio" name="pay" value="Mileage">마일리지</label>
                
            </div>
            	
                <button id="Right_bot">결제하기</button>
                </form>
            </div>
      </div>
	
	<script>
	
	
	 var allprice = [];
	    var allBook = [];
	    var bookCount = 0
	    
	    var allpriceText = 0;
	    
		<c:forEach items="${ BasketInfo }" var="basket">
		
		allprice.push("${ basket.b_price }");
		allBook.push("${ basket.b_title }");
		
		bookCount += 1;
		</c:forEach>
		
		
		
		for(var i = 0; i < allprice.length; i++){
			allpriceText += parseInt(allprice[i])
		}
		
		console.log("allpriceText" + allpriceText);
		
		$(document).ready(function(){
			$('#allBookCount').text(bookCount);
			$('.AllPrice').text(allpriceText);
			$('.AllPrice2').val(allpriceText);
		})
	
	</script>
      
   
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
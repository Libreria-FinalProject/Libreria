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
   a{
   	text-decoration:none;
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
       align-items:center;
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
<c:import url="../common/header.jsp"></c:import>
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
			 
			
			 <c:forEach items="${ BasketInfo }" var="basket">
			 <c:url value="deleteBook.pay" var="delete">
                                <c:param name="bookNum" value="${ basket.b_no }" />
                                <c:param name="memNum" value="${ basket.mem_no }" />
                                </c:url>
             <input type="hidden" id="memNum" value="${ basket.mem_no }">
			<div>
                    
                    <div id="productBox">
                            <label><input type="checkbox" name="SelectBook"onclick="whatAll();" value="${ basket.b_no }"> <input type="hidden" id="b_no" value="${ basket.b_no }"> </label>
                            <img src="${pageContext.request.contextPath}/resources/images/book_cover/book_cover${ basket.img_no }.jpg">
                            <div id="titleBox">
                                <label id="bookName">${ basket.b_title }</label>
                                
                                <c:url value="bookDetail.pay" var="Detail">
                                <c:param name="b_no" value="${ basket.b_no }" />
                                </c:url>
                                
                                <div id="btnBox"><a href="${Detail}"><button id="btnInfo" class="bookInfo">상세보기</button></a>
                                <input type="hidden" id="BookName" value="${  basket.b_no  }">
                                <a href="${delete}"><button id="btnDelete" >삭제</button></a></div>
                                </div>
                                
                            	<label id="alongPrice">${ basket.b_price }원</label>
                        </div>
                <br>
            </div>
		</c:forEach>
         
        

                <br>
                <div id="lastSelectBox">
                <label class="allSelect2"><input type="checkbox" id="allSel" class="allSelClass" onclick="allCheck();"> 전체선택 </label>
                <button id="selectPriceDelete">선택상품삭제</button>
                </div>
            </div>

            
        </div>
        <c:url value="NextPayment.pay" var="delete">
              <c:param name="bookNum" value="${ basket.b_no }" />
              <c:param name="memNum" value="${ basket.mem_no }" />
        </c:url>
        
        <div id="basket_Right">
            <div id="Right_top">
            <label class="selectBookBox" >총 <label id="allBookCount"></label>권을 선택하셧습니다.</label>
            <label class="priceBox"><label>총 상품가격 </label><label class="AllPrice"></label>원</label>
            <label class="priceBox"><label>결제가격</label><label class="AllPrice"></label>원 </label>
            </div>
            <!-- <button id="Right_bot" onclick="location.href='NextPayment.pay'">결제하기</button> -->
            <button id="Right_bot" onclick="next()">결제하기</button>
        </div>

            
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
    
    var memNum = document.getElementById('memNum').value;
    var mem_no = [];
    mem_no.push(memNum);
    console.log(mem_no);
    var checkItem = [];
    
    function cleanBasket(){
    	location.href="<%= request.getContextPath()%>/basketList.pay";
    	
    }
    
	function selectDelete(){
		location.href="<%= request.getContextPath()%>/selectDelete.pay?checkItem" + checkItem + "&mem_no"+ mem_no;
	}
	
	/* $('#btnDelete').on('click',function(){
		swal ( "장바구니 삭제" ,  "선택항복을 삭제하였습니다.." ,  "success" );
	}); */
	
	
	 $('#selectPriceDelete').on('click',function(){
		 
		 for(var i=0; i<myCheck.length; i++){
			 //alert(i);
			 //console.dir(myCheck[i]);
			 if(myCheck[i].checked == true){
				 checkItem.push(myCheck[i].defaultValue); 
			 }
			}
		 
		 
		 console.log(checkItem);
		   $.ajax({
			url:'selectDelete.pay',
			data:{'checkItem[]':checkItem , 'mem_no[]':mem_no},
			traditional : true,
			success:function(data){
				if(data == "success"){
					cleanBasket();
					swal ( "장바구니 삭제" ,  "선택항복을 삭제하였습니다.." ,  "success" );
					
				}
			}
		})  
		
		});
	
    
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
	
	$(document).ready(function(){
		$('#allBookCount').text(bookCount);
		$('.AllPrice').text(allpriceText);
	})
    
   
	
    function NextPayment (){
    	location.href="<%= request.getContextPath()%>/NextPayment.pay?allpriceText"+allpriceText;
    }
    
	
	function next(){
		if(bookCount > 0){
		location.href='NextPayment.pay';
		}else{
			swal ( "책이없습니다." ,  "구매할 책이 없습니다." ,  "error" );
		}
	}
	
	<%-- $('.bookInfo').click(function(){
		b_no = $(this).next().val(); 
		//console.log($(this).next().val());
		location.href="<%= request.getContextPath()%>/bookDetail.pay?b_no"+b_no; 
	}) --%>
    
</script>
</html>
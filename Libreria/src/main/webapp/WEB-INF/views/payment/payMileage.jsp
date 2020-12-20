<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        *{margin:0; padding:0;}
        a{
   	text-decoration:none;
   }
        #title{
            width:550px;
            height:560px;
            background:lightgray;
            position:relative;
        }
        .lineBar{
            width:100%;
            height:50px;
            background:rgb(94, 107, 159);
            position:relative;
        }
        #topBar h3{
            color:white;
            padding:10px;
        }
        #bottomBar{
            top:460px;;
        }
        #mainTitle{
            margin:auto;
            position:absolute;
            left:calc(50% - 55px);
            top:5px;
            font-size:15px;
        }
        #topBox{
            width:90%;
            height:100px;
            margin-top:-30px;
            margin-left:auto;
            margin-right:auto;
            background:white;
            display:flex;
            flex-direction:column;
            font-size:15px;
            
            
        }
        #topBox > label{
            padding-left:20px;
        }

        #topBox > label:first-child{
            padding-top:10px;
        }

        #midBox{
            width:90%;
            height:200px;
            margin-top:20px;
            margin-left:auto;
            margin-right:auto;
            background:white;
            position:relative;
            
        }
        #resultBox{
            padding-top:20px;
            padding-left:20px;
        }

        #resultTop{
            padding-top:5px;
            font-size:30px;
            font-weight:bold;
            color:rgb(94, 107, 159);
        }
        #resultBot{
            padding-top:5px;
            display:flex;
            flex-direction:column;
        }
        #resultBot>label:last-child{
            padding-top:5px;
            color:rgb(94, 107, 159);
            font-size:30px;
            font-weight:bold;
        }
        #nextBtn{
            margin:auto;
            position:absolute;
            left:calc(50% - 15px);
            top:15px;
            font-size:15px;
            color:white;
            font-weight:bold;
            background:none;
            border:none;
        }
        #chBox{
            padding:10px;
            position:relative;
            top:90px;
        }
        

        

    </style>
</head>
<body>
    <section id="title">
        <div id="topBar" class="lineBar">
                <h3>LIBRERIA</h3>
                <h3 id="mainTitle">마일리지결제</h3>
        </div>
        <div id="bottomBar" class="lineBar">
                <button id="nextBtn" >다음</button>
        </div>

		
        <div id="topBox">
            <label>(주)역삼동 코딩머신</label>
            <label>보유 마일리지 : ${ User.mem_money }원</label>
            <label>상품 금액 : ${ AllPrice2 } 원</label>
        </div>
        
        <c:forEach items="${ BasketInfo }" var="basket">
             <input type="hidden" id="memNum" value="${ basket.mem_no }">
		</c:forEach>

        <div id="midBox">
            <div id="resultBox">
                <!-- <label>구매 후 마일리지</label> -->
                <div id="resultTop">
                    <!-- <label>50000M</label>
                    <label>-</label>
                    <label>19800W</label> -->
                </div>
                <div id="resultBot">
                    <!-- <label>구매 후 마일리지</label>
                    <label>30200M</label> -->
                </div>
            </div>
        </div>

        

        <label id="chBox"><input type="checkBox">상기의 내용을 확인하였습니다.</label>
    </section>
</body>
<script>
	
var allprice = [];
var allBook = [];
var checkItem = [];

var allpriceText = 0;

var memNum = document.getElementById('memNum').value;
var mem_no = [];
	 
mem_no.push(memNum);

<c:forEach items="${ BasketInfo }" var="basket">

checkItem.push("${ basket.b_no }");
allprice.push("${ basket.b_price }");
allBook.push("${ basket.b_title }");

</c:forEach>


for(var i = 0; i < allprice.length; i++){
	allpriceText += parseInt(allprice[i])
}

$(document).ready(function(){
	$('#allBookCount').text(bookCount);
	$('.AllPrice').text(allpriceText);
});


var buyLoot = "${pay}";

function popupSubmit() {

	/*  window.opener.location.reload(); */
	 window.opener.location.href = "../libreria"; 
    self.close();

}
$('#nextBtn').on('click',function(){
	$.ajax({
		url:'clearPayment.pay',
		data:{'checkItem[]':checkItem , 'mem_no[]':mem_no , 'allprice[]':allprice , 'buyLoot': buyLoot},
		traditional : true,
		success:function(data){
			if(data == "success"){
				/* swal ( "결제완료" ,  "결제가 완료되었습니다.." ,  "success" ); */
				alert("결제완료");
				/* location.href="../libreria"; */
			}
			popupSubmit();
		}
	}) ;
	
});
</script>
</html>
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
            left:calc(50% - 45px);
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
        #midBox>label{
            position:relative;
            top:20px;
            padding-left:20px;
            left:calc(50% - 61px);
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
            top:20px;
        }
        #bankList{
            width:100%;
            height:50%;
            display:flex;
            flex-direction:column;
            align-items:center;
            justify-content:space-between;
            padding-top:40px;
        }

        #bankTop{
            width:80%;
            display:flex;
            align-items:center;
            justify-content:space-between;

        }

        #bankBot{
            width:80%;
            display:flex;
            align-items:center;
            justify-content:space-between;

        }

        #botBox{
            width:90%;
            height:50px;
            margin-top:20px;
            margin-left:auto;
            margin-right:auto;
            background:white;
            position:relative;
            display:flex;
            align-items:center;
            justify-content:flex-start;
        }

        #botBox input{
            width:40px;
        }
        #payerName{
            padding-left:20px;
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

    </style>
</head>
<body>
    <section id="title">
        <div id="topBar" class="lineBar">
                <h3>LIBRERIA</h3>
                <h3 id="mainTitle">무통장입금</h3>
        </div>
        <div id="bottomBar" class="lineBar">

                <button id="nextBtn">다음</button>
        </div>


        <div id="topBox">
            <label>(주)역삼동 코딩머신</label>
            <label>상품명 : 공부란 무엇인가 외 </label>
            <label>제공기간 : 별도의 제공기간 없음</label>
            <label>상품 금액 : ${ bookPrice } 원</label>

        </div>
        <div id="midBox">
            <label>은행선택</label>
            <div id="bankList">
                <div id="bankTop">
                <label><input type="radio" name="bank">삼성</label>
                <label><input type="radio" name="bank">신한</label>
                <label><input type="radio" name="bank">우리</label>
                <label><input type="radio" name="bank">수협</label>
                <label><input type="radio" name="bank">씨티</label>
            </div>
            <div id="bankBot">
                <label><input type="radio" name="bank">농협</label>
                <label><input type="radio" name="bank">국민</label>
                <label><input type="radio" name="bank">롯데</label>
                <label><input type="radio" name="bank">현대</label>
                <label><input type="radio" name="bank">비씨</label>
            </div>
            </div>
        </div>
        
        <c:forEach items="${ BasketInfo }" var="basket">
             <input type="hidden" id="memNum" value="${ basket.mem_no }">
		</c:forEach>
        

        <div id="botBox">
                <div id="payerName">
                    <label>카드번호</label>
                    <label><input type="text">-<input type="text">-<input type="text">-<input type="text"></label>
                </div>
            </div>

        <label id="chBox"><input type="checkBox">상기의 내용을 확인하였습니다.</label>

    </section>
</body>
<script>
	

$('#nextBtn').on('click',function(){
	$.ajax({
		url:'DirectClearPayment.pay',
		data:{'memNum': "${memNum}" , 'bookNo': "${bookNo}" , 'bookPrice': "${bookPrice}" , 'pay':"${pay}" , 'UserNum' : "${ User.mem_no }"},
		//type:"get",
		traditional : true,
		success:function(data){
			if(data == "success"){
				alert("결제완료");
				location.href="../libreria";
			}
		}
	}) ;
	
});
</script>
</html>
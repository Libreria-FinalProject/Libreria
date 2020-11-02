<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        *{margin:0; padding:0;}
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

                <div id="nextBtn">다음</div>
        </div>


        <div id="topBox">
            <label>(주)역삼동 코딩머신</label>
            <label>상품명 : 공부란 무엇인가 외 </label>
            <label>임금 계좌 : 107-5677-1115-457 (농협 LIBRERIA)</label>
            <label>상품 금액 : 19800 원</label>

        </div>
        <div id="midBox">
            <label>무통장입금</label>
            <div id="bankList">
                <div id="bankTop">
                <labe><input type="radio" name="bank">삼성</labe>
                <labe><input type="radio" name="bank">신한</labe>
                <labe><input type="radio" name="bank">우리</labe>
                <labe><input type="radio" name="bank">수협</labe>
                <labe><input type="radio" name="bank">씨티</labe>
            </div>
            <div id="bankBot">
                <labe><input type="radio" name="bank">농협</labe>
                <labe><input type="radio" name="bank">국민</labe>
                <labe><input type="radio" name="bank">롯데</labe>
                <labe><input type="radio" name="bank">현대</labe>
                <labe><input type="radio" name="bank">비씨</labe>
            </div>
            </div>
        </div>

        <div id="botBox">
                <div id="payerName">
                    <label>입금자명</label>
                    <label><input type="text"></label>
                </div>
            </div>

        <label id="chBox"><input type="checkBox">상기의 내용을 확인하였습니다.</label>
        <div id="popUp">
                <label>결제에 실패하였습니다.</label>
                <button>확인</button>
     
           </div>
    
    </section>
</body>
</html>
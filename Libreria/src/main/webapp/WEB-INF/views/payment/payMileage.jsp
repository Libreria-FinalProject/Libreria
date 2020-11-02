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

                <div id="nextBtn">다음</div>
        </div>


        <div id="topBox">
            <label>(주)역삼동 코딩머신</label>
            <label>상품명 : 공부란 무엇인가 외 </label>
            <label>보유 마일리지 : 50000원</label>
            <label>상품 금액 : 19800 원</label>
        </div>

        <div id="midBox">
            <div id="resultBox">
                <label>구매 후 마일리지</label>
                <div id="resultTop">
                    <label>50000M</label>
                    <label>-</label>
                    <label>19800W</label>
                </div>
                <div id="resultBot">
                    <label>구매 후 마일리지</label>
                    <label>30200M</label>
                </div>
            </div>
        </div>

        

        <label id="chBox"><input type="checkBox">상기의 내용을 확인하였습니다.</label>
    </section>
</body>
</html>
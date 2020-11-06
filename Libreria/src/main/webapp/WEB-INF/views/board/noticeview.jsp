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

   .notice_title{
       padding-top: 75px;
       padding-bottom: 40px;
       font-size: 35px;
       font-weight: bold;
   }

   .notice_content{
       padding:10px;
       font-size: 15px;
   }

   .notice_content > p {
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

   .rectify{
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

   #notice_comment{
       padding:10px;
   }

   #comment{
       font-size: 20px;
       padding-bottom: 20px;
   }

   #comment-input{
       font-size: 15px;
       width: 400px;
       padding-left: 10px;
       height: 30px;
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
            <input type="text" id="input_search" placeholder="�˻�� �Է��ϼ���">
            <div id="div_head_btns">
               <button class="btn_head">ȸ������</button>
               <button class="btn_head">�α���</button>
            </div>
         </div>
         <div id="nav_menu">
            <ul id="menu_ul">
               <li id="menu_li"></li>
               <li>��������</li>
               <li>�ܱ�����</li>
               <li>�߰���</li>
               <li>������</li>
               <li>��ٱ���</li>
            </ul>
         </div>
   </nav>
   <section>
       <div class="notice_header">
        <h1 class="notice_title">
            	ī�� ����� ����� ���� �ʽ��ϴ�.
        </h1>  
    </div>
    <div class="nickname" style="padding-left: 10px; padding-bottom: 20px;">
        �ۼ��� :  <!--${} �ۼ��� ������ �����ͼ� �Է� -->
    </div>
    <div class="categoty" style="padding-left: 10px; padding-bottom: 20px;">
        ī�װ� : <!--${} ������ ī�װ� ������ �����ͼ� �Է� -->
    </div>
    <div class="notice_content">
        <p>�ȳ��ϼ���.</p>
        <p>���� �̹��� ó�� ������ �ϰ� ī�� ����� �Ϸ��� �ϴµ�</p>
        <p>ī�� ��ȣ�� CVC��ȣ�� ��й�ȣ�� ���� ����� �Է��� �ߴµ��� ����ؼ� ��ġ ���� �ʴ´ٰ� ���â�� �����׿�</p>
        <p>�׷��� å�� �뿩�� ���� ���ϰ� �ֽ��ϴ�. �ִ��� ���� �ذ��� ��Ź�帳�ϴ�.</p>
    </div>

    <div id="notice_comment"> <!-- ����� �����ڸ� �ۼ��� ���� -->
        <div id="comment">��� : <!--${} ��� ������ �����ͼ� �Է� -->
        <input id="comment-input" placeholder="����� �Է��� �ּ���."> 
        <button id="submit" style="font-size: 15px; padding:4px;">���</button></div>
    </div>

    <div class="list_button" align="center">
        <button class="back">�������</button>
        <button class="rectify" onclick='alert("���� ��� �Ǿ� �ִ� ���� ������ ���� �Ͻðڽ��ϱ�?")'>�����ϱ�</button> <!-- �ۼ��ڸ��� ��ư�� ���̰� �ٸ� ����ڿ��� ������ �ʴ´�.-->
        <button class="delete" onclick='alert("���� ��� �Ǿ� �ִ� ���� ������ ���� �Ͻðڽ��ϱ�?")'>�����ϱ�</button> <!-- �ۼ���/������ ��� ��ư�� ���̰�, ��α��� ����� Ȥ�� ���ۼ����� ��� ��ư�� ������ �ʴ´�. -->
    </div>
    
    <!-- ������δ� ����� ��ü Ȯ�� ����, �����ϱ�� �ۼ��ڸ��� ���� �����ϱ�� �ۼ��ڿ� �����ڸ��� ����-->
   </section>
   <footer id="footer_container">
      <div>
         <span>����� ������ ���ﵿ ��������</span> | <span>��ǥ : ���ǥ</span> | <span>����ڵ�Ϲ�ȣ : 123-45-67890</span>
         <br><br>
         <span>Copyright(C) LIBRERIA  all  rights reserved.</span>
      </div>
   </footer>
</body>
</html>
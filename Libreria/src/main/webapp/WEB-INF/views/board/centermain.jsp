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
       font-size: 30px; color:Black; font: border 3; padding-bottom: 5px;
   }
   .notice_list_item{
        padding-top: 10px; padding-bottom: 10px; color:black;
   }
   .notice_list_font{
        text-decoration: none;
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
    <br><br>
    <div class="notice">
        <h3 class="notice_title"><a href="boardlist.jsp">��������</a></h3>
        <ul class="notice_list">
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[��������]�߰��� ���� �� �Ǹ� ��� �ȳ��� ���� �������� �Դϴ�.</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[��������]�̿� ��� �ȳ��� ���� ���������Դϴ�.</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[��������]ī�� ��� ����� ���� ���������Դϴ�.</a>
            </li>
            <hr>
        </ul>
    </div>

    <br><br><br><br>

    <div class="notice">
        <h3 class="notice_title"><a href="FAQlist.jsp">FAQ</a></h3>
        <ul class="notice_list">
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[FAQ] ���� ȯ�� / ��� ����� ���� FAQ</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[FAQ] ���̵� / �н����� ã�⿡ ���� FAQ</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[FAQ] ����� ī�� ���� ����� ���� FAQ</a>
            </li>
            <hr>
        </ul>
    </div>

    <br><br><br><br>

    <div class="notice">
        <h3 class="notice_title"><a href="noticelist.jsp">���ǻ���</a></h3>
        <ul class="notice_list">
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[���ǻ���]�߰��� ���� �� ȯ�� ����� ������?</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[���ǻ���]ī�� ����� ����� ���� �ʽ��ϴ�.</a>
            </li>
            <hr>
            <li class="notice_list_item">
                <a href="#" class="notice_list_font">[���ǻ���]å ��۱Ⱓ�� ������� �־� ��Ҹ� �Ϸ� �ϴµ� ȯ���� �����Ѱ���?</a>
            </li>
            <hr>
        </ul>
    </div>
    <br><br><br><br><br><br>
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
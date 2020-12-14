<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#faq_container{
		margin-top: 30px;
	}
	
	#faq_container #small_title{
		color: #9ea7ad;
		font-size: 13px;
	}
	
	#faq_header{
		display: flex;
		margin-top: 30px;
	}
	
   .faq_title{
      flex: 7;
      font-size:32px;
      font-weight: bold;
   }
   
     #insertBtn{
   		flex:1;
		cursor: pointer;
		background-color: rgb(94, 107, 159);
		color: #ffffff;
		border: none;
		border-radius: 4px;  
		font-size: 16px;
		font-weight: bold;
   }
   
   

   .faq_list{
      text-align: left;
      padding:10px;
      font-size:16px;
      list-style: none;
      margin-top: 50px;
   }
   
    .faq_list li{
   		display: flex;
    	border-top: 1px solid #e6e8eb;
    	padding: 20px 20px 20px 0;
    	color: #333333;
    	text-align: right;
    }
    .faq_list a{
    	flex: 1;
    	text-align: left;
    }


   .faq_list_font{
      font-size: 20px;   
      font-weight: bold;

   }
   

   
   #paging_div{
	margin-top: 30px;
	text-align: center;
	}
   
   
   #paging_div button{
	background: #eaeaea;
	border: none;
	border-radius: 4px;
	width:40px; height: 40px;
	font-size: 16px;
	color: #333;
	cursor: pointer;
	}
	
	.paging_selected_btn{
	    background-color: rgb(94, 107, 159) !important;
	    color: #ffffff !important;
	}
	.sell_table{
		font-size: 14px !important;
	}
	.sell_table td:first-child{
		padding-left:20px;
	}
   
   #faq_search{
   		text-align: right;
   }
   #faq_search_div{
	   display: inline-block;
	   	border: 1px solid #cccccc;
	   	width:180px;
	   	height:20px;
	   	padding: 5px 0;
	   	margin-top: 10px;
   }
   #faq_search_div input{ 
   		width:140px;
   		height: 20px;
   		margin: auto 0;
   		border: none;
   		vertical-align: super;
   
  	} 
  	
  	#faq_search_div img{
		height: 20px;
		margin-right: 10px;
		cursor: pointer;
}
   section a:link { color: #333333; text-decoration: none;}
   section a:visited { color: gray; text-decoration: none;}
   section a:hover { color:  #333333; text-decoration: none;}

   
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   <section>
         <div id="faq_container">
         <div id="small_title">LIBRERIA 고객센터 > FAQ</div>
         <div id="faq_header"><div class="faq_title">FAQ</div>
         <c:if test="${ loginUser.mem_grade eq 'admin'}"><button id="insertBtn">게시글 작성</button></c:if></div>
         <div id="faq_search"><div id="faq_search_div"><input type="text" id="faq_search_input"><img alt="검색" id="search_icon" src="${pageContext.request.contextPath}/resources/images/icon_search.png"></div></div>
            <ul class="faq_list">
            	<c:if test="${ empty faqList }">
            		<li>조회 결과가 없습니다.</li>
            	</c:if>
            	<c:if test="${!empty faqList }">
            		<c:forEach var="faq" items="${faqList }">
            			<li><a href="FAQSelect.bd?bo_no=${faq.bo_no}">[FAQ] ${faq.bo_title }</a><span>${faq.bo_date }</span></li>
            		</c:forEach>
            	</c:if>
             <!--   <li><a href="#1" >[FAQ] 마일리지 사용 방법에 대하여</a></li>
               <li><a href="#2">[FAQ] 아이디 / 비밀번호 찾는 방법</a></li>
               <li><a href="#3">[FAQ] 등록한 카드 해지 방법</a></li>
               <li><a href="#4">[FAQ] 주문 취소 방법</a></li> -->
            </ul>
         </div>
        <div id="paging_div">
			<c:if test="${pi.currentPage>1}">
				<c:if test="${search==null }">
				<c:url var="before" value="FAQList.bd">
					<c:param name="page" value="${pi.currentPage-1 }"/>
				</c:url>
				</c:if>
				<c:if test="${ search != null}">
					<c:url var="before" value="searchFAQ.bd">
						<c:param name="page" value="${pi.currentPage-1 }"/>
						<c:param name="search" value="${search}"/>
					</c:url>
				</c:if>
				<button type="button" onclick="location.href='${before}'">&lt;</button>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:if test="${p eq pi.currentPage}">
					<button type="button"  class="paging_selected_btn">${p }</button>
				</c:if>
				
				<c:if test="${p ne pi.currentPage }">
					<c:if test="${search==null }">
					<c:url var="pagination" value="FAQList.bd">
							<c:param name="page" value="${ p }"/>
					</c:url>
					</c:if>
					<c:if test="${search!=null }">
					<c:url var="pagination" value="searchFAQ.bd">
							<c:param name="page" value="${ p }"/>
							<c:param name="search" value="${search}"/>
					</c:url>
					</c:if>
					<button type="button" onclick="location.href='${pagination}'">${p}</button>
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage < pi.maxPage }">
				<c:if test="${search==null }">
				<c:url var="after" value="FAQList.bd">
					<c:param name="page" value="${pi.currentPage+1 }"/>
				</c:url>
				</c:if>
				<c:if test="${search!=null }">
				<c:url var="after" value="FAQList.bd">
					<c:param name="page" value="${pi.currentPage+1 }"/>
					<c:param name="search" value="${search}"/>
				</c:url>
				</c:if>
				<button type="button" onclick="location.href='${after}'">&gt;</button>
			</c:if>
		</div>
		<script type="text/javascript">
			$('#faq_search_input').keyup(function(evt){
				if(evt.keyCode==13){   // 엔터키 눌렀을 때
					search();
				};
				
			});
			
			$('#search_icon').click(function(){
				search();			
			});
			
		
			$("#insertBtn").click(function(){
					location.href="FAQWriteForm.bd";
			});	
			
			function search(){
				search_text = $("#faq_search_input").val();
				if(search_text==""){
					swal("","검색어를 입력해주세요.","info");
					return;
				}else if(search_text.length<2){
					swal("","검색어는 두글자 이상 입력해주세요.","info");
					return;
				}else{
					location.href="searchFAQ.bd?search="+search_text;					
				}
			}
		</script>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
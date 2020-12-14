<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
   #notice_container{ 
		margin-top: 30px;
	}
	
	#notice_container #small_title{
		color: #9ea7ad;
		font-size: 13px;
	}
	
	#notice_header{
		display: flex;
		margin-top: 30px;
	}
   .notice_title{
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

   .notice_list{
      text-align: left;
      padding:10px;
      font-size:16px;
      list-style: none;
      margin-top: 50px;
   }
   
  
   
    .notice_list li{
   		display: flex;
    	border-top: 1px solid #e6e8eb;
    	padding: 20px 20px 20px 0;
    	color: #333333;
    	text-align: right;
    }
    .notice_list a{
    	flex: 1;
    	text-align: left;
    }
    
    .notice_list span{
    	padding: 0 15px;
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
	}
	
	.paging_selected_btn{
	    background-color: rgb(94, 107, 159) !important;
	    color: #ffffff !important;
	}

   section a:link { color: #333333; text-decoration: none;}
   section a:visited { color: gray; text-decoration: none;}
   section a:hover { color:  #333333; text-decoration: none;}
   
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   <section> 
         <div id="notice_container">
         <div id="small_title">LIBRERIA 고객센터 > 공지사항</div>
         <div id="notice_header"><div class="notice_title">공지사항</div>
         <c:if test="${ loginUser.mem_grade eq 'admin'}"><button id="insertBtn">게시글 작성</button></c:if></div>
            <ul class="notice_list">
            	<c:if test="${ empty noticeList }">
            		<li>조회 결과가 없습니다.</li>
            	</c:if>
            	<c:if test="${!empty noticeList }">
            		<c:forEach var="notice" items="${noticeList }">
            			<li><a href="NoticeSelect.bd?bo_no=${notice.bo_no}">[공지사항] ${notice.bo_title }</a><span>${notice.bo_date }</span><span>${notice.bo_count }</span></li>
            		</c:forEach>
            	</c:if>
            </ul>
         </div>
        <div id="paging_div">
			<c:if test="${pi.currentPage>1}">
				<c:url var="before" value="NoticeList.bd">
					<c:param name="page" value="${pi.currentPage-1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${before}'">&lt;</button>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:if test="${p eq pi.currentPage}">
					<button type="button"  class="paging_selected_btn">${p }</button>
				</c:if>
				
				<c:if test="${p ne pi.currentPage }">
					<c:url var="pagination" value="NoticeList.bd">
							<c:param name="page" value="${ p }"/>
					</c:url>
					<button type="button" onclick="location.href='${pagination}'">${p}</button>
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage < pi.maxPage }">
			<c:url var="after" value="NoticeList.bd">
					<c:param name="page" value="${pi.currentPage+1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${after}'">&gt;</button>
			</c:if>
		</div>
		<script type="text/javascript">
			$("#insertBtn").click(function(){
					location.href="NoticeWriteForm.bd";
			});	
		</script>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#qna_container{ 
		margin-top: 30px;
	}
	
	#qna_container #small_title{
		color: #9ea7ad;
		font-size: 13px;
	}
	
	#qna_header{
		display: flex;
		margin-top: 30px;
	}
   .qna_title{
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

   .qna_list{
      text-align: left;
      padding:10px;
      font-size:16px;
      list-style: none;
      margin-top: 50px;
   }
   
  
   
    .qna_list li{
   		display: flex;
    	border-top: 1px solid #e6e8eb;
    	padding: 20px 20px 20px 0;
    	color: #333333;
    	text-align: right;
    }
    .qna_list a{
    	flex: 1;
    	text-align: left;
    }
    
    .qna_list span{
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
	.reply_icon{
		background-image: url("resources/images/reply.png");
		background-size: contain;
		background-repeat : no-repeat;
    	padding:0px 8px 0px 22px;
    	font-style: normal;
	}
	
   section a:link { color: #333333; text-decoration: none;}
   section a:visited { color: gray; text-decoration: none;}
   section a:hover { color:  #333333; text-decoration: none;}
   
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
   <section>
         <div id="qna_container">
         <div id="small_title">LIBRERIA 고객센터 > Q&A</div>
         <div id="qna_header"><div class="qna_title">Q&A</div><button id="insertBtn">게시글 작성</button></div>
            <ul class="qna_list">
            	<c:if test="${ empty qnaList }">
            		<li>조회 결과가 없습니다.</li>
            	</c:if>
            	<c:if test="${!empty qnaList }">
            		<c:forEach var="qna" items="${qnaList }" varStatus="status">
            			<li><a href="QNASelect.bd?bo_no=${qna.bo_no}">[Q&A] ${qna.bo_title }
            			<c:if test="${replyList[status.index].reply_count > 0}">
        					 <i class="reply_icon" style="margin-left: 10px;">${replyList[status.index].reply_count}</i>
            			</c:if>
            			</a>
            			
            			<span>${qna.bo_date }</span><span>${qna.bo_count }</span></li>
            		</c:forEach>
            	</c:if>
            </ul>
         </div>
        <div id="paging_div">
			<c:if test="${pi.currentPage>1}">
				<c:url var="before" value="QNAList.bd">
					<c:param name="page" value="${pi.currentPage-1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${before}'">&lt;</button>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:if test="${p eq pi.currentPage}">
					<button type="button"  class="paging_selected_btn">${p }</button>
				</c:if>
				
				<c:if test="${p ne pi.currentPage }">
					<c:url var="pagination" value="QNAList.bd">
							<c:param name="page" value="${ p }"/>
					</c:url>
					<button type="button" onclick="location.href='${pagination}'">${p}</button>
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage < pi.endPage }">
			<c:url var="after" value="QNAList.bd">
					<c:param name="page" value="${pi.currentPage+1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${after}'">&gt;</button>
			</c:if>
		</div>
	<script type="text/javascript">
		$(function(){
			console.log("${replyList}");
		});
		$("#insertBtn").click(function(){
			var loginUser = "${loginUser}";
			if(loginUser == ''){
				swal("","로그인 후 이용가능합니다.","info");
				return false;
			}else{
				location.href="QNAWriteForm.bd";
			}
		});	
	</script>
   </section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
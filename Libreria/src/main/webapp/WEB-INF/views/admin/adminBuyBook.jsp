<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/buy&sell.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
		<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">관리자 페이지</li>
				<li class="side_nav_list_li"><span class="icon_person">회원관리 </span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_dollar1">상품구매</span></li>
				<li class="side_nav_list_li"><span class="icon_dollar2">상품등록</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">판매내역 조회</span>
			<table id="buy_sell_table" class="sell_table admin_buy_table">
				<tr>
					<th>도서명</th>
					<th>판매일자</th>
					<th>희망머니</th>
					<th>상세정보</th>
				</tr>
				<c:if test="${ empty bookList }">
				<tr>
					<td colspan="4">조회 결과가 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${!empty bookList }">
					<c:forEach var="book" items="${bookList }">
						<tr>
							<td>${book.b_title }</td>
							<td>${book.sell_date }</td>
							<td >${book.sell_money }</td>
							<td><button onclick="popUp(${book.sell_num})">상세정보</button></td>
						</tr>
					</c:forEach>
				</c:if>
			
			</table>
			<div id="paging_div">
			<c:if test="${pi.currentPage>1}">
				<c:url var="before" value="buyBookList.ad">
					<c:param name="page" value="${pi.currentPage-1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${before}'">&lt;</button>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:if test="${p eq pi.currentPage}">
					<button type="button"  class="paging_selected_btn">${p }</button>
				</c:if>
				
				<c:if test="${p ne pi.currentPage }">
					<c:url var="pagination" value="buyBookList.ad">
							<c:param name="page" value="${ p }"/>
					</c:url>
					<button type="button" onclick="location.href='${pagination}'">${p}</button>
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage < pi.endPage }">
			<c:url var="after" value="buyBookList.ad">
					<c:param name="page" value="${pi.currentPage+1 }"/>
				</c:url>
				<button type="button" onclick="location.href='${after}'">&gt;</button>
			</c:if>
		</div>
		</div>
		
		<div id="admin_popup">
			<div id="admin_popup_content">
			<input type="hidden" id="popup_b_no">
			<input type="hidden" id="popup_sell_num">
			<input type="hidden" id="popup_mem_no">
			<input type="hidden" id="popup_sell_money">
			<span id="popup_title"></span><br>
			<span id="popup_ganre"></span><br>
			<span id="popup_writer"></span><br>
			<span id="popup_publisher"></span><br>
			<span id="popup_money"></span><br>
			</div>
			<div id="admin_popup_buttondiv">
			<button id="popup_close_btn">닫기</button><button id="buyBtn">구매</button>			
			</div>
		</div>
	</section>
	<script type="text/javascript">
			$(function(){
				$('#side_nav').find('li').eq(1).click(function(){
					location.href="adminpage.ad";
				});
				$('#side_nav').find('li').eq(2).click(function(){
					location.href="buyBookList.ad";
				});
				$('#side_nav').find('li').eq(3).click(function(){
					location.href="insertBook.ad";
				});
				
				$('#popup_close_btn').click(function(){
					$('#admin_popup').css("display","none");
				});
				
				$('#buyBtn').click(function(){
					var b_no = $("#popup_b_no").val();
					var sell_num = $("#popup_sell_num").val();
					var mem_no = $("#popup_mem_no").val();
					var sell_money = $("#popup_sell_money").val();
					$.ajax({
						url: "buyBook.ad",
						data: {b_no:b_no, sell_num:sell_num, mem_no:mem_no, sell_money:sell_money},
						success: function(data){
							if(data==1){
								swal("","구매가 완료되었습니다.","info")
								.then((ok)=>{
									if(ok){
										location.reload();
									}
								});
							}else{
								swal("","작업 도중 오류가 발생하였습니다.\n다시 시도해주세요.","error");
							}
						}
					});
				});
			});
			
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			function popUp(sell_num){
				$.ajax({
					url: "getSellDataInfo.ad",
					data: {sell_num:sell_num},
					success: function(data){
							$("#popup_b_no").val(data.b_no);
							$("#popup_sell_num").val(data.sell_num);
							$("#popup_mem_no").val(data.mem_no);
							$("#popup_sell_money").val(data.sell_money);
							$("#popup_title").text("도서명 : "+data.b_title);
							$("#popup_ganre").text("장르 : "+data.bc_ct);
							$("#popup_writer").text("저자 : "+data.bwp_name);
							$("#popup_publisher").text("출판사 : "+data.b_pub_name);
							$("#popup_money").text("희망머니 : "+numberWithCommas(data.sell_money));
					}
				});
				$('#admin_popup').css("display","block");
			}
		</script>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
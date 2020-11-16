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
				<li class="side_nav_list_li">&gt; <span class="icon_person">회원관리 </span></li>
				<li class="side_nav_list_li"><span class="icon_dollar1">상품구매</span></li>
				<li class="side_nav_list_li"><span class="icon_dollar2">상품등록</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<form method="post" id="memberForm">
			<span id="container_title">회원 관리</span>
			<table id="buy_sell_table" class="confirmMoney_table">
				<tr>
					<th><input type="checkbox" name="check_mem_total" id="check_mem_total">회원명</th>
					<th>회원이메일</th>
					<th>최종접속일자</th>
				</tr>
				<c:if test="${ empty memberList }">
					<tr>
						<td colspan="3">조회 결과 대상 회원이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty memberList }">
					<c:forEach var="m" items="${memberList }">
						<tr>
							<td><input type="checkbox" name="check_mem" class="check_mem" value="${m.mem_no}">${m.mem_name}</td>
							<td>${m.mem_email }</td>
							<td>${m.mem_logindate }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div id="paging_div">
				<c:if test="${pi.currentPage>1}">
					<c:url var="before" value="confirmMoney.me">
						<c:param name="page" value="${pi.currentPage-1 }"/>
					</c:url>
					<button type="button" onclick="location.href='${before}'">&lt;</button>
				</c:if>
				
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
					<c:if test="${p eq pi.currentPage}">
						<button type="button"  class="paging_selected_btn">${p }</button>
					</c:if>
				
					<c:if test="${p ne pi.currentPage }">
						<c:url var="pagination" value="confirmMoney.me">
								<c:param name="page" value="${ p }"/>
						</c:url>
						<button type="button" onclick="location.href='${pagination}'">${p}</button>
					</c:if>
				</c:forEach>

				<c:if test="${pi.currentPage < pi.endPage }">
					<c:url var="after" value="confirmMoney.me">
						<c:param name="page" value="${pi.currentPage+1 }"/>
					</c:url>
					<button type="button" onclick="location.href='${after}'">&gt;</button>
			</c:if>
			</div>
			<div id="rest_div">
			<c:if test="${!empty memberList }">
				<button type="button" id="rest_btn" onclick="changeResting();">휴면회원으로 전환</button>
			</c:if>
			</div>
			</form>
		</div>
		<script type="text/javascript">
			$(function(){
				$('#side_nav').find('li').eq(1).click(function(){
					location.href="adminpage.ad";
				});
				$('#side_nav').find('li').eq(2).click(function(){
					location.href="buyBook.ad";
				});
				$('#side_nav').find('li').eq(3).click(function(){
					location.href="insertBook.ad";
				});
				
				$('#check_mem_total').click(function(){
					if($(this).is(":checked")){
						$(".check_mem").prop("checked",true);
					}else{
						$(".check_mem").prop("checked",false);
					}
				});
				
				$(".check_mem").click(function(){
					var check_mem_arr= $(".check_mem");
					var flag = 0;
					if($(this).is(":checked")){
						for(var i=0; i<check_mem_arr.length; i++){
							if(check_mem_arr[i].checked){
								flag++;
							}
						}
						if(flag >=6){
							$("#check_mem_total").prop("checked",true);
						}
					}else{
						$("#check_mem_total").prop("checked",false);	
					}
				});
			});
			
			function changeResting(){
				/////////////체크된 박스 개수 체크
				var check_count = 0;
				$('input[name=check_mem]').each(function(index,item){			
					if(item.checked){
						check_count++;
					}
				});
				
				if(check_count == 0){
					swal("","전환할 회원을 선택해주세요.","info");
				}else{
					var form = $('#memberForm').serialize();
					var check_mem_arr = $('[name=check_mem]');
					console.log(check_mem_arr);
					$.ajax({
						url: "changeResting.ad",
						type:"POST",
						data: form,
						success: function(data){
							if(data==1){
								swal("","휴면 전환 처리 되었습니다.","info")
								.then((ok)=>{
									if(ok){								
										location.href="adminpage.ad"
									}
								});
							}else{
								swal("","전환 중 에러 발생. 다시 시도해주세요.","info")
								.then((ok)=>{
									if(ok){
										location.href="adminpage.ad";
									}
								});
							}
						},
						error: function(){
							alert('ajax 에러');
						}
					});
				}
				
			}
		</script>
	</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
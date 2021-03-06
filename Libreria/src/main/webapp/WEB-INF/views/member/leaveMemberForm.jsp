<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/leave.css"/>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
		<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">마이 페이지</li>
				<li class="side_nav_list_li"><span class="icon_person">회원정보 변경 </span></li>
				<li class="side_nav_list_li"><span class="icon_dollar1">구매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_dollar2">판매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_card">결제카드 등록</span></li>
				<li class="side_nav_list_li"><span class="icon_wallet">머니 충전</span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">회원 탈퇴</span>
			<div id="leave_div">
				<span class="font_violet">"다음 사항을 꼭 확인해주세요."</span><br>
				<span>사용하지 않은 머니는 즉시 소멸되며 환불받을 수 없습니다.</span><br>
				<span class="font_red">잔여머니 : <span id="mem_money"></span>원</span><br>
				<span>탈퇴가 완료되면 가입한 이메일로 가입할 수 없습니다.</span><br>
				<span class="font_violet">"본인 확인을 위해 비밀번호를 입력해주세요."</span><br>
				<input type="password" placeholder="비밀번호 입력" id="pwd_leave" name="pwd_leave"><br>
				<div id="leave_subdiv">
					<span class="warning_icon"></span>탈퇴가 완료된 계정은 다시 복구할 수 없습니다.
				</div> 
				<div id="leave_subdiv2">
					<input type="checkbox" id="ck_leave"> <div>위 내용을 이해했으며, 모두 동의합니다.</div><br>
					<button type="submit" onclick="return leave()">회원 탈퇴</button>
				</div>
				<input type="hidden" id="no_leave" name="no_leave" value="${loginUser.mem_no }"> 
			</div>
	
		</div>
		<script type="text/javascript">
			$(function(){
				$('#mem_money').text(numberWithCommas("${loginUser.mem_money}")); 
				
				$('#side_nav').find('li').eq(1).click(function(){
					location.href="mypage.me";
				});
				$('#side_nav').find('li').eq(2).click(function(){
					location.href="memberBuy.me";
				});
				$('#side_nav').find('li').eq(3).click(function(){
					location.href="memberSell.me";
				});
				$('#side_nav').find('li').eq(4).click(function(){
					location.href="registCard.me";
				});
				$('#side_nav').find('li').eq(5).click(function(){
					location.href="chargeMoney.me";
				});
				$('#side_nav').find('li').eq(6).click(function(){
					location.href="leaveForm.me";
				});
			
				
				$('#leave_subdiv2').find('div').click(function(){
					if($('#leave_subdiv2').find('input').prop("checked")){
						$('#leave_subdiv2').find('input').prop("checked",false);
					}else{
						$('#leave_subdiv2').find('input').prop("checked",true);
					}
				});
			});
			
			
			
			function leave(){
				var pwd_leave = $.trim($("#pwd_leave").val());
				var no_leave = $("#no_leave").val();
				if(pwd_leave.length == 0){
					swal("","비밀번호를 입력해주세요.","info")
					.then((ok)=>{
						if(ok){
							$("#pwd_leave").focus();
						}
					});
					return;
				}
				if(!$("#ck_leave").prop("checked")){
					swal("","주의사항에 동의해주세요.","info");
					return;		
				}
				
				swal({
				title:"",
				text: "정말로 탈퇴하시겠습니까?",
				icon: "warning",
				buttons: ["취소","확인"]})
				.then((ok)=>{
					if(ok){
						$.ajax({
							url: "leave.me",
							type: "post",
							data: {"no_leave":no_leave, "pwd_leave":pwd_leave},
							dataType: "json",
							success: function(data){
								console.log(data);
								if(data.type=="complete"){
									swal("회원탈퇴",data.message,"success")
									.then((ok)=>{
										if(ok){
												location.href="/libreria";
										}
									});
								}else{
									swal("회원탈퇴",data.message,"warning")
									.then((ok)=>{
										if(ok){
											$("#pwd_leave").val("");
											$("#ck_leave").prop("checked",false);
										}
									});
								}					
							},
							error: function(){
								alert("ajax 실패");
							}
						});			
					}
				});
			}
			
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		</script>
	</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
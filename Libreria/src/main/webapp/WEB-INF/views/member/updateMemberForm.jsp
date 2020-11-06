<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/updateMember.css"/>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
	<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">마이 페이지</li>
				<li class="side_nav_list_li">&gt; <span class="icon_person">회원정보 변경 </span></li>
				<li class="side_nav_list_li"><span class="icon_dollar1">구매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_dollar2">판매내역 조회</span></li>
				<li class="side_nav_list_li"><span class="icon_card">결제카드 등록</span></li>
				<li class="side_nav_list_li"><span class="icon_wallet">머니 충전</span></li>
				<li class="side_nav_list_li"><span class="icon_logout">회원 탈퇴</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">회원정보 변경</span>.
			<form method="post" name="updateForm" id="updateForm">
				<input type="hidden" name="mem_no" value="${loginUser.mem_no }">
				<table id="memberInfo_table">
					<tbody>
						<tr>
							<td class="td_first">이메일</td>
							<td><input type="text" name="mem_email" id="mem_email" readonly value="${loginUser.mem_email }"></td>
						</tr>
						<tr>
							<td  class="td_first">이름</td>
							<td><input type="text" name="mem_name" id="mem_name" value="${loginUser.mem_name }" maxlength="20"></td>
						</tr>
						<tr>
							<td class="td_first">비밀번호 변경</td>
							<td id="td_password">
							    <input type="password" placeholder="현재 비밀번호" name="cur_pwd" id="cur_pwd" maxlength="20"><br>
								<input type="password" placeholder="새 비밀번호" name="mem_pw" id="new_pwd1" maxlength="20" ><br>
								<input type="password" placeholder="새 비밀번호 확인" name="new_pwd2" id="new_pwd2" maxlength="20" >
							</td>
						</tr>
						<tr>
							<td class="td_first">생년월일</td>
							<td>
								<input type="date" name="mem_birth" value="${loginUser.mem_birth }">
							</td>
						</tr>
						<tr>	
							<td class="td_first">연락처</td>
							<td><input type="text" id="mem_tel" name="mem_tel" value="${loginUser.mem_tel }" maxlength="13"></td>
						</tr>
						<tr>
							<td class="td_first">배송지</td>
							<td id="td_address"><input type="text" id="post_no" readonly><button type="button" class="searchAddress">검색</button><br>
							<input type="text" id="main_address" readonly ><br>
							<input type="text" id="sub_address">
							<input type="hidden" name="mem_address" id="mem_address"></td>
						</tr>
						<tr >
							<td  class="td_first">관심사</td>
							<td id="td_interest">
								<input type="checkbox" name="mem_interest" class="ck_interest" value="소설"><span> 소설 </span>
								<input type="checkbox" name="mem_interest" class="ck_interest" value="경영/경제"><span> 경영/경제 </span>
								<input type="checkbox" name="mem_interest" class="ck_interest" value="자기계발"><span> 자기계발 </span>
								<br>
								<input type="checkbox" name="mem_interest" class="ck_interest" value="에세이/시"><span> 에세이/시 </span>
								<input type="checkbox" name="mem_interest" class="ck_interest" value="여행"><span> 여행 </span>
								<input type="checkbox" name="mem_interest" class="ck_interest" value="종교"><span> 종교 </span>
								<br> 
								<input type="checkbox" name="mem_interest" class="ck_interest" value="외국어"><span> 외국어 </span>
								<input type="checkbox" name="mem_interest" class="ck_interest" value="과학"><span> 과학 </span>
								<input type="checkbox" name="mem_interest" class="ck_interest" value="컴퓨터/IT"><span> 컴퓨터/IT</span></td>
						</tr>
					</tbody>
				</table>
				<button type="button" id="update_btn" onclick="validate();">변경</button>
			</form>
		</div>
		<script type="text/javascript">
		    var ck_count = 0;
			$(function(){
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
				
				////////////////////////////  주소  정제 후 배치
				
				var address = "${loginUser.mem_address}";
				var post_num = address.split("/");
				$("#post_no").val(post_num[0]);
				$("#main_address").val(post_num[1]);
				if(post_num[2] != null){
					$("#sub_address").val(post_num[2]);					
				}
				
				//////////////////////////////////////  관심사 체크박스 체크표시
				var interests = "${loginUser.mem_interest}";
				var interest_arr = interests.split(",");
				var ck_interest = $(".ck_interest");
				
			    for(var i=0;i<ck_interest.length;i++){
			    	for(var j=0 ; j<interest_arr.length; j++){
				    	if(ck_interest[i].value == interest_arr[j]){
				    		ck_interest[i].checked=true;
				    	}
			    	}	    	
			    }
	
			});
			
			
			//////////////////////////////////////
			//////////////////////////////////////
			$(".ck_interest").click(function(){ // 체크박스 클릭 시 이벤트
				countCheckBoxFn();
				
				if(ck_count > 3){
					alert("최대 3개까지 선택가능합니다.");
					$(this).prop("checked",false);
				}
			});
			//////////////////////////////////////
			function countCheckBoxFn(){ // 선택되어진 체크박스의 개수를 구하는 함수
				ck_count=0;
				var ck_interest = $(".ck_interest");
				ck_interest.each (function (index, item){
					if(item.checked == true){
						ck_count+=1;
					}
				});
			}
			//////////////////////////////////////
			$('.searchAddress').click(function(){  // 주소검색 api
				new daum.Postcode({
			        oncomplete: function(data) {
			        	$('#post_no').val(data.zonecode);
		            	if(data.userSelectedType=='R'){
		            		$("#main_address").val(data.roadAddress);
		            	}else{
		            		$("#main_address").val(data.jibunAddress);
		            	}
		            	$("#sub_address").val("");
			        }
			    }).open();
			});
			/////////////////////////////////////////
			$('#mem_tel').on("keyup",function(){  // 전화번호 필터링 함수
		
				var inputTel = $('#mem_tel').val();
				console.log(inputTel);
				var tmp="";
				inputTel = inputTel.replace(/[^0-9]/g,'');
		
				if(inputTel.length<4){  //01012341234
					tmp+=inputTel;
				}else if(inputTel.length<7){ //
					tmp+=inputTel.substr(0,3); // 010
					tmp+='-';    
					tmp+=inputTel.substr(3);  // 010-123
				}else if(inputTel.length<11){ //010-1234-1 ...
					tmp += inputTel.substr(0, 3);   // 010
					tmp += '-';
					tmp += inputTel.substr(3, 3); //010-123
					tmp += '-';
					tmp += inputTel.substr(6); //010-123-412
				}else{  
					tmp += inputTel.substr(0, 3);  
					tmp += '-';
					tmp += inputTel.substr(3, 4);
					tmp += '-';
					tmp += inputTel.substr(7); 
				}
				$('#mem_tel').val(tmp);
			
			});
			
			//////////////////////////////////////
			/// 검증 함수
			function validate(){
				if($("#mem_name").val().trim().length<2){
					swal("","이름이 2자 이상 입력해주세요.","info")
					.then((ok)=>{
						if(ok){
							$("#mem_name").val("");
							$("#mem_name").focus();
						}
					});
					return false;
				}
				if($("#cur_pwd").val().trim().length ==  0){
					swal("","현재 비밀번호를 입력해주세요.", "info")
					.then((ok)=>{
						if(ok){
							$("#cur_pwd").focus();
						}
					});
					return false;
				}
				if($("#new_pwd1").val().trim().length ==  0){
					swal("","새 비밀번호를 입력해주세요.", "info")
					.then((ok)=>{
						if(ok){
							$("#new_pwd1").focus();
						}
					});
					return false;
				}
				if($("#new_pwd2").val().trim().length ==  0){
					swal("","새 비밀번호 확인을 입력해주세요.", "info")
					.then((ok)=>{
						if(ok){
							$("#new_pwd2").focus();
						}
					});
					return false;
				}
				if($('#new_pwd1').val()!=$('#new_pwd2').val()){
					swal("","비밀번호가 일치하지 않습니다.","info")
					.then((ok)=>{
						if(ok){
							$('#new_pwd1').val("");
							$('#new_pwd2').val("");
							$('#new_pwd1').focus();
						}
					});	
					return false;
				}
				
				if($('#mem_tel').val().length == 0){
					swal("","전화번호를 입력해주세요.","info")
					.then((ok)=>{
						if(ok){
							$("#mem_tel").focus();
						}
					});
					return false;
				}
				if($("#post_no").val().length==0 ||  $("#main_address").val().length==0){
					swal("","주소를 입력해주세요.","info")
					.then((ok)=>{
						if(ok){
							$('.searchAddress').focus();
						}
					});
					
					return false;
				}else{
					var mem_address = $("#post_no").val()+"/"+
									$("#main_address").val()+"/"+
									$("#sub_address").val();
					$("#mem_address").val(mem_address);
				}
				
				var form =  $("#updateForm").serialize();
				$.ajax({
					url: "update.me",
					type: "post",
					data: form,
					success: function(data){
						console.log(data);
						if(data=="1"){
							swal("","회원정보가 수정되었습니다.","success")
							.then((ok)=>{
								if(ok){
									location.href="mypage.me";
								}
							});
						}else{
							swal("","회원정보 수정에 실패하였습니다.","error");
						}
					},
					error: function(){
						alert("ajax통신 실패");
					}
				});
				
				return false;
			}
		</script>
</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
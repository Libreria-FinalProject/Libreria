<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/sideNav.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/registerCard.css"/>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
		<nav id="side_nav">
			<ul>
				<li id="side_nav_list_title">관리자 페이지</li>
				<li class="side_nav_list_li"><span class="icon_person">회원관리 </span></li>
				<li class="side_nav_list_li"><span class="icon_dollar1">상품구매</span></li>
				<li class="side_nav_list_li">&gt; <span class="icon_dollar2">상품등록</span></li>
			</ul>
		</nav>
		<div id="memberInfo_container">
			<span id="container_title">상품 등록</span>
			<form method="post" action="insertBook2.ad" enctype="Multipart/form-data">
			<table id="admin_bookinsert_table">
				<tr>
					<td class="td_first">장르</td>
					<td>
					<select name="bcf_no" id="ganre">
						<c:forEach var="ganre" items="${ganreList }">
							<option value="${ganre.bcf_no }">${ganre.bcf_ct }</option>
						</c:forEach>
					</select>
					<select name="bc_no" id="sub_ganre">
					</select>
					</td>
				</tr>
				<tr>
					<td class="td_first">도서명</td>
					<td><input type="text" name="b_title" id="bookTitle"></td>
				</tr>
				<tr>
					<td class="td_first">저자</td>
					<td><input type="text" id="bookWriter">
						<input type="hidden" id="selected_bwp_no" name="bwp_no">
						<div id="searchWriterDiv"></div></td>
				</tr>
				<tr>
					<td class="td_first">출판사</td>
					<td><input type="text" name="b_pub_name" id="bookPubName"></td>
				</tr>
				<tr>
					<td class="td_first">가격</td>
					<td><input type="text" name="b_price" id="bookPrice"></td>
				</tr>
				<tr>
					<td class="td_first">줄거리</td>
					<td><textarea name="b_content" id="bookContent"></textarea></td>
				</tr>
				<tr>
					<td class="td_first">출판사 서평</td>
					<td><textarea name="b_pub" id="bookPub"></textarea></td>
				</tr>
				<tr>
					<td class="td_first">출판일</td>
					<td>
						<input type="date" name="b_pub_date" id="bookDate">
					</td>
				</tr>				
				<tr>
					<td class="td_first">커버 이미지</td>
					<td><input type="file" id="bookImage" name="uploadFile" accept=".jpg, .png"></td>
				</tr>
			</table>
			<button type="submit" id="regist_btn" onclick="return validate();">등록</button>
			</form>
		</div>
		<script type="text/javascript">
			$(function(){
				selectSubGanre();
				
				$('#side_nav').find('li').eq(1).click(function(){
					location.href="adminpage.ad";
				});
				$('#side_nav').find('li').eq(2).click(function(){
					location.href="buyBookList.ad";
				});
				$('#side_nav').find('li').eq(3).click(function(){
					location.href="insertBook.ad";
				});

				
				$("#ganre").change(function(){
				 	selectSubGanre();
				});
				
				$('#bookPrice').keyup(function(){
					var price = $(this).val();
					price =  price.replace(/[^0-9]/g,'');
					$(this).val(price);
				});
				
				$("#bookWriter").keyup(function(){
					var writer = $.trim($(this).val());
					if(writer.length>0){
						$.ajax({
							type:"POST",
							url: "searchWriter.ad",
							data:{writer: writer},
							success: function(data){
								$('#searchWriterDiv').html("");
								if(data.length>0){
									$.each(data, function(idx,val){
										var bwp_no = "<input type='hidden' class='bwp_no' value='"+val.bwp_no+"'>";
										var bwp_name ="<input type='hidden' class='bwp_name' value='"+val.bwp_name+"'>'";
										$("#searchWriterDiv").append("<div class='searchResult'>"+val.bwp_name+" / "+val.bwp_intro+bwp_no+bwp_name+"</div>");
									});
									$("#searchWriterDiv").css("display","block");
								}else{
									$("#searchWriterDiv").css("display","none");
								}
								
							}
						});
					}else{
						$("#searchWriterDiv").css("display","none");
					}
				});
				$(document).on("click",".selected",function(){
					console.log("!");
					swal({
						title:"",
						text:"작가를 변경하시겠습니까?",
						icon: "info",
						buttons: ["취소","확인"]
					}).then((ok)=>{
						if(ok){
							$('#bookWriter').removeAttr("readonly");
							$('#bookWriter').removeClass("selected");
						}
					});
				}); 
				
				
				$(document).on("click", ".searchResult", function(){
					$('#bookWriter').attr("readonly","true");
					$('#bookWriter').addClass("selected");
					var bwp_no = $(this).find('.bwp_no').val();
					$("#selected_bwp_no").val(bwp_no);
					$("#bookWriter").val($(this).find(".bwp_name").val());
					$("#searchWriterDiv").css("display","none");
				});
			})
			
			function selectSubGanre(){
				$.ajax({
					url: "getSubGanre.ad",
					data: {bcf_no:$("#ganre").val()},
					success: function(data){
						$("#sub_ganre").empty();
						data.forEach(function(el,index){
							//console.log(el.bc_ct);
							if(index==0){return false;}
							var option = "<option value='"+el.bc_no+"'>"+el.bc_ct+"</option>";
							$("#sub_ganre").append(option);
						});
					}
				});
			}
			
			function validate(){
				if($('#bookTitle').val()==""){
					swal("","도서명을 입력해주세요","info");
					return false;
				}else if(!$("#bookWriter").hasClass("selected")){
					swal("","저자를 선택해주세요.","info");
					return false;
				}else if($("#bookPubName").val()==""){
					swal("","출판사를 입력해주세요.","info");
					return false;
				}else if($('#bookPrice').val()==""){
					swal("","가격을 입력해주세요.","info");
					return false;	
				}else if($("#bookContent").val()==""){
					swal("","줄거리를 입력해주세요.","info");
					return false;
				}else if($("#bookPub").val()==""){
					swal("","출판사 서평을 입력해주세요.","info");
					return false;
				}else if($("#bookDate").val()==""){
					swal("","출판일을 입력해주세요.","info");
					return false;
				}else if(!$("#bookImage").val()){
					swal("","커버 이미지를 첨부해주세요.","info");
					return false;
				}else{
					return true;
				}
			}
		</script>
	</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
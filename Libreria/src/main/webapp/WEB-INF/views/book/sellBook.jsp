<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#sellBookContainer{
		text-align: center;
	}
	#sellBookTitle{
		font-size: 30px;
		font-weight: bold;
		margin: 50px 0;
	}
	
	#sellBookTable{
		width:700px;
		margin: 0 auto;
		border-collapse: collapse;
	}
	
	#sellBookTable td{
		padding: 30px 0;
		border:1px solid #cccccc;
	}
	
	#sellBookTable input[type=text]{
		padding: 3px;
		height: 30px;
		width: 300px;
		border:1px solid #cccccc;
	}
	
	.firstTd{
	    width: 200px;
		background: #eaeaea;
	}
	
	.secondTd{
	
	}
	
	#bookInfo{
		height:200px;
		border: 1px solid gray;
		padding: 0 !important;
		text-align: center;
	}
	 
	#bookInfoTb{
		/* display: none; */
		width: 400px;
		margin: 10px auto;
		font-size: 13px;
		border-collapse: collapse;
	}
	#bookInfoTb .book_img{
		width: 187px;
		padding: 0 5px;
		background-size: cover;
		background-repeat: no-repeat;
		background-position-y: center;
	}
	.in_firstTd{
		width: 60px;
	}
	.in_secondTd{
		width: 130px;
	}
	#searchResultDiv{
		background-color: #ffffff;
	    position: absolute;
	    margin-left: 96px;
	    width: 303px;
	    text-align: left;
	    border: 1px solid #cccccc;
	    display: none;
	    font-size: 13px;
	}
	
	.searchResult{
		padding: 7px 10px;
	}
	.searchResult:hover{
		background-color: #87CEFA;
		cursor: pointer;
	}
	
	.sellBtn{
	border-radius: 5px;
    background-color: rgb(94, 107, 159);
     font-size: 16px;
     color: #ffffff;
     font-weight: bold;
     width: 100px; height: 38px;
     border: none;
     margin:30px  0;

	}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<section>
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
<div id="sellBookContainer">
<form method="post" action="sellBook.bo">
<input type="hidden" name="mem_no" value="${loginUser.mem_no }">
<div id="sellBookTitle">도서판매</div>
<table id="sellBookTable">
	<tr>
		<td class="firstTd">도서명 검색</td>
		<td class="secondTd"><input type="text" id="searchBook" autocomplete="off">
		<div id="searchResultDiv"></div></td>
	</tr>
	<tr>
		<td  class="firstTd">도서정보</td>	
		<td id="bookInfo">
			<table id="bookInfoTb">
				<tr>
					<td rowspan="5" class="book_img">
						<input type="hidden" class="book_no" name="book_no">
					</td>
				</tr>
				<tr>
					<td class="in_firstTd">도서명</td>				
					<td class="in_secondTd book_title"></td>
				</tr>
				<tr>
					<td class="in_firstTd">저자</td>
					<td class="in_secondTd book_writer"></td>
				</tr>
				<tr>
					<td class="in_firstTd">출판사</td>
					<td class="in_secondTd book_publisher"></td>				
				</tr>
				<tr>
					<td class="in_firstTd">가격</td>
					<td class="in_secondTd book_price"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="firstTd">희망가격</td>
		<td class="secondTd"><input type="text" class="wishPirce" name="wishPrice" maxlength="10"></td>
	</tr>
</table>
<button type="submit" class="sellBtn" onclick="return validate();">판매신청</button>
</form>
</div>
<script type="text/javascript">
	$(function(){
		$(".wishPirce").keyup(function(){
			var price = $('.wishPirce').val();
			var tmp="";
			price = price.replace(/[^0-9]/g,'');
			$(this).val(numberWithCommas(price));
		});
		
		 $('#searchBook').keyup(function(){	
				var b_title = $.trim($(this).val());
				if(b_title.length>0){
					$.ajax({
						type:'POST',
						url: "searchBook.bo",
						data: {b_title:b_title},
						dataType: 'json',
						success: function(data){
							$("#searchResultDiv").text("");
							$.each(data, function(idx,val){
								//console.log(idx+" : "+ val.b_no+ " : "+ val.b_title)
								var hiddenB_no= "<input type='hidden' class='b_no' value='"+val.b_no+"'>";
								var hiddenB_title= "<input type='hidden' class='b_title' value='"+val.b_title+"'>";
								var hiddenB_bwp_name= "<input type='hidden' class='b_bwp_name' value='"+val.bwp_name+"'>";
								var hiddenB_pub_name= "<input type='hidden' class='b_pub_name' value='"+val.b_pub_name+"'>";
								var hiddenB_price= "<input type='hidden' class='b_price' value='"+val.b_price+"'>";
								var hiddenB_file_path= "<input type='hidden' class='b_file_path' value='"+val.file_path+"'>";
								var hiddenB_change_name= "<input type='hidden' class='b_change_name' value='"+val.change_name+"'>";
								$("#searchResultDiv").append("<div class='searchResult' id=''>"+val.b_title+" / "+val.bwp_name+"</div>");
								$('#searchResultDiv').find('.searchResult').eq(idx).append(hiddenB_no);
								$('#searchResultDiv').find('.searchResult').eq(idx).append(hiddenB_title);
								$('#searchResultDiv').find('.searchResult').eq(idx).append(hiddenB_bwp_name);
								$('#searchResultDiv').find('.searchResult').eq(idx).append(hiddenB_pub_name);
								$('#searchResultDiv').find('.searchResult').eq(idx).append(hiddenB_price);
								$('#searchResultDiv').find('.searchResult').eq(idx).append(hiddenB_file_path);
								$('#searchResultDiv').find('.searchResult').eq(idx).append(hiddenB_change_name);
								$("#searchResultDiv").css("display","block");
								
							});
							
						}
					});
				}else{
					$("#searchResultDiv").css("display","none");
				}
			}); 
		 
		 $(document).on("click",".searchResult",function(){
			 $('#bookInfoTb').css("display","block");
			 var b_no = $(this).find('.b_no').val();
			 var b_title = $(this).find('.b_title').val();
			 var b_bwp_name = $(this).find('.b_bwp_name').val();
			 var b_pub_name = $(this).find('.b_pub_name').val();
			 var b_price = $(this).find('.b_price').val();
			 var b_file_path = $(this).find('.b_file_path').val();
			 var b_change_name = $(this).find('.b_change_name').val();
			 $('#bookInfoTb').find('.book_img').css("background-image",'url("'+b_file_path+b_change_name+'")');
			 $('#bookInfoTb').find('.book_no').val(b_no);
			 $('#bookInfoTb').find('.book_title').html(b_title);
			 $('#bookInfoTb').find('.book_writer').html(b_bwp_name);
			 $('#bookInfoTb').find('.book_publisher').html(b_pub_name);
			 $('#bookInfoTb').find('.book_price').html(numberWithCommas(b_price)+"원");
			 $('#searchResultDiv').css("display","none");
			 $('#searchBook').val(b_title);
		 });
		 
	});

	function validate(){
		var mem_no = "${loginUser.mem_no}";
		if(mem_no==""){
			swal("","로그인 후 신청가능합니다.","info");
			return false;
		}else if($('.book_no').val()==""){
			swal("","도서를 선택해주세요.","info")
			.then((ok)=>{
				if(ok){
					$('#searchBook').focus();
				}
			});
			return false;
		}else if($('.wishPirce').val()==""){
			swal("","희망가격을 입력해주세요.","info")
			.then((ok)=>{
				if(ok){
					$('.wishPirce').focus();
				}
			});
			return false;
		}else{
			return true;
		}
	 };
	
</script>
</section>
<c:import url="../common/footer.jsp"></c:import>`
</body>
</html>
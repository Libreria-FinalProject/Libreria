<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
   <link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
   <title>Libreria</title>
   <meta charset="UTF-8">
<style type="text/css">
	@import url(http://fonts.google.com/earlyaccess/nanumgothic.css);
   term-table{
   		align:center;
   }

</style>
</head>
<body>
<header>
  <h2 align ="center">LIBRARIA</h2>
  <hr>
</header>
<section>
	<br>
	<h2>개인정보 수집 및 이용 동의 (필수)</h2>
	<table border="1" class="term-table">
		<tr align="center"  height="100px">
			<td>개인정보 수집 이용 목적</td>
			<td>수집 항목</td>
			<td>이용 보유 기간</td>
		</tr>
		<tr align="center" height="100px">
			<td>가입 및 로그인, 고객상담, 최적화된 서비스 제공</td>
			<td>이름, 아이디, 비밀번호, 이메일 주소, 법정대리인의 본인인증 값</td>
			<td>탈퇴시 즉시 파기</td>
		</tr>
	</table>
</section>
<footer>
  <hr>
  <h2 align ="center">LIBRARIA</h2>
</footer>
</body>
</html>
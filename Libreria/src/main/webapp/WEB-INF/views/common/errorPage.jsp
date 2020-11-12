<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<c:import url="header.jsp"></c:import>
<section>
<div id="errorDiv">
	${message }<br>
	<button onclick="location.href='/libreria'">메인화면으로</button>
</div>
</section>
<c:import url="footer.jsp"></c:import>
</body>
</html>
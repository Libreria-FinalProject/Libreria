<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Libreria</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/common.css"/>
</head>
<body>
<c:import url="common/header.jsp"></c:import>
<section>
	<article><img src=" ${pageContext.request.contextPath}/resources/images/main1.png" style="width: 950px;"/></article>
</section>
<c:import url="common/footer.jsp"></c:import>

</body>
</html>

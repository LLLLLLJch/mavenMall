<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | Dashboard</title>

<link
	href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/font-awesome.css"
	rel="stylesheet">

<!-- Toastr style -->
<link
	href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/toastr.min.css"
	rel="stylesheet">

<!-- Gritter -->
<link
	href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/jquery.gritter.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css"
	rel="stylesheet">
</head>

<body>
	<div>
	<table
		class="align-center table  table-bordered table-hover table-condensed">
		<tr>
			<td>Id</td>
			<td>姓名</td>
		</tr>
		<c:forEach items="${onlineList}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.userName}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${ctx}/resources/thirdlib/H+/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="${ctx}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
</head>
<body>
	<div class="border-bottom white-bg dashboard-header animated fadeInRight">
		<table class="align-center table  table-bordered table-hover table-condensed">
			<tr>
				<td>分类名称</td>
			</tr>
			<c:forEach items="${listSon}" var="son">
				<tr>
				<td>${son.name}</td>
				</tr>
			</c:forEach>
		</table>
</div>
</body>
</html>
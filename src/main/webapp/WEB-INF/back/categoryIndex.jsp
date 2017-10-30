<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | Dashboard</title>

<link href="${ctx}/resources/thirdlib/H+/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctx}/resources/thirdlib/H+/css/font-awesome.css"
	rel="stylesheet">

<!-- Toastr style -->
<link href="${ctx}/resources/thirdlib/H+/css/toastr.min.css"
	rel="stylesheet">

<!-- Gritter -->
<link href="${ctx}/resources/thirdlib/H+/css/jquery.gritter.css"
	rel="stylesheet">

<link href="${ctx}/resources/thirdlib/H+/css/animate.css"
	rel="stylesheet">
<link href="${ctx}/resources/thirdlib/H+/css/style.css" rel="stylesheet">
<link
	href="${ctx}/resources/thirdlib/kindeditor/themes/default/default.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css"
	rel="stylesheet">
<script type="text/javascript" src="${ctx}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
<script type="text/javascript">
	function findSon(id){
		layer.open({
  	      type: 2,
  	      title: '分类详情。',
  	      shadeClose: true,
  	      shade: false,
  	      maxmin: true, //开启最大化最小化按钮
  	      area: ['200px', '300px'],
  	      content: "${ctx}/backgroundCategory/findSon.action?parentId="+id
  	    });
	}
</script>
</head>
<body>·
	<div class="border-bottom white-bg dashboard-header animated fadeInRigh">
		<table class="align-center table  table-bordered table-hover table-condensed">
			<tr>
				<td>分类名称</td>
			</tr>
			<c:forEach items="${listParent}" var="category">
				<tr>
					<td><a href="javaScript:findSon(${category.id});">${category.name}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>

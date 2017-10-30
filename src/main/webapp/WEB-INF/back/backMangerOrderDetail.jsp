<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript">


function updateStatus(id,status){
	var isUpdate = confirm("您确定要修改吗？");
	if(isUpdate){
		location.href = "${ctx}/backgroundslideshow/updateStatus.action?id="
			+ id + "&&status=" + status;
	}
} 

</script>
</head>
<body>
	<!-- 内容区开始 -->
			<form id="mainForm"  action="" method="post">			
				<table class="align-center table  table-bordered table-hover table-condensed">
					<tr>
						<td>订单号</td>
						<td>用户名</td>
						<td>商品图片</td>
						<td>商品名称</td>
						<td>数量</td>
						<td>总价</td>
						<td>订单创建时间</td>
					</tr>
					<c:forEach items="${lItems}" var="order">
						<tr>
							<td>${order.order_no}</td>
							<td>${username}</td>
							<td><img alt="" src="/pic/${order.product_image}" width="80"
									height="60"></td>
							<td>${order.product_name}</td>
							<td>${order.quantity}</td>
							<td>${order.total_price}</td>
							<td><fmt:formatDate value="${order.create_time}"
										pattern="yyyy-MM-dd hh:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
			</form>
	<!-- 内容区结束 -->			
</body>
</html>
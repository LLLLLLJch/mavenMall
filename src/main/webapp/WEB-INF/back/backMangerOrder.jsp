<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Dashboard</title>
	<link href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css" rel="stylesheet">
    <link href="${ctx}/resources/thirdlib/H+/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/thirdlib/H+/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="${ctx}/resources/thirdlib/H+/css/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="${ctx}/resources/thirdlib/H+/css/jquery.gritter.css" rel="stylesheet">

    <link href="${ctx}/resources/thirdlib/H+/css/animate.css" rel="stylesheet">
    <link href="${ctx}/resources/thirdlib/H+/css/style.css" rel="stylesheet">

</head>

<body>
            <div class="row  border-bottom white-bg dashboard-header  animated fadeInRight">
					<!-- 内容区开始 -->
			<form id="mainForm"  action="" method="post">			
				<input type="button" value="批量删除" onclick="deleteAll();"/>
				<table class="align-center table  table-bordered table-hover table-condensed">
					<tr>
						<td>
							<input type="checkBox" id="selectedAll" onclick="selectedId();" />
						</td>
						<td>订单号</td>
						<td>总价</td>
						<td>订单创建时间</td>
						<td>查看订单详情</td>
						<td>删除</td>
						<td>修改</td>
					</tr>
					<c:forEach items="${list}" var="order">
						<tr>
							<td>
								<input type="checkbox" name="selectedIds" value="${slideShow.id}"/>
							</td>
							<input type="hidden" value="${order.user_id}"/>
							<td>${order.order_no}</td>
							<td>${order.payment}</td>
							<td><fmt:formatDate value="${order.create_time}"
										pattern="yyyy-MM-dd hh:mm:ss" /></td>
							<td><input type="button" value="查看订单详情" onclick="seeOrderDetail('${order.order_no}');"/></td>
							<td><a href="javascript:delSlideShow(${slideShow.id})">删除</a></td>
							<td><a href="${ctx}/backgroundCategory/toUpdateCategory.action?id=${category.id}">修改</a></td>
						</tr>
					</c:forEach>
				</table>
			</form>
	<!-- 内容区结束 -->
            </div>
		
	<script type="text/javascript" src="${ctx}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
    <script>
        function goPage(pageIndex) {
        	$('#pageIndex').val(pageIndex);
        	$('#searchForm').submit();
        }

        function delSlideShow(id){
        	var isDel = confirm("你确定要删除吗？");
        	if (isDel) {
        		location.href = "${ctx}/backgroundslideshow/deleteSlideShow.action?id="
        				+ id;
        	}
        }

        function selectedId(){
        	$("input[name = selectedIds]").prop("checked",
        			$("#selectedAll").is(":checked"));
        }
        function deleteAll(){
            var isDel = confirm("您确认要删除吗？");
            if (isDel) {
               //要删除
               $("#mainForm").attr("action", "${ctx}/backgroundslideshow/deleteAll.action");
               $("#mainForm").submit();
            }
        }

        function updateStatus(id,status){
        	var isUpdate = confirm("您确定要修改吗？");
        	if(isUpdate){
        		location.href = "${ctx}/backgroundslideshow/updateStatus.action?id="
        			+ id + "&&status=" + status;
        	}
        } 

          function seeOrderDetail(orderNo){
        	layer.open({
        	      type: 2,
        	      title: '订单详情。',
        	      shadeClose: true,
        	      shade: false,
        	      maxmin: true, //开启最大化最小化按钮
        	      area: ['893px', '500px'],
        	      content: "${ctx}/getOrderBack/seeOrderDetail.action?order_no="+orderNo
        	    });
        }  
    </script>
</body>
</html>

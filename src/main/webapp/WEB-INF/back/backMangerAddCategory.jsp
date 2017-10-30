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
				<input id="btn1" type="button" class="btn btn-primary"
					onclick="btn1();" value="添加一级分类" />
					<input id="btn2" type="button" class="btn btn-primary"
						onclick="btn2();" value="添加二级分类" />

				<div id="div1" style="display: none;">
					<form action="${ctx}/backgroundCategory/addFirstCategory.action"
						method="post">
						name:<input type="text" name="name" /> status:<select
							name="status">
							<option value="0">下架</option>
							<option value="1">上架</option>
						</select> <input type="submit" class="btn btn-primary" value="添加" />
					</form>
				</div>
				<form action="${ctx}/backgroundCategory/addSecondCategory.action"
					method="post">
					<div id="div2" style="display: none;">
						<input type="hidden" name="parent_id" value="${id}"/>
						name:<input type="text" name="name" /> status:<select
							name="status">
							<option value="0">下架</option>
							<option value="1">上架</option>
						</select> <input type="submit" class="btn btn-primary" value="确认添加" />
					</div>
				</form>
				<!-- 内容区结束 -->
            </div>


    <!-- Mainly scripts -->
    <script>
    	function btn1() {
    		$("#div1").show();
    		$("#div2").hide();
    	}
    	function btn2() {
    		$("#div1").hide();
    		$("#div2").show();
    	}
    </script>
</body>
</html>

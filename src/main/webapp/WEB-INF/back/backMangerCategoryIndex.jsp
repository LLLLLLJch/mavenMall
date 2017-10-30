<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css" rel="stylesheet">
<link href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript">
function goPage(pageIndex) {
	$('#pageIndex').val(pageIndex);
	$('#searchForm').submit();
}

function delCategory(id){
	var isDel = confirm("你确定要删除吗？");
	if (isDel) {
		location.href = "${ctx}/backgroundCategory/deleteCategory.action?id="
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
       $("#mainForm").attr("action", "${ctx}/backgroundCategory/deleteAll.action");
       $("#mainForm").submit();
    }
}

function updateStatus(id,status){
	var isUpdate = confirm("您确定要修改吗？");
	if(isUpdate){
		location.href = "${ctx}/backgroundCategory/updateStatus.action?id="
			+ id + "&&status=" + status;
	}
}
</script>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container">
		<!--小屏幕导航按钮和logo-->
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="index.html" class="navbar-brand">网站后台管理系统</a>
		</div>
		<!--小屏幕导航按钮和logo-->
		<!--导航-->
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath}/background/background/findAllCategory.action"><span
						class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;产品管理</a></li>
				<li><a
					href="${pageContext.request.contextPath}/backgroundslideshow/findAllSlideShow.action"><span
						class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;轮播图管理</a></li>
				<li><a
					href="${pageContext.request.contextPath}/course/pageBean.action"><span
						class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;支付管理</a></li>
				<li><a
					href="${pageContext.request.contextPath}/backgroundCategory/getAddCategoryPage.action"><span
						class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;分类管理</a></li>
				<li><a
					href="${pageContext.request.contextPath}/getOrderBack/getUserOrder.action"><span
						class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;订单管理</a></li>
				<li><a
					href="${pageContext.request.contextPath}/education/getEducation.action"><span
						class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;管理员管理</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="${pageContext.request.contextPath}/admit?method=admitList" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">在线人数 <span class="caret"></span></a>
				<li><a href="/studentManger/logout"><span
						class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
			</ul>
		</div>
		<!--导航-->
	</div>
</nav>
<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/banji?method=banjiPageList"
						class="list-group-item active">分类列表</a> <a
						href="${ctx}/backgroundCategory/getAddCategoryPage.action"
						class="list-group-item">添加分类</a>
				</div>
			</div>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${pageContext.request.contextPath}/banji?method=banjiPageList">分类列表</a>
					</li>
					<li><a href="${pageContext.request.contextPath}/backgroundCategory/getAddCategoryPage.action">添加分类</a>
					</li>
				</ul>
			<form action="${ctx}/backgroundCategory/getPageBean.action" method="post" id="searchForm">
				<table style="width: 800px;"
							class="align-center table  table-bordered table-hover table-condensed">
							<tr>
								<input type="hidden" name="pageIndexStr" id="pageIndex" />
								<td colspan="3"><label for="exampleInputEmail1">产品编号</label><input
									type="text" name="id" value="${findCategoryByCondition.id}"
									placeholder="产品编号" class="form-control" /></td>
								<td colspan="3"><label for="exampleInputEmail1">产品名称</label><input
									type="text" name="name" value="${findCategoryByCondition.id}"
									placeholder="产品名称" class="form-control" /></td>
								<td colspan="2"><label for="exampleInputEmail1">产品状态</label><select
									id="status" name="status" class="form-control">
										<option value="">请选择</option>
										<option value="1">上架</option>
										<option value="0">下架</option>
								</select></td>
								<td colspan="1"><input
									style="margin-top: 25px; margin-left: 15px;" type="submit"
									value="search" class="btn btn-success" /></td>
							</tr>
						</table>
			</form>
	<!-- 内容区开始 -->
			<form id="mainForm"  action="" method="post">			
				<input type="button" value="批量删除" onclick="deleteAll();"/>
				<table class="align-center table  table-bordered table-hover table-condensed">
					<tr>
						<td>
							<input type="checkBox" id="selectedAll" onclick="selectedId();" />
						</td>
						<td>产品编号</td>
						<td>分类编号</td>
						<td>名称</td>
						<td>商品状态</td>
						<td>创建时间</td>
						<td>更新时间</td>
						<td>状态</td>
						<td>删除</td>
						<td>修改</td>
					</tr>
					<c:forEach items="${pageBean.list}" var="category">
						<tr>
							<td>
								<input type="checkbox" name="selectedIds" value="${category.id}"/>
							</td>
							<td>${category.id}</td>
							<td>${category.parent_id}</td>
							<td>${category.name}</td>
							<c:if test="${category.status==0}">
							<td>下架</td>
							</c:if>
							<c:if test="${category.status==1}">
							<td>上架</td>
							</c:if>
							<td><fmt:formatDate value="${category.create_time}"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
							<td><fmt:formatDate value="${category.update_time}"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
							<td><input type="button" class="btn btn-info" value="change" onclick="javascript:updateStatus(${category.id},${category.status})"/></td>
							<td><a href="javascript:delCategory(${category.id})">删除</a></td>
							<td><a href="${ctx}/backgroundCategory/toUpdateCategory.action?id=${category.id}">修改</a></td>
						</tr>
					</c:forEach>
				</table>
			</form>
	<!-- 内容区结束 -->			
				<nav aria-label="Page navigation" style="float:right;">
					<ul class="pagination">
						<c:if test="${pageBean.pageIndex==1}">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageBean.pageIndex!=1}">
							<li><a href="javascript:goPage(${pageBean.pageIndex-1})"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
							<c:if test="${pageBean.pageIndex!=page}">
								<li><a href="javascript:goPage('${page}')">${page}</a></li>
							</c:if>
							<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
							<c:if test="${pageBean.pageIndex==page}">
								<li class="active"><a href="javascript:goPage('${page}')">${page}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${pageBean.pageIndex==pageBean.totalPage}">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
							<li><a href="javascript:goPage(${pageBean.pageIndex+1})"
								aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
					</nav>
			</div>
		</div>
	</div>
</body>
</html>
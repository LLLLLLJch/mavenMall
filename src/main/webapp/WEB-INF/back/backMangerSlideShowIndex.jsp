<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
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


	<script type="text/javascript">
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
</script>
</head>

<body>
            <div class="row  border-bottom white-bg dashboard-header  animated fadeInRight">
				<div class="container">
		<div class="row">
			<div class="col-md-1">
			</div>
			<div class="col-md-10">
	<!-- 内容区开始 -->
			<form id="mainForm"  action="" method="post">			
				<input type="button" value="批量删除" onclick="deleteAll();"/>
				<table class="align-center table  table-bordered table-hover table-condensed">
					<tr>
						<td>
							<input type="checkBox" id="selectedAll" onclick="selectedId();" />
						</td>
						<td>编号</td>
						<td>名称</td>
						<td>主图</td>
						<td>商品状态</td>
						<td>创建时间</td>
						<td>更新时间</td>
						<td>状态</td>
						<td>删除</td>
						<td>修改</td>
					</tr>
					<c:forEach items="${pageBean.list}" var="slideShow">
						<tr>
							<td>
								<input type="checkbox" name="selectedIds" value="${slideShow.id}"/>
							</td>
							<td>${slideShow.id}</td>
							<td>${slideShow.name}</td>
							<td><img alt="" src="http://owyysts4w.bkt.clouddn.com/${slideShow.main_image}" width="192"
									height="44"></td>
							<c:if test="${slideShow.status==0}">
							<td>下架</td>
							</c:if>
							<c:if test="${slideShow.status==1}">
							<td>上架</td>
							</c:if>
							<td><fmt:formatDate value="${slideShow.create_time}"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
							<td><fmt:formatDate value="${slideShow.update_time}"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
							<td><input type="button" class="btn btn-info" value="change" onclick="javascript:updateStatus(${slideShow.id},${slideShow.status})"/></td>
							<td><a href="javascript:delSlideShow(${slideShow.id})">删除</a></td>
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
							<li><a href="${ctx}/backgroundslideshow/findAllSlideShow.action?spageIndexStr=${pageBean.pageIndex-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
							<c:if test="${pageBean.pageIndex!=page}">
								<li><a href="${ctx}/backgroundslideshow/findAllSlideShow.action?pageIndexStr=${page}">${page}</a></li>
							</c:if>
							<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
							<c:if test="${pageBean.pageIndex==page}">
								<li class="active"><a href="${ctx}/backgroundslideshow/findAllSlideShow.action?pageIndexStr=${page}">${page}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${pageBean.pageIndex==pageBean.totalPage}">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
							<li><a href="${ctx}/backgroundslideshow/findAllSlideShow.action?pageIndexStr=${pageBean.pageIndex+1}"
								aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
					</nav>
			</div>
		</div>
	</div>
            </div>
</body>
</html>

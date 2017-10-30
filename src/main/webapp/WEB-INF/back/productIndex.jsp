<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Dashboard</title>

    <link href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/jquery.gritter.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/thirdlib/H+/css/style.css" rel="stylesheet">
	 <link href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css" rel="stylesheet">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
	<script type="text/javascript">
$(function() {
	$("#status option[value = '${condition.status}']").prop("selected",
			true);
});
	function goPage(pageIndex) {
		$('#pageIndex').val(pageIndex);
		$('#searchForm').submit();
	}
	function selectedId(){
		$("input[name = selectedIds]").prop("checked",
				$("#selectedAll").is(":checked"));
	}
	function deleteAll(){
	    var isDel = confirm("您确认要删除吗？");
	    if (isDel) {
	       //要删除
	       $("#mainForm").attr("action", "${ctx}/background/deleteAll.action");
	       $("#mainForm").submit();
	    }
	}

	/*  function updateStatus(id,status){
		var isUpdate = confirm("您确认要修改吗？");
		if(isUpdate){
			location.href = "${ctx}/background/updateStatus.action?id="
				+ id +"&&status="+status;
		}
	} */	 
	
	function updateStatus(id,status){
		 $.post(
	               "${ctx}/background/updateStatus.action", //url
	               {"id":id,"status":status}, //data
	               function(data) { //callback
	            	  if (data.status == 0) {
	            		  alert(data.msg);
	            		  window.location.href="${ctx}/background/findAllCategory.action";
					} 
	               	  if(data.status != 0){
	               		 alert(data.msg);
						  window.location.href="${ctx}/background/findAllCategory.action";
					}
	               },
	               "json" //type
	           );


	}
	
	
	/* function updateStatus(id,status){
		 $.ajax({
             url:"${ctx}/background/updateStatus.action",
             contentType:"application/json",
             type: "POST",
             async: false,
             data:JSON.stringify({"id":id,"status":status}),
             dataType:"json",
             success: function(data, textStatus, ajax) {
            	 if(data.result){//返回0
            		 $("#shang").remove();
            		 $("#xia").load();
            	 }else{//返回1
            		 $("#xia").load();
            		 $("#shang").load();
            	 }
              }
         });
	} */
    function f1(id){
		$("#bbb").val(id);
        $.ajax({
            url:"${ctx}/background/findSecond.action",
            dataType:"json",
            data:"id="+id,
            success:function(data,textStatus,ajax){
            
               var value = $("#ddd").val();
               var html = "<option>-请选择-</option>";
               $("a[name='aaa']").attr('class','list-group-item');
               $("#choseId"+id).addClass('active');
               for(var i=0;i<data.length;i++){
            	   $("#chose").attr("value",data[i].id);
            	   if(value == data[i].id){
            		   html +="<option  value='"+data[i].id+"' selected='selected'>"+data[i].name+"</option>";
            	   }else{
            		   html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
            	   }
                   
               }
                $("#chose").html(html);
            }
        });
    }
	
	
	function findProductByCategory(secondId){
		var selectid = $("#bbb").val();
		$("#ddd").val(secondId);
		location.href = "${ctx}/background/findProductByCategory.action?secondId="
				+ secondId+"&&selectid="+selectid;
	}	
	
	$(function(){
		var id = $("#ccc").val();
		f1(id);
	});
	
	function delProduct(id){
		alert(id);
		$.post(
	               "${pageContext.request.contextPath}/background/deleteProduct.action", //url
	               {"id":id}, //data
	               function(data) { //callback
	            	   alert(data.result);
  	            		   $("#ta"+id).remove();
	               },
	               "json" //type
	           );

}
	
</script>
</head>

<body>
	<input id="bbb" type="hidden" value=""/>
	<input id="ccc" type="hidden" value="${selectid}"/>
	<input id="ddd" type="hidden" value="${secondId}"/>
            <div class="row  border-bottom white-bg dashboard-header animated fadeInRight">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/background/findByCondition.action"
						class="list-group-item active">首页</a>
					<c:forEach items="${list}" var="category">
						<a href="javaScript:f1(${category.id});" id="choseId${category.id}" value="${category.id}"
							 name="aaa" class="list-group-item">${category.name}</a>
							 <input type="hidden" id="theValue" value="${category.id}"/> 
					</c:forEach>
				</div>
			</div>
			<div class="col-md-10">
			<%-- <form action="${pageContext.request.contextPath}/background/findProductByCategory.action" id="findProductByCategory"> --%>
					<label for="exampleInputEmail1">产品状态</label>
				<select id="chose" class="form-control" onchange="javascript:findProductByCategory(value);">
					<option value="">-请选择-</option>
				</select>
			<!-- </form> -->
				<form action="${pageContext.request.contextPath}/background/findAllCategory.action"
					method="post" id="searchForm">
					<table style="width: 800px;"
						class="align-center table  table-bordered table-hover table-condensed">
						<tr>
							<input type="hidden" name="pageIndexStr" id="pageIndex" />
							<td colspan="3"><label for="exampleInputEmail1">产品编号</label><input
								type="text" name="id" value="${condition.id}" placeholder="产品编号"
								class="form-control" /></td>
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
				<form action="${pageContext.request.contextPath}/background/getCategory.action" method="post">
					<input type="submit" value = "添加"/>
				</form>
				<!-- 内容区开始 -->
				<form id="mainForm" action="" method="post">
					<input type="button" value="批量删除" onclick="deleteAll();" />
					<table
						class="align-center table  table-bordered table-hover table-condensed">
						<tr>
							<td><input type="checkBox" id="selectedAll"
								onclick="selectedId();" /></td>
							<td>产品编号</td>
							<td>分类编号</td>
							<td>名称</td>
							<td>副标题</td>
							<td>产品主图</td>
							<!-- <td>商品详情</td> -->
							<td>价格</td>
							<td>库存数量</td>
							<td>商品状态</td>
							<td>创建时间</td>
							<td>更新时间</td>
							<td>上架</td>
							<td>删除</td>
							<td>修改</td>
						</tr>
						<c:forEach items="${pageBean.list}" var="product">
							<tr id = "ta${product.id}">
								<td><input type="checkbox" name="selectedIds"
									value="${product.id}" /></td>
								<td>${product.id}</td>
								<td>${product.category.id}</td>
							<c:if test="${fn:length(product.name)>8 }"> 
								<td>${fn:substring(product.name,0,8)}...</td>
							</c:if> 
							<c:if test="${fn:length(product.name)<=8 }">
								<td>${product.name}</td>
							</c:if>
							<c:if test="${fn:length(product.subtitle)>8 }"> 
								<td>${fn:substring(product.subtitle,0,8)}...</td>
							</c:if> 
							<c:if test="${fn:length(product.subtitle)<=8 }">
								<td>${product.subtitle}</td>
							</c:if>
								<td><img alt="" src="/pic/${product.main_image}" width="80"
									height="60"></td>
								<%-- <td>${product.detail}</td> --%>
								<td>${product.price}</td>
								<td>${product.stock}</td>
								<c:if test="${product.status==0}">
									<td>下架</td>
								</c:if>
								<c:if test="${product.status==1}">
									<td>上架</td>
								</c:if>
								<td><fmt:formatDate value="${product.create_time}"
										pattern="yyyy-MM-dd hh:mm:ss" /></td>
								<td><fmt:formatDate value="${product.update_time}"
										pattern="yyyy-MM-dd hh:mm:ss" /></td>
								<td><input type="button" class="btn btn-info"
									value="change"
									onclick="javascript:updateStatus(${product.id},${product.status});" /></td>
								<td><input type="button" value="删除" onclick="delProduct(${product.id})"/></td> 
								<td><a
									href="${pageContext.request.contextPath}/background/toUpdateProduct.action?id=${product.id}&category_id=${secondId}&categoryId=${selectid}">修改</a></td>
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

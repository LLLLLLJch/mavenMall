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

	<script type="text/javascript">
function uploadPic() {
    //定义参数
    var options = {
        url:"${ctx}/upload/uploadPic.action",
        dataType:"json",
        type:"post",
        success: function(data) {
        	alert(data.fileName);
            $("#imgId").attr("src",data.filePath);
            $("#mainImage").val(data.fileName);
        }
    };
     $("#form-add").ajaxSubmit(options);
}


</script>
</head>

<body>
            <div class="row  border-bottom white-bg dashboard-header  animated fadeInRight">
				<div style="width: 800px">
			<form action="${ctx}/backgroundslideshow/addSlideShow.action" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-add">
			    <div style="margin-top: 10px;">
				<label for="exampleInputEmail1">名称</label> <input type="text" name="name" 
				 class="form-control" />
				</div>
				<div>
					<label>产品主图</label>
					 <img alt="" id="imgId" src="" width=200 height=80>
         			 <input type="hidden" name="main_image" id="mainImage"/>
         			 <input type="file" name="pictureFile" onchange="uploadPic();"/>
				</div>
					<select name="status">
						<option value="1">上架</option>
						<option value="2">下架</option>
					</select>
				<div>
					<input type="submit"  class="btn btn-primary" value="提交"/>
				</div>
			</form>	
		</div>		
            </div>

	<script type="text/javascript" 
	src="${ctx}/resources/thirdlib/jqury/jquery-form.js"></script>
	<link href="${ctx}/resources/thirdlib/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
</body>
</html>

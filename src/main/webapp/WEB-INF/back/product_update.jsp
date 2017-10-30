<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@include file="../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css" rel="stylesheet">
<script type="text/javascript" 
	src="${ctx}/resources/thirdlib/jqury/jquery-form.js"></script>
	<link href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${ctx}/resources/thirdlib/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
$(function(){
    $("#productStatus  option[value='${product.status}']").prop("selected", true);
 });
 
$(function() {
    $.ajax({
        url:"${pageContext.request.contextPath}/background/selectStair.action",
        dataType:"json",
        success:function(data,textStatus,ajax){
           var html = "<option>${categoryParent.name}</option>";
           for(var i=0;i<data.length;i++){
               html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
           }
            $("#stair").html(html);
        }
    });
});

function selectSecond(obj) {
    var categoryId = $(obj).val();
    /*  $("#second option:gt(0)").remove();  */
    $.ajax({
        url:"${pageContext.request.contextPath}/background/selectSecond.action",
        data:"categoryId="+categoryId,
        dataType:"json",
        success:function(data,textStatus,ajax){
           										
           var html = "<option'>${categorySon.name}</option>";
           for(var i=0;i<data.length;i++){
               html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
           }
           $("#second").html(html);
        }
    });
}

</script>
</head>
<body>
	<form action="${ctx}/background/update.action" method="post">
		<div style="width: 400px; margin-left:100px;" class=" animated fadeInRight">
			<div style="margin-top: 10px;">
				<input type="text" name="id" value="${product.id}"
					readonly="readonly" class="form-control" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="category.id" value="${product.category.id}"
					class="form-control" />
			</div>
			<div class="form-group">
				一级分类：
			    <select id="stair" onchange="selectSecond(this)" id="first">
			       <option value="${categoryParent.id}">${categoryParent.name}</option>
			    </select>
			</div>
			<div class="form-group">
				 二级分类：
			    <select id="second" name = "category.id" id="second">
			        <option value="${categorySon.id}">${categorySon.name}</option>
			    </select>
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="name" value="${product.name}"
					class="form-control" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="subtitle" value="${product.subtitle}"
					class="form-control" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="price" value="${product.price}"
					class="form-control" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="stock" value="${product.stock}"
					class="form-control" />
			</div>
			<div class="form-group">
				<select class="form-control" name="status" id="productStatus">
						<option value="0">下架</option>
						<option value="1">上架</option>
				</select>
			</div>
			<div style="margin-top: 10px;">
				<input type="text" value="<fmt:formatDate value="${product.create_time}"
											pattern="yyyy-MM-dd hh:mm:ss"/>"
					class="form-control" readonly="readonly" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" value="<fmt:formatDate value="${product.update_time}"
											pattern="yyyy-MM-dd hh:mm:ss"/>"
					class="form-control" readonly="readonly"/>
			</div>
			<div style="margin-top: 10px; margin-left: 120px;">
				<input type="submit" class="btn btn-info" value="修改" />
			</div>
		</div>
	</form>
</body>
</html>
<script type="text/javascript">
var myKindEditor ;
KindEditor.ready(function(K) {
	var kingEditorParams = {
			//指定上传文件参数名称
			filePostName  : "pictureFile",
			//指定上传文件请求的url。
			uploadJson : ctx+'/upload/pic.action',
			//上传类型，分别为image、flash、media、file
			dir : "image",
			afterBlur:function(){this.sync();}
	}
	var editor = K.editor(kingEditorParams);
	//多图片上传
	K('#picFileUpload').click(function() {
		editor.loadPlugin('multiimage', function() {
			editor.plugin.multiImageDialog({
				clickFn : function(urlList) {
					console.log(urlList);
					var div = K('#J_imageView');
					var imgArray = [];
					div.html('');
					K.each(urlList, function(i, data) {
						imgArray.push(data.url);
						div.append('<img src="' + data.url + '" width="80" height="50">');
					});
					$("#subImages").val(imgArray.join(","));
					editor.hideDialog();
				}
			});
		});
	});
	//富文本编辑器
	myKindEditor = KindEditor.create('#form-add[name=detail]', kingEditorParams);
});

function uploadPic() {
    //定义参数
    var options = {
        url:"${ctx}/upload/uploadPic.action",
        dataType:"json",
        type:"post",
        success: function(data) {
        	alert(data.fileName);
            $("#imgId").attr("src","/pic/" + data.fileName);
            $("#mainImage").val(data.fileName);
        }
    };
     $("#form-add").ajaxSubmit(options);
}
</script>
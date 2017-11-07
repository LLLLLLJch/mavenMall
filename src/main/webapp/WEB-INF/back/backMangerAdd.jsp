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
<link href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "${ctx}/background/selectStair.action",
			dataType : "json",
			success : function(data, textStatus, ajax) {
				var html = "<option>-请选择-</option>";
				for (var i = 0; i < data.length; i++) {
					html += "<option value='"+data[i].id+"'>" + data[i].name
							+ "</option>";
				}
				$("#stair").html(html);
			}
		});
	});

	function selectSecond(obj) {
		var categoryId = $(obj).val();
		/*  $("#second option:gt(0)").remove();  */
		$
				.ajax({
					url : "${pageContext.request.contextPath}/background/selectSecond.action",
					data : "categoryId=" + categoryId,
					dataType : "json",
					success : function(data, textStatus, ajax) {
						var html = "<option>-请选择-</option>";
						for (var i = 0; i < data.length; i++) {
							html += "<option value='"+data[i].id+"'>"
									+ data[i].name + "</option>";
						}
						$("#second").html(html);
					}
				});
	}
	function uploadPic() {
		//定义参数
		var options = {
			url : "${ctx}/upload/uploadPic.action",
			dataType : "json",
			type : "post",
			success : function(data) {
				alert(data.fileName);
				//七牛云上传图片
				$("#imgId").attr("src", data.filePath);
				//上传图片
				/* $("#imgId").attr("src", "/pic/" + data.fileName); */
				$("#mainImage").val(data.fileName);
			}
		};
		$("#form-add").ajaxSubmit(options);
	}

	function add() {
		var options = {
			url : "${ctx}/background/addProduct.action",
			dataType : "json",
			type : "post",
			data : $("#form-add").serialize(),
			success : function(data) {
				if (data.status == 0) {
					alert(data.msg);
				} else {
					alert(data.msg);
				}
			}

		}
		$.ajax(options)
	}

	function clearForm() {
		$("#add-form")[0].reset();
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
							<div style="width: 800px">
								<form action="${ctx}/background/addProduct.action" method="post"
									enctype="multipart/form-data" class="form form-horizontal"
									id="form-add">
									一级分类： <select id="stair" onchange="selectSecond(this)">
										<option value="">-请选择-</option>
									</select> 二级分类： <select id="second" name="category.id">
										<option value="">-请选择-</option>
									</select>
									<div style="margin-top: 10px;">
										<label for="exampleInputEmail1">商品名称</label> <input
											type="text" name="name" class="form-control" />
									</div>
									<div style="margin-top: 10px;">
										<label for="exampleInputEmail1">商品副标题</label> <input
											type="text" name="subtitle" class="form-control" />
									</div>
									<div style="margin-top: 10px;">
										<label for="exampleInputEmail1">价格</label> <input type="text"
											name="price" class="form-control" />
									</div>
									<label for="exampleInputEmail1">库存数量</label> <input type="text"
										name="stock" class="form-control" />
							</div>
							<select name="status">
								<option value="1">上架</option>
								<option value="2">下架</option>
							</select>
							<div>
								<label>产品主图</label> <img alt="" id="imgId" src="" width=100
									height=100> <input type="hidden" name="main_image"
									id="mainImage" /> <input type="file" name="pictureFile"
									onchange="uploadPic();" />
							</div>
							<div class="form-group">
								<label>商品图片</label> <a href="javascript:void(0)"
									class="picFileUpload" id="picFileUpload">上传图片</a> <input
									type="hidden" name="sub_images" id="subImages" />
								<div id="J_imageView"></div>
							</div>
							<div class="form-group">
								<label>商品描述</label>
								<textarea
									style="width: 900px; height: 300px; visibility: hidden;"
									name="detail"></textarea>
							</div>
							<div>
								<input type="button" onclick="add();" class="btn btn-primary"
									value="提交" />
							</div>
							</form>
						</div>
						<!-- 内容区结束 -->
					</div>
				</div>
			</div>
		</div>
	
	<script type="text/javascript"
	src="${ctx}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/thirdlib/jqury/jquery-form.js"></script>
	
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
						alert(data.url);
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
</script>
</body>
</html>

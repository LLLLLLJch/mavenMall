<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/thirdlib/jqury/jquery-1.11.1.js"></script>
<link href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/thirdlib/hadmin/css/animate.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
    $("#categoryStatus  option[value='${category.status}']").prop("selected", true);
 });

</script>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<form action="${ctx}/backgroundCategory/update.action" method="post">
		<div style="width: 400px; margin: auto;" class=" animated fadeInRight">
			<div style="margin-top: 10px;">
				<input type="text" name="id" value="${category.id}"
					readonly="readonly" class="form-control" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="parent_id" value="${category.parent_id}"
					class="form-control" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="name" value="${category.name}"
					class="form-control" />
			</div>
			<div class="form-group">
				<select class="form-control" name="status" id="categoryStatus">
						<option value="0">下架</option>
						<option value="1">上架</option>
				</select>
			</div>
			<div style="margin-top: 10px;">
				<input type="text" value="<fmt:formatDate value="${category.create_time}"
											pattern="yyyy-MM-dd hh:mm:ss"/>"
					class="form-control" readonly="readonly" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" value="<fmt:formatDate value="${category.update_time}"
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
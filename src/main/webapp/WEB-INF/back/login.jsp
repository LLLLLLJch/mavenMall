<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="${ctx}/resources/thirdlib/hadmin/favicon.ico"> <link href="${ctx}/resources/bootstrap.min.css" rel="stylesheet">
   <link href="${ctx}/resources/thirdlib/hadmin/css/font-awesome.css" rel="stylesheet">

    <link href="${ctx}/resources/thirdlib/hadmin/css/animate.css" rel="stylesheet">
    <link href="${ctx}/resources/thirdlib/hadmin/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">浪</h1>

            </div>
            <form class="m-t" role="form" method="post" action="${pageContext.request.contextPath}/getBackLogin/login.action">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名" required="" name="userName">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" required="" name = "password">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


                <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
                </p>

            </form>
        </div>
    </div>

    <!-- 全局js -->
     <script src="${ctx}/resources/thirdlib/H+/js/jquery-2.1.1.js"></script>
    <script src="${ctx}/resources/thirdlib/H+/js/bootstrap.min.js"></script>
</body>

</html>

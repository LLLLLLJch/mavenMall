<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/header.jsp" %>
<% String url = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI()+"?"+request.getQueryString(); %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网</title>
		<link rel="stylesheet" href="${ctx}/resources/css/index_style.css" />
		<link rel="stylesheet" href="${ctx}/resources/css/login_layer_style.css" />
		<script type="text/javascript" src="${ctx}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
		<script type="text/javascript">
		function goexist(){
			var isExist = confirm("你确定要退出吗？");
			if (isExist) {
				location.href = "${ctx}/getLogin/goexist.shtml"
			}

		}
		
		function register(){
			location.href = "${ctx}/getLogin/goRegister.shtml"
		}
		
		function gopage(pageIndex){
			$("#pageIndex").val(pageIndex);
			$("#searchForm").submit();
		}
		
		function goCart(){
			var username = $("#username").val();
			//如果登录了
			if(username != null && username != ""){
				window.location.href="${ctx}/getCart/goCart.shtml?username="+username+"";
			}else{
				window.location.href="${ctx}/getDetailPage/getDetailNoUserName.shtml";
			}
		}
		
		function gotoUserOrder(){
			var username = $("#username").val();
			if(username != null && username != ""){
				window.location.href="${ctx}/getOrder/gotoUserOrder.shtml?username="+username;
			}else{
				layer.open(
						{
							title: '登录',
							offset:'200px',
						    type: 1,
						    content: $('#login')//这里content是一个DOM，这个元素要放在body根节点下
						}
				);
			}
		}
		
		function submitForm() {
			var options = {
					url:"${ctx}/getLogin/login.shtml",
					type:"post",
					dataType:"json",
					data:$("#login_form").serialize(),
					success:function(data){
						if(data) {
							parent.layer.msg("登录成功");
							//当你在iframe页面关闭自身时
							var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
							setTimeout(function(){
								parent.layer.close(index); //再执行关闭  
								window.parent.location.reload();//刷新父页面
							},100);
						} else {
							layer.msg("登录失败");
						} 
					}
			};
			$.ajax(options);
		}
		
		function goLogin(){
			window.location.href="${ctx}/getLogin/goLogin.shtml?relUrl="+window.location.href;
		}
		</script>
		<style type="text/css">
			.login{
				width: 500px;
				height: 400px;
				display: none;
			}
		</style>
	</head>
	<div class="login" id="login">
			<form id="login_form">
				<ul>
					<li class="login_title_1">
						<a href="">密码登录</a>

					</li>
					<li class="login_title_2">
						<a href="">扫码登录</a>
					</li>
					<li>
						<input class="login_user" type="text" name="userName" placeholder="会员名/邮箱/手机号" />
						<input class="login_password" type="password" name="password" placeholder="密码" />
						<input class="login_btn" type="button" onclick="submitForm()" value="登录" />
					</li>
				</ul>
			</form>
		</div>
	<body>
	<input id="username" type="hidden" value="${username}" />
		<!-----------------------1.top-------------------->
		<div class="bg_color">
			<div class="top_center">
				<div class="left">
					<span class="wel">
						欢迎来到靓淘！
					</span>
				</div>
				<div class="right">
					<ul>
					<c:if test="${empty username }">
						<li><a href="javaScript:goLogin();" target="_blank">请登录</a></li>
						<li><a href="javaScript:register();" target="_blank">快速注册</a></li>
					</c:if>
					<c:if test="${not empty username }">
						<li><a href="${ctx}/getLogin/goLogin.shtml" target="_blank">欢迎 : ${username }</a></li>
						<li><a href="javaScript:goexist();" target="_blank">注销</a></li>
					</c:if>
						<li><a class="collect" href="">我的收藏</a></li>
						<li><a class="indent" href="javaScript:gotoUserOrder();">我的订单</a></li>
						<li><a class="phone" href="">手机靓淘</a></li>
						<li><a href="">我的积分</a></li>
						<li><a href="">我的评价</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-----------------------2.logo-------------------->
		<div class="logo_center">
			<div class="left">
				<a href="${ctx}/index.shtml"><img class="logo_img" src="${ctx}/resources/img/LOGO.png" /></a>
			</div>
			<div class="center">
			<form id="searchForm" action="${ctx}/search/findProduct.shtml">
				<input type="hidden" name="pageIndexStr" id="pageIndex"/>
				<input id="searchInput" class="btn1" type="text" value="洗面奶" name="name"/>
				<input class="btn2" type="submit" value="搜索" />
			</form>
				<ul class="nav">
					<li><a href="" style="color: pink;">保湿 | </a></li>
					<li><a href="">面膜 | </a></li>
					<li><a href="">洗面奶 | </a></li>
					<li><a href="">补水 | </a></li>
					<li><a href="">香水 | </a></li>
					<li><a href="">眼霜 | </a></li>
					<li><a href="">口红 | </a></li>
					<li><a href="">护肤套装 | </a></li>
					<li><a href="">BB霜 | </a></li>
				</ul>
			</div>
			<div class="right">
				<div class="car">
					<a class="car_pic" href="javaScript:goCart();" target="_blank">去购物车结算</a>
				</div>
				<div class="narrow"></div>
			</div>
		</div>
		<!-----------------------3.导航栏-------------------->
		<div class="big_menu">
			<div class="menu">
				<ul class="menu_ul">
					<li>
						<a class="current" href="">
							商城首页
						</a>
					</li>
					<li>
						<a href="">
							美妆商城
						</a>
					</li>
					<li>
						<a href="">
							服装运动
						</a>
					</li>
					<li>
						<a href="">
							家电数码
						</a>
					</li>
					<li>
						<a href="">
							家装家纺
						</a>
					</li>
					<li>
						<a href="">
							淘遍美食
						</a>
					</li>
					<li>
						<a href="">
							国际轻奢
						</a>
					</li>
					<div class="clearfix"></div>
				</ul>
			</div>
		</div>
		<!-----------------------4.广告区-------------------->
		<div class="banner_box">
			<c:forEach items="${listSlideShow}" var="banner">
				<a href=""><img class="banner" src="http://owyysts4w.bkt.clouddn.com/${banner.main_image}" /></a>
			</c:forEach>
			<div class="banner_center">
				<div class="nav_left">
					<c:forEach items="${listFirst}" var="first">
						<span>${first.name}</span>
							<c:forEach items="${listSecond}" var="second">
								<c:if test="${second.parent_id==first.id}">
									<p><a href="${ctx}/search.shtml?id=${second.id}">${second.name}</a></p>
								</c:if>
							</c:forEach>
					</c:forEach>				
				</div>
				<div class="nav_right">
					<div class="nav_top">
						<img src="${ctx}/resources/img/vip.png" />
						<p>主人好！欢迎来逛靓淘~</p>
						<input type="button" value="会员中心" />
					</div>
					<div class="nav_down">
						<h2>包治百病</h2>
						<h3>17新款汇</h3>
						<img src="${ctx}/resources/img/bag.png" />
					</div>
				</div>
			</div>
			<ul class="circle">
				<c:forEach items="${listSlideShow}">
					<li class="current"></li>
				</c:forEach>
			</ul>
			<div class="left_fix">
				<a class="fix_a">
						购<br />
						物<br />
						车
					</a>
				<div style="background-image: url(${ctx}/resources/img/heart2.png); background-repeat: no-repeat; background-position: center 0;">

				</div>
				<div style="background-image: url(${ctx}/resources/img/shoucang.png); background-repeat: no-repeat; background-position: center 0;">

				</div>
				<div style="background-image: url(${ctx}/resources/img/time.png); background-repeat: no-repeat; background-position: center 0;">

				</div>
				<div style="background-image: url(${ctx}/resources/img/advice.png); background-repeat: no-repeat; border-bottom: 1px solid gray; background-position: center 0; ">

				</div>
				<div style="background-image: url(${ctx}/resources/img/top.png);background-repeat: no-repeat; background-position: center 10%;
					height: 50px;color: white;float: left; padding-top: 20px; text-align: center; ">
					TOP
				</div>
			</div>
		</div>
		<!-----------------------5.品牌选择区-------------------->
		<div class="select_Brand">
			<div class="select_title">
				<ul>
					<li>推荐品牌</li>
					<li>独家品牌</li>
					<li>欧美品牌</li>
					<li>国货品牌</li>
				</ul>
				<img class="brand_nav" src="${ctx}/resources/img/43.png" />
			</div>
			<div class="brand">
				<div class="left">
					<img src="${ctx}/resources/img/41.png" />
				</div>
				<div class="brand_bottom_right">
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/1.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>美加净</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/2.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>李医生</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/3.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>自然堂</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/4.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>佳洁士</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/32.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>镖旗男装</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/33.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>艺元素</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/5.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>泊美</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/6.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>赤道</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/7.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>欧珀莱</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/8.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>玉兰油</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/9.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>丁家宜</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/11.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>露得清</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/12.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>宝洁</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/35.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>波斯兰迪</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/14.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>水芝澳</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/51.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>傲慢季节</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/47.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>丹菲诗</p>
						</div>
					</a>
					<a href="">
						<div style="background-image: url(${ctx}/resources/img/38.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
							<p>奥利斯</p>
						</div>
					</a>

				</div>
			</div>
		</div>
		<!-----------------------6.抢购区-------------------->
		<div class="panic_Buying">
			<div class="box_1">
				<p style="margin-top: 34px; margin-left: 10px; font-size: 15px;" >
					限时快抢
				</p>
			</div>
			<div class="box_2">
				<div class="box2_1">
					<p style="margin-top: 34px; margin-left: 10px; font-size: 15px;">
						1元抢好货
					</p>
					<p style="font-size: 12px; margin-top: 8px; margin-left: 10px;color: #808080;">
						整点拼手速
					</p>
				</div>
				<div class="box2_2">
					<p style="margin-top: 34px; margin-left: 10px; font-size: 15px;">
						0.01抽好运
					</p>
					<p style="font-size: 12px; margin-top: 8px; margin-left: 10px;color: #808080;">
						一分钱幸运礼遇
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="box_3">
				<p style="margin-top: 34px; margin-left: 10px; font-size: 15px;" >
					团购特卖
				</p>
				<p style="font-size: 12px; margin-top: 8px; margin-left: 10px;color: #808080;">
					风格大牌春季新品<span style="color: #f41443; font-size: 12px;" >10点上新</span>
				</p>
			</div>
			<div class="box_4">
				<div class="box4_1">
					<p style="margin-top: 34px; margin-left: 10px; font-size: 15px;">
						品牌团
					</p>
				</div>
				<div class="box4_2">
					<p style="margin-top: 34px; margin-left: 10px; font-size: 15px;">
						入库质检
					</p>
					<p style="font-size: 12px; margin-top: 8px; margin-left: 10px;color: #f41443;">
						精选好货 劣一赔三
					</p>
				</div>
			</div>
			<div class="box_5">
				<p style="margin-top: 34px; margin-left: 10px; font-size: 15px;" >
					美妆团
				</p>
				<p style="margin-top: 8px; margin-left: 10px;" >
					超值大牌 折扣减免
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-----------------------7.红人穿搭区-------------------->
		<div class="person_demo">
			<div class="person_demo_title">
				<p class="demo_p">红人穿搭</p>
			</div>
			<div class="demo_box">

				<a href="">
					<div class="box1"></div>
				</a>
				<a href="">
					<div class="box2"></div>
				</a>
				<a href="">
					<div class="box3"></div>
				</a>
				<a href="">
					<div class="box4"></div>
				</a>
				<a href="">
					<div class="box5"></div>
				</a>
				<div class="clearfix">

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-----------------------8.广告条-------------------->
		<a href="">
			<div class="ad"></div>
		</a>
		<!-----------------------9.靓淘服装区-------------------->
		<div class="cloth">
			<div class="c_title">
				<ul>
					<li style="font-size: 16px;" >靓淘服饰</li>
					<li class="hot_li">&nbsp;&nbsp;&nbsp;热门搜索：</li>
					<li><a href="">卫衣 |</a></li>
					<li><a href="">风衣 |</a></li>
					<li><a href="">连衣裙 |</a></li>
					<li><a href="">阔腿裤 |</a></li>
					<li><a href="">小脚裤 |</a></li>
					<li><a href="">牛仔裤 |</a></li>
					<a class="all_a">
						查看全部&nbsp;&gt;
					</a>
				</ul>
			</div>
			<div class="left">
				<p class="bb_p">大牌新品折扣&nbsp;&gt;</p>
				<div class="pink_box">
					<p class="c_p1">牛仔裤潮流趋势</p>
					<p class="c_p2">女装春夏新品5折</p>
				</div>
			</div>
			<div class="right">
				<div class="big">
					<h1 style="font-size: 20px; margin-top: 18px; margin-left: 20px;color: rgb(51,51,51);" >
						条纹套装新品首发
					</h1>
					<h3 style="color: #808080;margin-top: 10px;margin-left: 20px;">
						立即预约享好礼
					</h3>
					<h6 style="color: rgb(249,130,155);margin-left: 20px;margin-top: 5px;">
						夏季新品 预约爆款
					</h6>
					<p style="margin-top: 60px;margin-left: 25px; ">
						<a style=" padding: 5px 10px 5px 10px; border: 1px solid rgb(51,51,51);color: rgb(51,51,51);" href="">
							立即查看
						</a>
					</p>
				</div>
				<div class="small1">
					<h2 style="font-size: 16px;margin-top: 15px;margin-left: 20px; color: rgb(51,51,51);">
						雪纺当道
					</h2>
					<h6 style="color: rgb(249,130,155);margin-left: 20px;margin-top: 5px;">
						一看百变雪纺风采
					</h6>
				</div>
				<div class="small2">
					<h2 style="font-size: 16px;margin-top: 15px;margin-left: 20px; color: rgb(51,51,51);">
						帅气黑色连体裤</h2>
					<h6 style="color: rgb(249,130,155);margin-left: 20px;margin-top: 5px;">
						精致细节利落休闲
					</h6>
				</div>
				<div class="small3">
					<h2 style="font-size: 16px;margin-top: 15px;margin-left: 20px; color: rgb(51,51,51);">
						早春时尚新条纹
					</h2>
					<h6 style="color: rgb(249,130,155);margin-left: 20px;margin-top: 5px;">
						春季新款条纹尖货
					</h6>
				</div>
				<div class="small4">
					<h2 style="font-size: 16px;margin-top: 15px;margin-left: 20px; color: rgb(51,51,51);">
						春夏型牛仔衬衫
					</h2>
					<h6 style="color: rgb(249,130,155);margin-left: 20px;margin-top: 5px;">
						OL的完美新姿
					</h6>
				</div>
				<div class="small5">
					<h2 style="font-size: 16px;margin-top: 15px;margin-left: 20px; color: rgb(51,51,51);">
						Amii工作装
					</h2>
					<h6 style="color: rgb(249,130,155);margin-left: 20px;margin-top: 5px;">
						百搭显瘦实穿时尚
					</h6>
				</div>
				<div class="small6">
					<h2 style="font-size: 16px;margin-top: 15px;margin-left: 20px; color: rgb(51,51,51);">
						初夏时尚T恤
					</h2>
					<h6 style="color: rgb(249,130,155);margin-left: 20px;margin-top: 5px;">
						新潮出众
					</h6>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="sp">
			<div class="sp1">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp2">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp3">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp4">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="more">
			<div class="mb1">
				<ul>
					<li>
						购物指南
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;免费注册
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;开通支付宝
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;支付宝充值
						</a>
					</li>
				</ul>
			</div>
			<div class="mb2">
				<ul>
					<li>
						品质保障
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;发票保障
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;售后规则
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;缺货赔付
						</a>
					</li>
				</ul>
			</div>
			<div class="mb3">
				<ul>
					<li>
						支付方式
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;快捷支付
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;信用卡
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;货到付款
						</a>
					</li>
				</ul>
			</div>
			<div class="mb4">
				<ul>
					<li>
						商家服务
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家入驻
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家中心
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;运营服务
						</a>
					</li>
				</ul>
			</div>
			<div class="mb5">
				<ul>
					<li>
						手机靓淘
					</li>
					<li>
						<img src="${ctx}/resources/img/98.png"/>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="link">
			<ul>
				<li>
					<a href="">
						关于靓淘
					</a>
				</li>
				<li>
					<a href="">
						帮助中心
					</a>
				</li>
				<li>
					<a href="">
						开放平台
					</a>
				</li>
				<li>
					<a href="">
						诚聘精英
					</a>
				</li>
				<li>
					<a href="">
						联系我们
					</a>
				</li>
				<li>
					<a href="">
						网站合作
					</a>
				</li>
				<li>
					<a href="">
						法律声明及隐私政策
					</a>
				</li>
				<li>
					<a href="">
						知识产权
					</a>
				</li>
				<li>
					<a href="">
						廉政举报
					</a>
				</li>
				<li>
					<a href="">
						规则意见征集
					</a>
				</li>
			</ul>
		</div>
		<div class="copyright">
			COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利. 客服热线：400-123-888888<br /> 
			京公网安备 110101020011226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|营业执照
		</div>
		<script type="text/javascript">
			var m = 0;
			$(".banner_box .banner").hide().eq(0).show();
			function changeImg(){
				if(m<3){m=m+1}else{m=0}
				$(".circle li").removeClass("current").eq(m).addClass("current");
				$(".banner_box .banner").hide().eq(m).show();
			}
			t = setInterval(changeImg,1000);
			$(".banner_box").mouseenter(
				function(){
				clearInterval(t);
				}
			).mouseleave(
				function(){
				t = setInterval(changeImg,1000);
				}
			)
			$(".circle li").click(
				function(){
					m = $(this).index();
					$(".circle li").removeClass("current").eq(m).addClass("current");
					$(".banner_box .banner").hide().eq(m).show();
				}
			)
/*			
			$(".banner_box .banner").hide().eq(0).show();
			$(".circle li").click(
				function(){
					var i = 0;
					i = $(this).index();
					$(".banner_box .banner").hide().eq(i).show();
					
				}
			)
			$(".circle li").click(
				function(){
					var n = 0;
					n = $(this).index();
					$(".circle li").removeClass("current").eq(n).addClass("current");
				}
			)*/
			
		</script>
	</body>

</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>靓淘网_购物车</title>
<link rel="stylesheet" href="${ctx}/resources/css/cart_style.css" />
<link rel="stylesheet" href="${ctx}/resources/css/login_layer_style.css" />
<script type="text/javascript"
	src="${ctx}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
<script type="text/javascript">
				function add(id,stock,price){
							var num = $("#num"+id).val();
							num++;
							if(num >= stock){
								alert("此商品只能买" + stock + "件"); 
								return; 
							}
							$("#num"+id).val(num);
							$('#price'+id).val(num*price);
							changeSelectCart();
				}
				
			 	 function sub(id,price){
					var num = $("#num"+id).val();
					if(num == 1){
						godelete(id);
						return;
					}
					num--;
					
					$("#num"+id).val(num);
					$('#price'+id).val(num*price);
					changeSelectCart();
				}
				
				function godelete(id){
					var isDel = confirm("你确定要删除吗？");
					if (isDel) {
						window.location.href="${ctx}/getCart/deleteCartNoUserName.shtml?productId="+id;
					}
				}
				
				function gotoOrder(){
				    var username = $("#username").val();
					if(username != null && username != ""){
						$("#mainForm").attr("action", "${ctx}/getOrder/goOrder.shtml?username="+username);
					    $("#mainForm").submit();
					}else{
						layer.open(
								{
									title: '登录',
								    type: 1,
								    content: $('#login').html() ,//这里content是一个DOM，这个元素要放在body根节点下
								}
						);
					}
				}
				
				function changeSelectCart(){
					var obj=document.getElementsByName('selectIds');
					var sum = 0;
					for(var i=0; i<obj.length; i++){ 
						if(obj[i].checked){
							sum += parseFloat($("#price"+obj[i].value).val());
						}
					}
					$("#amount")[0].innerHTML=sum;
				} 
				
				function selectAlls(){
					$("input[name=selectIds]").prop("checked", $("#selectAll").is(":checked"));
					var obj=document.getElementsByName('selectIds');
					var sum = 0;
					for(var i=0; i<obj.length; i++){ 
						if(obj[i].checked){
							sum += parseFloat($("#price"+obj[i].value).val());
						}
					}
					$("#amount")[0].innerHTML=sum;
				}
				
				function cleanCart(){
					var username = $("#username").val();
					if(username != null && username != ""){
						$.post(
						          "${ctx}/getCart/cleanCartHaveUserName.shtml", //url
						           {"username":username}, //date
						           function(data) {
						        	   if(data){
									   		alert("清空成功");				        		   
						        	   		window.location.href="${ctx}/getCart/goCart.shtml?username="+username
						        	   }else{
											alert("清空失败");				        		   
						        	   }
						           }, //callback
						           "json" //type
						       );
					}else{
						$.post(
						           "${ctx}/getCart/cleanCartNoUserName.shtml", //url
						           function(data) {
						        	   window.location.href="${ctx}/getDetailPage/getDetailNoUserName.shtml";
						           }, //callback
						           "json" //type
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
	<input id="newNum" value="" type="text"/>
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
	<div id="loginDiv" style="display: none;">
		<p>用户名:</p>
		<input type="text" id="usernameLogin" value="1" /><br />
		<p>密码:</p>
		<input type='text' id="passwordLogin" value="1" /><br /> <input
			onclick="login()" type="button" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="注册" />
	</div>


	<div class="bg_color">
		<div class="top_center">
			<div class="left">
				<span class="wel">欢迎来到靓淘网！</span>
			</div>
			<div class="right">
				<ul>
					<c:if test="${empty username }">
						<li><a href="${ctx}/getLogin/goLogin.shtml"
							target="_blank">请登录</a></li>
						<li><a href="register.html" target="_blank">快速注册</a></li>
					</c:if>
					<c:if test="${not empty username }">
						<li><a href="${ctx}/getLogin/goLogin.shtml"
							target="_blank">欢迎 : ${username }</a></li>
						<li><a href="javaScript:goexist();" target="_blank">注销</a></li>
					</c:if>
					<li><a class="collect" href="">我的收藏</a></li>
					<li><a class="indent" href="javascript:gotoUserOrder();">我的订单</a></li>
					<li><a class=phone href="">手机靓购</a></li>
					<li><a href="">我的积分</a></li>
					<li><a href="">我的评价</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="logo_center">
		<div class="left">
			<a href="${ctx}/index.shtml"/><img class="logo_img" src="${ctx}/resources//img/LOGO.png" /> <span
				class="car_text">购物车</span>
		</div>
		<div class="right">
			<input class="car_input" type="text" /> <input class="car_search"
				type="button" value="搜索" />
		</div>
	</div>
	<div class="title">
		<div class="title_top">
			<ul>
				<li><a href="">全部商品</a></li>
				<li><a href="">降价商品</a></li>
				<li><a href="">库存紧张</a></li>
			</ul>
			<p
				style="margin: 0; padding-right: 10px; float: right; line-height: 40px;">
				配送至：<span style="border: 1px solid rgb(51, 51, 51);">山东省 青岛市
					市南区 <img src="${ctx}/resources//img/narrow.png" />
				</span>
			</p>
		</div>
		<div class="title_center">
			<ul style="color: #666666; margin-top: 10px; margin-bottom: 10px;">
				<li style="margin-left: 16px; margin-right: 8px;"><input
					type="checkbox" /></li>
				<li style="margin-left: 8px; margin-right: 38px;">全选</li>
				<li style="margin-left: 38px; margin-right: 168px;">商品</li>
				<li style="margin-left: 138px; margin-right: 58px;">单价</li>
				<li style="margin-left: 58px; margin-right: 58px;">数量</li>
				<li style="margin-left: 58px; margin-right: 58px;">小计</li>
				<li style="margin-left: 58px; margin-right: 36px;">操作</li>
			</ul>
		</div>
		<div class="title_bottom">
			<input type="checkbox"
				style="color: #666666; margin: 23px 11px 10px 22px;" /> <img
				src="${ctx}/resources//img/156.png"
				style="margin: 0px 142px 0px 11px;" /> <img
				src="${ctx}/resources//img/157.png" style="margin-left: 142px;" />
		</div>
	</div>
	<form action="" method="post" id="mainForm">
		<c:forEach items="${buyCartVO.items}" var="cartItemVO">
			<input type="hidden" value="${cartItemVO.product.stock}"
				id="stock${cartItemVO.product.id}" />
			<div class="car_1">
				<div class="car_1_top">
					<img src="${ctx}/resources//img/158.png" />
					<p class="car_1_top_p">
						<span class="span1"> 活动商品购满¥105.00 ,
							即可加价换购商品1件&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span
							class="span2"> &nbsp;查看换购品 </span> <span class="span3">
							&nbsp;&nbsp;去凑单&gt; </span>
					</p>
				</div>
				<div class="car_2_bottom">
					<div class="car_con_1">
						<input value="${cartItemVO.product.id}" type="checkbox" onchange="changeSelectCart();"
							name="selectIds" />
					</div>
					<div class="car_con_2">
						<img src="${cartItemVO.product.fullUrl}" width="80" height="100" />
					</div>
					<div class="car_con_3">
						<p class="p_title"><a href="${ctx}/detail.shtml?id=${cartItemVO.product.id}">${cartItemVO.product.name}</a></p>
						<img src="${ctx}/resources//img/160.png" />
						<p class="p_seven">&nbsp;支持7天无理由退货</p>
						<img src="${ctx}/resources//img/161.png" />
						<p class="p_select">&nbsp;选包装</p>
					</div>
					<ul class="car_ul">
						<li class="price"><span
							style="color: #CCCCCC; margin-bottom: 15px; line-height: 20px;">
								<del>
									¥ 1699.00<br />
								</del>
						</span> <span style="color: #666666;"> ¥
								${cartItemVO.product.price} </span></li>
						<li class="num_select"><input class="car_ul_btn1"
							type="button" value="-"
							onclick="sub(${cartItemVO.product.id},${cartItemVO.product.price});" />
							<input class="car_ul_text" type="text" placeholder="1"
							value="${cartItemVO.quantity}" id="num${cartItemVO.product.id}" />
							<input class="car_ul_btn2" type="button" value="+"
							onclick="add(${cartItemVO.product.id},${cartItemVO.product.stock},${cartItemVO.product.price});" />
						</li>
						<li class="money"><span style="color: #F41443;"
							name="payment"> ¥
								<input type="text" value="${cartItemVO.product.price*cartItemVO.quantity}" id="price${cartItemVO.product.id}"/>
								 </span></li>
						<li class="delete"><a
							href="javaScript:godelete(${cartItemVO.product.id});"><img
								src="${ctx}/resources/img/166.png" /></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
		<div class="blank"></div>
		<div class="total">
			<ul style="color: #666666; margin-top: 10px; margin-bottom: 10px;">
				<li style="margin-left: 16px; margin-right: 8px;"><input
					type="checkbox" onclick="selectAlls();" id="selectAll" /></li>
				<li style="margin-left: 8px; margin-right: 265px;">全选</li>
				<%-- <li style="margin-left: 265px; margin-right: 18px;">总金额（已免运费）：<span
					style="color: #F41443;" id="totalPrice">¥${buyCartVO.totalPrice}</span></li> --%>
				<li>¥<em id="amount">0.00</em><span>总金额（已免运费）：</span></li>
				<li class="total_right"><a href="javaScript:gotoOrder();">立即结算</a></li>
				<li class="total_right"><a href="javascript:cleanCart();">清空购物车</a></li>
			</ul>
		</div>
	</form>
	<div class="sp">
		<div class="sp1">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="sp2">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="sp3">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="sp4">
			<p style="color: rgb(51, 51, 51);">品质保障</p>
			<p style="font-size: 12px; color: #808080; margin-top: 5px;">品质护航
				购物无忧</p>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="more">
		<div class="mb1">
			<ul>
				<li>购物指南</li>
				<li><a href=""> &nbsp;&nbsp;免费注册 </a></li>
				<li><a href=""> &nbsp;&nbsp;开通支付宝 </a></li>
				<li><a href=""> &nbsp;&nbsp;支付宝充值 </a></li>
			</ul>
		</div>
		<div class="mb2">
			<ul>
				<li>品质保障</li>
				<li><a href=""> &nbsp;&nbsp;发票保障 </a></li>
				<li><a href=""> &nbsp;&nbsp;售后规则 </a></li>
				<li><a href=""> &nbsp;&nbsp;缺货赔付 </a></li>
			</ul>
		</div>
		<div class="mb3">
			<ul>
				<li>支付方式</li>
				<li><a href=""> &nbsp;&nbsp;快捷支付 </a></li>
				<li><a href=""> &nbsp;&nbsp;信用卡 </a></li>
				<li><a href=""> &nbsp;&nbsp;货到付款 </a></li>
			</ul>
		</div>
		<div class="mb4">
			<ul>
				<li>商家服务</li>
				<li><a href=""> &nbsp;&nbsp;商家入驻 </a></li>
				<li><a href=""> &nbsp;&nbsp;商家中心 </a></li>
				<li><a href=""> &nbsp;&nbsp;运营服务 </a></li>
			</ul>
		</div>
		<div class="mb5">
			<ul>
				<li>手机靓淘</li>
				<li><img src="${ctx}/resources//img/98.png" /></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="link">
		<ul>
			<li><a href=""> 关于靓淘 </a></li>
			<li><a href=""> 帮助中心 </a></li>
			<li><a href=""> 开放平台 </a></li>
			<li><a href=""> 诚聘精英 </a></li>
			<li><a href=""> 联系我们 </a></li>
			<li><a href=""> 网站合作 </a></li>
			<li><a href=""> 法律声明及隐私政策 </a></li>
			<li><a href=""> 知识产权 </a></li>
			<li><a href=""> 廉政举报 </a></li>
			<li><a href=""> 规则意见征集 </a></li>
		</ul>
	</div>
	<div class="copyright">
		COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利. 客服热线：400-123-888888<br />
		京公网安备 110101020011226|京ICP证111033号|食品流通许可证
		SP1101051110165515（1-1）|营业执照
	</div>
</body>

</html>

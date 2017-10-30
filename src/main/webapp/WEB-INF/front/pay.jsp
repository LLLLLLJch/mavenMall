<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>结算页面</title>

	<link href="${ctx}/resources/css/amazeui.css" rel="stylesheet"
		type="text/css" />

	<link href="${ctx}/resources/css/demo.css" rel="stylesheet"
		type="text/css" />
	<link href="${ctx}/resources/css/cartstyle.css" rel="stylesheet"
		type="text/css" />

	<link href="${ctx}/resources/css/jsstyle.css" rel="stylesheet"
		type="text/css" />

	<script type="text/javascript" src="${ctx}/resources/js/address.js"></script>
	<script type="text/javascript" src="${ctx}/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
	<script type="text/javascript">
		function goexist() {
			var isExist = confirm("你确定要退出吗？");
			if (isExist) {
				location.href = "${ctx}/getLogin/goLogin.shtml"
			}

		}

		  function addShipping() {
			var username = $("#userName").val();
			var receiver_name = $("#name").val();
			var receiver_phone = $("#phone").val();
			var receiver_mobile = $("mobile").val();
			var receiver_province = $("#province").val();
			var receiver_city = $("#city").val();
			var receiver_district = $("#area").val();
			var receiver_address = $("#address").val();
			$.post("${ctx}/getShipping/addShipping.shtml", {
				"username" : username,
				"receiver_name" : receiver_name,
				"receiver_phone" : receiver_phone,
				"receiver_mobile" : receiver_mobile,
				"receiver_province" : receiver_province,
				"receiver_city" : receiver_city,
				"receiver_district" : receiver_district,
				"receiver_address" : receiver_address
			}, function(data) {
				if (data) {
					parent.layer.msg("添加成功");
					//当你在iframe页面关闭自身时
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					setTimeout(function(){
						parent.layer.close(index); //再执行关闭  
						window.parent.location.reload();//刷新父页面
					},100);
				} else {
					layer.msg("添加失败");
				}
			}, "json")
		}  
		
		  $(function() {
	           $.ajax({
	               url:"${ctx}/province/selectProvinces.shtml",
	               dataType:"json",
	               success:function(data,textStatus,ajax){
	                  var html = "<option>-请选择-</option>";
	                  for(var i=0;i<data.length;i++){
	                      html +="<option value='"+data[i].id+"'>"+data[i].province+"</option>";
	                  }
	                   $("#province").html(html);
	               }
	           });
	       }); 
	       
	       function selectCitys(obj) {
	           var provinceId = $(obj).val();
	           //清空城市下拉框中的内容，出第一项外
	           $("#city option:gt(0)").remove();
	           //清空地区下拉框中的内容，出第一项外
	           $("#area option:gt(0)").remove();
	           $.ajax({
	               url:"${pageContext.request.contextPath}/province/selectCitys.shtml",
	               data:"provinceId="+provinceId,
	               dataType:"json",
	               success:function(data,textStatus,ajax){
	                  var html = "<option>-请选择-</option>";
	                  for(var i=0;i<data.length;i++){
	                      html +="<option value='"+data[i].id+"'>"+data[i].city+"</option>";
	                  }
	                  $("#city").html(html);
	               }
	           });
	       }
	       
	       function selectAreas(obj) {
	           var cityId = $(obj).val();
	           //清空地区下拉框中的内容，出第一项外
	           $("#area option:gt(0)").remove();
	           $.ajax({
	               url:"${pageContext.request.contextPath}/province/selectAreas.shtml",
	               data:"cityId="+cityId,
	               dataType:"json",
	               success:function(data,textStatus,ajax){
	                  var html = "<option>-请选择-</option>";
	                  for(var i=0;i<data.length;i++){
	                      html +="<option value='"+data[i].id+"'>"+data[i].area+"</option>";
	                  }
	                  $("#area").html(html);
	               }
	           });
	       }
	       
	       //封装其通用内容
	       function append_template(jsonData,target){
	           var length = jsonData.length;
	           var html = "<option>-请选择-</option>";
	           for(var i=0;i<length;i++){
	               html +="<option value='"+data[i].id+"'>"+data[i].province+"</option>";
	           }
	           $("#"+target).html(html);
	       };
			
	       
	       function delShipping(shippingId){
	    	   $.post("${ctx}/getShipping/deleteShipping.shtml", {
					"shippingId" : shippingId
				}, function(data) {
					if (data) {
						parent.layer.msg("删除成功");
						//当你在iframe页面关闭自身时
						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
						setTimeout(function(){
							parent.layer.close(index); //再执行关闭  
							window.parent.location.reload();//刷新父页面
						},100);
					} else {
						layer.msg("删除失败");
					}
				}, "json")
	       }
	</script>
</head>

<body>
	<input type="hidden" value="${username}" id="userName" />
	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<c:if test="${empty username }">
						<li><a class="login" href="${ctx}/getLogin/goLogin.shtml"
							target="_blank">请登录</a></li>
						<li><a href="register.html" target="_blank">快速注册</a></li>
					</c:if>
					<c:if test="${not empty username }">
						<li><a class="login" href="${ctx}/getLogin/goLogin.shtml"
							target="_blank">欢迎 : ${username }</a></li>
						<li><a href="javaScript:goexist();" target="_blank">注销</a></li>
					</c:if>
				</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="#" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="${ctx}/getOrder/gotoUserOrder.shtml?username=${username}" target="_top"><i class="am-icon-user am-icon-fw"></i>订单详情</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="${ctx}/getCart/goCart.shtml?username=${username}" target="_top"><i
						class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
						id="J_MiniCartNum" class="h">0</strong></a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="${ctx}/resources/img/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="${ctx}/resources/img/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>
	<form action="${ctx}/getOrder/putInOrder.shtml">
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger"
						>使用新地址</div>
				</div>
				<div class="clear"></div>
				<ul>
					<c:forEach items="${listShipping}" var="shipping">
						<li class="user-addresslist">
							<div class="address-left">
								<div class="user DefaultAddr">
									<input type="checkbox" name="shipping_id" value="${shipping.id}"/>
									<span class="buy-address-detail"> <span class="buy-user">${shipping.receiver_name}
									</span> <span class="buy-phone">${shipping.receiver_phone}</span>
									</span>
								</div>
								<div class="default-address DefaultAddr">
									<span class="buy-line-title buy-line-title-type">收货地址：</span> <span
										class="buy--address-detail"> <span class="province">${shipping.receiver_province}
										<span class="city">${shipping.receiver_city} <span class="dist">${shipping.receiver_district} <span
										class="street">${shipping.receiver_address}</span>
									</span> </span>
								</div>
								<ins class="deftip hidden">默认地址</ins>
							</div>
							<div class="address-right">
								<span class="am-icon-angle-right am-icon-lg"></span>
							</div>
							<div class="clear"></div>
	
							<div class="new-addr-btn">
								<a href="#">设为默认</a> <span class="new-addr-bar">|</span> <a
									href="#">编辑</a> <span class="new-addr-bar">|</span> <a
									href="javascript:void(0);" onclick="delShipping(${shipping.id});">删除</a>
							</div>

						</li>	
					</c:forEach>

				</ul>

				<div class="clear"></div>
			</div>
			<!--物流 -->
			<div class="logistics">
				<h3>支付方式</h3>
				<ul class="op_express_delivery_hot">
					<li data-value="yuantong" class="OP_LOG_BTN  ">
					<input type="checkbox" name="payment_type" value="1"/>
					<i class="c-gap-right" style="background-position: 0px -468px"></i>在线支付<span></span></li>
					<li data-value="shentong" class="OP_LOG_BTN  ">
					<input type="checkbox" name="payment_type" value="2"/>
					<i class="c-gap-right" style="background-position: 0px -1008px"></i>货到付款<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>

			<!--支付方式-->
			<div class="logistics">
				<h3>选择支付方式</h3>
				<ul class="pay-list">
					<li class="pay card"><img
						src="${ctx}/resources/img/wangyin.jpg" />银联<span></span></li>
					<li class="pay qq"><img
						src="${ctx}/resources/img/weizhifu.jpg" />微信<span></span></li>
					<li class="pay taobao"><img
						src="${ctx}/resources/img/zhifubao.jpg" />支付宝<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>
					<c:forEach items="${order.orderItemList}" var="order">
						<input type="hidden" name="productIds" value="${order.product.id}"/>
						<tr class="item-list">
							<div class="bundle  bundle-last">

								<div class="bundle-main">
									<ul class="item-content clearfix">
										<div class="pay-phone">
											<li class="td td-item">
												<div class="item-pic">
													<a href="#" class="J_MakePoint"> <img alt=""
														src="${order.product.fullUrl}" width="100" height="80"></a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<a href="#" class="item-title J_MakePoint"
															data-point="tbcart.8.11">${orderItem.product.name}</a>
													</div>
												</div>
											</li>
											<li class="td td-info">
												<div class="item-props">
													<span class="sku-line">颜色：12#川南玛瑙</span> <span
														class="sku-line">包装：裸装</span>
												</div>
											</li>
											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now">${order.product.price}</em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<span class="phone-title">购买数量</span>
													<div class="sl">
														<input class="text_box" name="" type="text"
															value="${order.product.quantity}" style="width: 30px;" />
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number">${order.product.price*order.product.quantity}</em>
											</div>
										</li>
										<li class="td td-oplist">
											<div class="td-inner">
												<span class="phone-title">配送方式</span>
												<div class="pay-logis">
													快递<b class="sys_item_freprice">10</b>元
												</div>
											</div>
										</li>

									</ul>
									<div class="clear"></div>
					</c:forEach>
				</div>
				</tr>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="pay-total">
			<!--留言-->
			<div class="order-extra">
				<div class="order-user-info">
					<div id="holyshit257" class="memo">
						<label>买家留言：</label> <input type="text"
							title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
							placeholder="选填,建议填写和卖家达成一致的说明"
							class="memo-input J_MakePoint c2c-text-default memo-close">
							<div class="msg hidden J-msg">
								<p class="error">最多输入500个字符</p>
							</div>
					</div>
				</div>

			</div>
			<!--优惠券 -->
			<div class="buy-agio">
				<li class="td td-coupon"><span class="coupon-title">优惠券</span>
					<select data-am-selected>
						<option value="a">
							<div class="c-price">
								<strong>￥8</strong>
							</div>
							<div class="c-limit">【消费满95元可用】</div>
						</option>
						<option value="b" selected>
							<div class="c-price">
								<strong>￥3</strong>
							</div>
							<div class="c-limit">【无使用门槛】</div>
						</option>
				</select></li>

				<li class="td td-bonus"><span class="bonus-title">红包</span> <select
					data-am-selected>
						<option value="a">
							<div class="item-info">
								¥50.00<span>元</span>
							</div>
							<div class="item-remainderprice">
								<span>还剩</span>10.40<span>元</span>
							</div>
						</option>
						<option value="b" selected>
							<div class="item-info">
								¥50.00<span>元</span>
							</div>
							<div class="item-remainderprice">
								<span>还剩</span>50.00<span>元</span>
							</div>
						</option>
				</select></li>

			</div>
			<div class="clear"></div>
		</div>
		<!--含运费小计 -->
		<div class="buy-point-discharge ">
			<p class="price g_price ">
				<input type="hidden" name="username" value="${username}"/>
				<input type="hidden" name="payment" value="${order.payment}"/>
				合计（含运费） <span>¥</span><em class="pay-sum">${order.payment}</em>
			</p>
		</div>

		<!--信息 -->
		<div class="order-go clearfix">
			<div class="pay-confirm clearfix">
				<div class="box">
					<div tabindex="0" id="holyshit267" class="realPay">
						<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
							<em class="style-large-bold-red " id="J_ActualFee">${order.payment}</em>
						</span>
					</div>

					<div id="holyshit268" class="pay-address">

						<p class="buy-footer-address">
							<span class="buy-line-title buy-line-title-type">寄送至：</span> <span
								class="buy--address-detail"> <span class="province">湖北</span>省
								<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
								class="street">雄楚大道666号(中南财经政法大学)</span>
							</span> </span>
						</p>
						<p class="buy-footer-address">
							<span class="buy-line-title">收货人：</span> <span
								class="buy-address-detail"> <span class="buy-user">艾迪
							</span> <span class="buy-phone">15871145629</span>
							</span>
						</p>
					</div>
				</div>

				<div id="holyshit269" class="submitOrder">
					<div class="go-btn-wrap">
						<input type="submit" value="提交订单"/>
					</div>
				</div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<div class="clear"></div>
	</div>
	</div>
	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
		<div class="footer-bd">
			<p>
				<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
					href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
					href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
					- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
					target="_blank">网页模板</a></em>
			</p>
		</div>
	</div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form method="post" action="${ctx}/getShipping/addShipping.shtml" class="am-form am-form-horizontal">
				<input type="hidden" value="${username}" name="username"/>
				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" name="receiver_name" id="name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input name="receiver_phone" id="phone" placeholder="手机号必填" type="text">
					</div>
				</div>
				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">固定号码</label>
					<div class="am-form-content">
						<input id="mobile" name="receiver_mobile" placeholder="选填" type="text">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">所在地</label>
					<div class="am-form-content address">
						    <select id="province" name="receiver_province" onchange="selectCitys(this)">
						       <option value="">-请选择-</option>
						    </select>
						    <select id="city" name="receiver_city" onchange="selectAreas(this)">
						       <option value="">-请选择-</option>
						    </select>
						    <select id="area" name="receiver_district">
						       <option value="">-请选择-</option>
						    </select>

					</div>
				</div>

				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" name="receiver_address" id="address" placeholder="输入详细地址"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<input type="button" onclick="addShipping();" value="保存"/>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="clear"></div>
</body>

</html>
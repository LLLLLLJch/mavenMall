<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>商品详情页</title>
		<link rel="stylesheet" type="text/css" href="/java1707Mall/resources/css/detail_style.css" />
		<script type="text/javascript" src="/java1707Mall/resources/thirdlib/jqury/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="/java1707Mall/resources/thirdlib/layer-v3.1.0/layer/layer.js"></script>
		<script type="text/javascript">
			function add(){
				var num = $("#num").val();
				num++;
				if(num>'${product.stock}'){
					alert("此商品只能买" + '${product.stock}' + "件"); 
					return; 
				}
				$("#num").val(num);
			}
			
			function goLogin(){
				window.location.href="/java1707Mall/getLogin/goLogin.shtml?relUrl="+window.location.href;
			}
			
			function sub(){
				var num = $("#num").val();
				num--;
				if(num == 0){
					return;
				}
				$("#num").val(num);
			}
			
			function addCart(){
				var product_id = $("#id").val();
				var username = $("#username").val();
					var quantity = $("#num").val();
				if(username != null && username != ""){
					var quantity = $("#num").val();
					 $.post(
						"/java1707Mall/getDetailPage/getDetailHaveUserName.shtml",
						{
							"productId" : product_id,
							"username" : username,
							"quantity" : quantity
						},
						function(data){
							if(data){
								alert('添加成功');
							}else{
								alert("添加失败");
							}
						},
						"json"
					) 
				}else{ 
						window.location.href="/java1707Mall/getDetailPage/getDetailNoUserName.shtml?productId="+product_id+"&quantity="+quantity;
				 } 
			}
			
			
			function goCart(){
				var product_id = ${product.id};
				var username = $("#username").val();
				if(username != null && username != ""){
					var quantity = $("#num").val();
					 $.post(
						"/java1707Mall/getDetailPage/getDetail.shtml",
						{
							"product_id" : product_id,
							"username" : username,
							"quantity" : quantity
						},
						function(data){
							if(data){
								window.location.href="/java1707Mall/getCart/goCart.shtml?username="+username+"";
							}else{
								alert("操作失败");
							}
						},
						"json"
					)
				}else{
					layer.open(
							{
								title: '登录',
							    type: 1,
							    skin: 'layui-layer-rim', //加上边框
							    content: $('#loginDiv').html() ,//这里content是一个DOM，这个元素要放在body根节点下
							}
					);
				}
			}
			
			function goexist(){
				var isExist = confirm("你确定要退出吗？");
				if (isExist) {
					location.href = "/java1707Mall/getLogin/goLogin.shtml"
				}

			}
			
			function gotoCart(){
				var username = $("#username").val();
				//如果登录了
				if(username != null && username != ""){
					window.location.href="/java1707Mall/getCart/goCart.shtml?username="+username+"";
				}else{
					window.location.href="/java1707Mall/getDetailPage/getDetailNoUserName.shtml";
				}
			}
		</script>
	</head>

	<body>
		<#if "${username}" != null>
			<input type="hidden" value="${username}" id = "username"/>
		</#if>
		<!--top-->
		<div class="top_big">
			<div class="top_center">
				<div class="left">
					欢迎来到靓淘网！
				</div>
				<div class="right">
					<ul>
						<#if "${username}"!=null>
								<li><a href="/java1707Mall/getLogin/goLogin.shtml" target="_blank">欢迎 : ${username }</a></li>
								<li><a href="javaScript:goexist();" target="_blank">注销</a></li>
							<#else>
								<li><a href="javaScript:goLogin();" target="_blank">请登录</a></li>
								<li><a href="javaScript:register();" target="_blank">快速注册</a></li>
						</#if>
						<li>
							<a class="collect" href="">我的收藏</a>
						</li>
						<li>
							<a class="indent" href="">我的订单</a>
						</li>
						<li>
							<a class="phone" href="">手机靓淘</a>
						</li>
						<li>
							<a href="">我的积分</a>
						</li>
						<li>
							<a href="">我的评价</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!---------------logo-------------------->
		<div class="logo_center">
			<div class="left">
				<a href="/java1707Mall/index.shtml"/><img src="/java1707Mall/resources/img/LOGO.png" />
			</div>
			<div class="center">
				<input class="logo_search" type="text" />
				<input class="logo_btn" type="button" value="搜索" />
				<ul class="logo_ad">
					<li>
						<a href="">值得买 |</a>
					</li>
					<li>
						<a href="">小米6 |</a>
					</li>
					<li>
						<a href="">金立 |</a>
					</li>
					<li>
						<a href="">华为畅享 7P |</a>
					</li>
					<li>
						<a href="">苹果7 |</a>
					</li>
					<li>
						<a href="">1元800M |</a>
					</li>
				</ul>
			</div>
			<div class="right">
				<a style="color: #666666;" href="javaScript:gotoCart();">去购物车结算</a>
				<div class="logo_nav">

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="menu">
			<div class="menu_center">
				<ul class="menu_ul">
					<li>
						<a class="all_a" href="">全部商品分类</a>
					</li>
					<li>
						<a href="index.html" target="_blank">商城首页</a>
					</li>
					<li>
						<a href="">手机首页</a>
					</li>
					<li>
						<a href="">新机首发</a>
					</li>
					<li>
						<a href="">手机社区</a>
					</li>
					<li>
						<a href="">企业采购</a>
					</li>
					<li>
						<a href="">精选店铺</a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
		<div class="little_menu_bg">
			<div class="little_menu">
				<ul>
					<li class="little_menu_left">
						&nbsp;&nbsp;&nbsp;&nbsp;${categoryParent.name}&nbsp;&gt;&nbsp;&nbsp;
							${categorySon.name}&nbsp;&gt;&nbsp;&nbsp;${product.name}
					</li>
					<li class="little_menu_right">
						华为官方旗舰店
						<img src="/java1707Mall/resources/img/tou.png" /> 联系供应商
					</li>
					<li class="little_menu_bottom">
						<img src="/java1707Mall/resources/img/shoucang2.png" /> 联系供应商
					</li>
				</ul>
			</div>
		</div>
		<div class="banner_center">
			<div class="left">
				<ul>
					<li class="banner_center_left_top">
						<img src="${product.fullUrl}" width="350" height="350" class="jqzoom"/>
					</li>
					<li class="banner_center_left_center">
						<ul>
							<li class="left_right_nav">
								<img src="/java1707Mall/resources/img/left.png" />
							</li>
							<#list subImages as image>
								<li class="small_shop">
									<img src="${image}" />
								</li>
							</#list>
							<li class="left_right_nav">
								<img src="/java1707Mall/resources/img/right.png" />
							</li>
						</ul>
					</li>
					<li class="banner_center_left_bottom">
						<img src="/java1707Mall/resources/img/xin.png" />&nbsp;关注&nbsp;&nbsp;
						<img src="/java1707Mall/resources/img/enjoy.png" />&nbsp;分享&nbsp;&nbsp;
						<img src="/java1707Mall/resources/img/duizhao.png" />&nbsp;对比
					</li>
				</ul>
			</div>
			<div class="right">
				<input type="hidden" id= "id" value="${product.id}" name="product_id"/>
				<ul>
					<li class="right_1" name = "product.name">
						<span class="title">	
							${product.name}
						</span><br />
						<span class="next_title" name="product.subtitle">
							${product.subtitle}
						</span>
					</li>
					<li class="right_2">
						<ul>
							<li class="right_2_1">
								<img class="img_117" src="/java1707Mall/resources/img/117.png" />
								<span class="right_2_1_span">
									&nbsp;&nbsp;&nbsp;全靓淘实物商品通用
								</span>
							</li>
							<li class="right_2_2">
								<span class="right_2_2_span">
									去挂券
								</span>
								<img src="/java1707Mall/resources/img/120.png" />
							</li>
							<li class="right_2_3" name="product.price">
								<span class="right_2_3_span">
									促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<span>
									¥ ${product.price}&nbsp;&nbsp;
								</span>
							</li>
							<li class="right_2_4">
								<span class="right_2_4_span">
									支&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;持&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<img src="/java1707Mall/resources/img/119.png" />&nbsp;&nbsp;
								<img src="/java1707Mall/resources/img/118.png" />
							</li>
							<li class="right_2_5">
								<span class="right_2_5_span">
									本店活动&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<span class="right_2_5_span_2">
									满79元，包邮
								</span>
							</li>
							<li class="right_2_6">
								<span class="right_2_6_span">
									更多优惠
								</span>
								<img src="/java1707Mall/resources/img/xia.png" />
							</li>
						</ul>
					</li>
					<li class="right_3">
						<span>
									运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费&nbsp;&nbsp;&nbsp;&nbsp;
									广东	深圳&nbsp;至&nbsp;青岛&nbsp;&nbsp;&nbsp;
									<img src="/java1707Mall/resources/img/xia.png"/>&nbsp;
									市南区&nbsp;
									<img src="/java1707Mall/resources/img/xia.png"/>&nbsp;
									香港中路街道&nbsp;
									<img src="/java1707Mall/resources/img/xia.png"/>&nbsp;
									快递：0.00
							</span>

					</li>
					<li class="right_4">
						<ul>
							<li>
								<span class="right_4_1">
									选择颜色
								</span>
								<span class="right_4_2">
									金色
								</span>
								<span class="right_4_3">
									银色
								</span>
								<span class="right_4_4">
									粉色
								</span>
							</li>
							<li class="vision">
								<span class="right_4_1">
									选择版本
								</span>
								<span class="right_4_5">
									普通版
								</span>
								<span class="right_4_6">
									移动定制版
								</span>
							</li>
							<li class="buy_way">
								<span class="right_4_1">
									购买方式
								</span>
								<span class="right_4_7">
									官方标配
								</span>
							</li>
							<li class="safeguard">
								<span class="right_4_1">
									增值保障
								</span>
								<span class="right_4_8">
									屏碎保1年&nbsp;¥66&nbsp;
									<img src="/java1707Mall/resources/img/111.png"/>
								</span>
								<span class="right_4_9">
									1年内换新&nbsp;¥86&nbsp;
									<img src="/java1707Mall/resources/img/111.png"/>
								</span>
								<span class="right_4_10">
									屏碎保2年&nbsp;¥96&nbsp;
									<img src="/java1707Mall/resources/img/111.png"/>
								</span>
							</li>
						</ul>
					</li>
					<li class="right_bottom">
						<span class="right_txt">
							数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
						<input class="right_bottom_text" type="text" value="1" id = "num" name="quantity"/>
						<ul class="right_bottom_btn">
							<li>
								<input class="right_bottom_substract" type="button" value="-" onclick="sub();" />
								<input class="right_bottom_add" type="button" value="+" onclick="add();"/>
							</li>
						</ul>
						<input class="right_bottom_addCar" onclick="addCart();" type="button" value="加入购物车" />
						<input class="right_bottom_addCar" onclick="goCart();" type="button" value="立即购买" />
						<span class="right_txt_bottom">
							温馨提示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;·支持7天无理由退货
						</span>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="add">
			<div class="add_title">
				<ul class="add_title_ul">
					<li>
						<a class="current" href="">人气配件</a>
					</li>
					<li>
						<a href="">手机贴膜</a>
					</li>
					<li>
						<a href="">手机保护套</a>
					</li>
					<li>
						<a href="">数据线</a>
					</li>
					<li>
						<a href="">充电器</a>
					</li>
					<li>
						<a href="">移动电源</a>
					</li>
					<li>
						<a href="">
							更多
							<img src="/java1707Mall/resources/img/111.png" />
						</a>
					</li>
				</ul>
			</div>
			<div class="add_content">
				<ul>
					<li>
						<div class="title_center_img">
							<img src="/java1707Mall/resources/img/130.png" />
						</div>
						<div class="title_center_p">
							派滋&nbsp;华为畅享6S钢化膜畅享6S手机贴膜&nbsp;高清透明
						</div>
					</li>
					<li>
						<div class="add_img">
							<img src="/java1707Mall/resources/img/jia.png" />
						</div>
					</li>
					<li>
						<div class="title_center_img">
							<img src="/java1707Mall/resources/img/131.png" />
						</div>
						<div class="title_center_p">
							机灵猫 畅享6S手机壳女防摔带支架保护套
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;18.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="/java1707Mall/resources/img/137.png" />
						</div>
						<div class="title_center_p">
							机灵猫 畅享6S手机壳女防摔带支架保护套
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;26.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="/java1707Mall/resources/img/132.png" />
						</div>
						<div class="title_center_p">
							品胜 Type-C/MicroUSB/Lightning接口三个
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;29.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="/java1707Mall/resources/img/133.png" />
						</div>
						<div class="title_center_p">
							品胜 iPad充电器 移动电源充电
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;35.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="/java1707Mall/resources/img/134.png" />
						</div>
						<div class="title_center_p">
							罗马式（POMOSS）LED数显屏 移动
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;108.00
						</span>
					</li>
					<li>
						<div class="nav_img">
							<img src="/java1707Mall/resources/img/135.png" />
						</div>
					</li>
					<li>
						<div class="eq_img">
							<img src="/java1707Mall/resources/img/136.png" />
						</div>
					</li>
					<li>
						<div class="add_all">
							<span class="now_get">
								已选0个配件
							</span>
							<span class="all_money_txt">
								组合价
							</span>
							<span class="all_money">
								&nbsp;¥&nbsp;1499.00
							</span>
							<input class="now_buy" type="button" value="立即购买" />
							<input class="select_buy" type="button" value="配件选购中心" />
						</div>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="detial_info">
			<div class="left">
				<div class="left_top">
					关于手机，您可能再找
				</div>
				<p class="want_content">
					安卓（Android）
				</p>
				<p class="want_content">
					5.0-4.6英寸
				</p>
				<p class="want_content">
					双卡双待
				</p>
				<p class="want_content">
					骁龙芯片
				</p>
				<p class="want_content">
					自拍神器
				</p>
				<p class="want_content">
					3GB
				</p>
				<p class="want_content">
					联通4G
				</p>
				<p class="want_content">
					电信4G
				</p>
				<p class="want_content">
					移动4G/联通4G/电信4G
				</p>
				<p class="want_content">
					移动4G
				</p>
				<p class="want_content">
					32GB
				</p>
				<p class="want_content">
					8核
				</p>
			</div>
			<div class="right">
				${product.detail}
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="surper_big">
			<div class="left_big">
			<div class="left">
				<div class="left">
					<div class="left_top">
						达人选购
					</div>
					<ul>
						<li>
							<img src="/java1707Mall/resources/img/138.png" />
							<p class="small_p">荣耀&nbsp;畅玩6X&nbsp;32GB&nbsp;全网通4G手机&nbsp;高配版&nbsp;铂光金<br />
								<span class="left_money">
								¥&nbsp;1299.00
							</span>
							</p>
						</li>
						<li>
							<img src="/java1707Mall/resources/img/139.png" />
							<p class="small_p">华为 4GB 32GB 全网通4G手机 高配版 白色<br />
								<span class="left_money">
								¥&nbsp;1299.00
							</span>
							</p>
						</li>
						<li>
							<img src="/java1707Mall/resources/img/140.png" />
							<p class="small_p">华为 HUAWEI noal64GB版本手机 高配版 玫瑰金<br />
								<span class="left_money">
								¥&nbsp;1299.00
							</span>
							</p>
						</li>
						<li>
							<img src="/java1707Mall/resources/img/141.png" />
							<p class="small_p">荣耀 麦芒5X 64GB 全网通4G手机 高配版 香槟金<br />
								<span class="left_money">
								¥&nbsp;2299.00
							</span>
							</p>
						</li>
						<li>
							<img src="/java1707Mall/resources/img/142.png" />
							<p class="small_p">荣耀 V9 4GB+64GB 全网通4G手机 高配版 极光蓝<br />
								<span class="left_money">
								¥&nbsp;1299.00
							</span>
							</p>
						</li>
						<li>
							<img src="/java1707Mall/resources/img/143.png" />
							<p class="small_p">荣耀 畅玩7X 64GB 全网通4G手机 高配版 铂光金<br />
								<span class="left_money">
								¥&nbsp;1499.00
							</span>
							</p>
						</li>
						<li>
							<img src="/java1707Mall/resources/img/144.png" />
							<p class="small_p">荣耀 P9 双卡双待 全网通4G手机 高配版 皓月银<br />
								<span class="left_money">
								¥&nbsp;1699.00
							</span>
							</p>
						</li>
						<li>
							<img src="/java1707Mall/resources/img/145.png" />
							<p class="small_p">荣耀8 青春版 32GB 全网通4G手机 高配版 铂光金<br />
								<span class="left_money">
								¥&nbsp;1399.00
							</span>
							</p>
						</li>
					</ul>
				</div>
			</div>
			<div class="ranking">
				<div class="top">
					手机热销榜
				</div>
				<div class="center_ranking">
					<ul>
						<li>
							<a class="current" href="">同价位</a>
						</li>
						<li>
							<a href="">同品牌</a>
						</li>
						<li>
							<a href="">总排行</a>
						</li>
					</ul>
				</div>
				<div class="bottom">
					<ul>
						<li class="ranking_1">
							<img class="brand_ranking" src="/java1707Mall/resources/img/yuan1.png"/>
							<span class="brand_name">华为荣耀6X</span>
							<span class="brand_price">¥&nbsp;1699.00</span>
						</li>
						<li class="ranking_2">
							<img class="brand_ranking" src="/java1707Mall/resources/img/yuan1.png"/>
							<span class="brand_name">360N5</span>
							<span class="brand_price">¥&nbsp;1699.00</span>
						</li>
						<li class="ranking_3">
							<img class="brand_ranking" src="/java1707Mall/resources/img/yuan1.png"/>
							<span class="brand_name">OPPOA57</span>
							<span class="brand_price">¥&nbsp;1699.00</span>
						</li>
						<li class="ranking_4">
							<img class="brand_ranking" src="/java1707Mall/resources/img/yuan1.png"/>
							<span class="brand_name">小米Note4</span>
							<span class="brand_price">¥&nbsp;1199.00</span>
						</li>
						<li class="ranking_5">
							<img class="brand_ranking" src="/java1707Mall/resources/img/yuan1.png"/>
							<span class="brand_name">诺基亚6</span>
							<span class="brand_price">¥&nbsp;1699.00</span>
						</li>
						<li class="ranking_6">
							<img class="brand_ranking" src="/java1707Mall/resources/img/yuan1.png"/>
							<span class="brand_name">乐视乐2</span>
							<span class="brand_price">¥&nbsp;1699.00</span>
						</li>
						<li class="ranking_7">
							<img class="brand_ranking" src="/java1707Mall/resources/img/yuan1.png"/>
							<span class="brand_name">小米5</span>
							<span class="brand_price">¥&nbsp;1599.00</span>
						</li>
					</ul>
				</div>
			</div>
			</div>
			<!--=====================-->
			<div class="right_big">
				<div class="big_img">
					${product.detail}
				</div>
				<div class="right_big_bottom">
					<ul class="right_big_bottom_ul">
						<li class="end_safeguard">
							售后保障
						</li>
						<li class="server_safeguard">
							<span class="server" >
								厂家服务<br />
							</span>
							<span class="server_detial">
							本产品全国联保，享受三包服务，保质期为：一年质保<br />
							如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br />
							（注：如厂商在商品介绍中有售后保障的说明，则此商品按照厂家说明执行售后保障服务。）<br />
							</span>
						</li>
						<li class="server_safeguard">
							<span class="server">
								靓淘服务<br />
							</span>
							<span class="server_detial">
							本产品全国联保，享受三包服务，保质期为：一年质保<br />
							如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br />
							（注：如厂商在商品介绍中有售后保障的说明，则此商品按照厂家说明执行售后保障服务。）<br />
							</span>
						</li>
						<li class="server_safeguard">
							<span class="server">
								全国联保<br />
							</span>
							<span class="server_detial">
							本产品全国联保，享受三包服务，保质期为：一年质保<br />
							如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br />
							<span class="end">
								注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，不能确保客户收到的货物与商品图片一致，只能确保为原厂正品货物！<br />
								若本商城没有及时更新，请大家谅解！
							</span>
							</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!------------------------------------------------------------------>

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
						<img src="/java1707Mall/resources/img/98.png" />
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
			COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利. 客服热线：400-123-888888<br /> 京公网安备 110101020011226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|营业执照
		</div>
	</body>

</html>
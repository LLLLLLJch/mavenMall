<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网-注册</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/register_style.css" />
		<script type="text/javascript">
		function gotoRegister(){
			var userName = $("#userName").val();
			var password = $("#password").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var question = $("#question").val();
			var answer = $("#answer").val();
			 $.post(
		               "${ctx}/getLogin/gotoRegister.shtml", //url
		               {"userName":userName,"password":password,"email":email,"phone":phone,"question":question,"answer":answer}, //data
		               function(data) { //callback
		            	   if(data){
				                  alert("注册成功");
				                  window.location.href="${ctx}/getLogin/goLogin.shtml";
			            	   }else{
			            		   alert("注册失败");
			            	   }
		               },
		               "json" //type
		           );
		}
		</script>
	</head>

	<body>
		<div class="top_center">
			<div class="left">
				<img src="img/LOGO.png" />
			</div>
			<div class="right">
				<ul>
					<li class="top_seven">7天无理由退换货</li>
					<li class="top_real">100%正品保证</li>
					<li class="top_back">退货返运费</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="banner">
			<img class="banner_img" src="${ctx}/resources/img/110.png" />
			<div class="banner_center">
				<form>
					<div class="register">
						<ul>
							<li class="register_title_1">
								<span style="font-size: 20px;color: #F41443;font-weight: 900;">
									用户注册
								</span>
								<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已有账号<a style="color: #F41443;" class="here" href="">在此登录</a></span>
							</li>
							<li>
								<input class="register_user" type="text" placeholder="会员名" name="userName" id="userName"/>
							</li>
							<li>
								<input class="register_user" type="text" placeholder="密码" name="password" id="password"/>
							</li>
							<li>
								<input class="register_user" type="text" placeholder="邮箱" name="email" id="email"/>
							</li>
							<li>
								<input class="register_user" type="text" placeholder="手机号" name="phone" id="phone"/>
							</li>
							<li>
								<select name="question" id="question">
									<option value="">请选择问题</option>
									<option value="1">你妈妈的名字</option>
									<option value="2">你爸爸的名字</option>
									<option value="3">你奶奶的名字</option>
									<option value="4">你爷爷的名字</option>
									<option value="5">你姥姥的名字</option>
								</select>
							</li>
							<li>
								<input class="register_user" type="text" placeholder="答案" name="answer" id="answer"/>
							</li>
							<li>
								<input class="register_finish" onclick="gotoRegister();" type="button" value="同意协议并注册" />
							</li>
							<li class="register_bottom">
								<a href="#"><span style="color: #F41443;">《靓淘优选用户协议》</span></a>
							</li>
						</ul>

					</div>
				</form>
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
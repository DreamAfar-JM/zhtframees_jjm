<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/resources/meta/taglib.jsp" %>
<%@ include file="/resources/meta/meta.jsp" %>
<%@ include file="/resources/meta/jquery.jsp" %>
<%@ include file="/resources/meta/easyui.jsp" %>
<%@ include file="/resources/meta/easyui-selfdefine.jsp" %>
<%@ include file="/resources/meta/bootstrap.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>天然气</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link rel="icon" type="image/gif"
	href="${pageContext.request.contextPath}/resources/images/fromedit.png" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/md5-min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/334/css/bootstrap-responsive.min.css" />
<style type="text/css">
.staticDiv {
	position: absolute;
	bottom: 10px;
	left: 50%;
	z-index: 15;
	width: 60%;
	padding-left: 0;
	margin-left: -30%;
	text-align: center;
	list-style: none
}
</style>
<script>
	$(function() {

		$('.carousel').carousel();
		$("#loginForm_user_login,#login_modal_header").popover();
		$('#loginForm_user_login,#jcaptchaCode,#userName,#password,#login_modal_header').popover('hide');

		$('#userName,#password,#jcaptchaCode').focus(function() {
			$('#login_modal_body,#userName,#password,#jcaptchaCode').popover('destroy');
		});
		
		$('#default_login').bind('click', function() {
			reloadValidateCode();
		});
		
		$('#loginForm input').bind('keyup', function(event) {/* 增加回车提交功能 */
			if (event.keyCode == '13') {
				dologin();
			}
		});
		window.setTimeout(function() {
			$('#loginForm input[name=userName]').focus();
		}, 0);

	});
	//重新生成验证码
	function reloadValidateCode() {
		$("#validateCodeImg").hide().attr(
				"src","${pageContext.request.contextPath}/jcaptcha/jcaptcha.jpg?"+ Math.floor(Math.random() * 100)).fadeIn();
	}
</script>
</head>

<body style="width:100%;height:100%;">
	<!-- 顶部导航栏 -->
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-headr">
				<!-- .navbar-toggle样式用于toggle收缩的内容，即nav-collapse collapse样式所在元素 -->
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="sr-only">Toggle Navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- 确保无论是宽屏还是窄屏，navbar-brand都显示 -->
				<a href="##" class="navbar-brand">ZHTFRAMEES</a>
			</div>
			<div class="collapse navbar-collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="##">首页</a></li>
					<li><a href="##">产品介绍</a></li>
					<li class="dropdown"><a href="##" data-toggle="dropdown" class="dropdown-toggle">关于我们 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="##">公司介绍</a></li>
							<li><a href="##">企业文化</a></li>
							<li role="presentation" class="divider"></li>
							<li><a href="##">联系我们</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
			<!-- 	<li><a data-toggle="modal" href="#default_reg_modal">注册</a></li> -->	
					<li><a data-toggle="modal" href="#default_login_modal">登录</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 底部导航栏 -->
	<!-- 
	<div class="navbar navbar-default navbar-fixed-bottom"
		style="margin-bottom:0;" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a href="##" class="navbar-brand">JMBrand</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="##">JM-版权所有@copyright</a></li>
				<li><a href="##">公司简介</a></li>
				<li><a href="##">招贤纳士</a></li>
				<li><a href="##">联系方式</a></li>
				<li><a href="##">版权声明</a></li>
				<li><a href="##">法律顾问</a></li>
				<li><a href="##">合作伙伴</a></li>
			</ul>
		</div>
	</div>
	
	 -->
	<!-- 中间轮播页面 -->
	<div id="carousel-example" class="carousel slide" data-ride="carousel" style="padding-top:3px;width:100%;height:100%;">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<!-- 	<li data-target="#carousel-example" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example" data-slide-to="1"></li>
			<li data-target="#carousel-example" data-slide-to="2"></li>
			<li data-target="#carousel-example" data-slide-to="3"></li>
			<li data-target="#carousel-example" data-slide-to="4"></li>
			<li data-target="#carousel-example" data-slide-to="5"></li>
			<li data-target="#carousel-example" data-slide-to="6"></li>
 -->
		</ol>
		<div class="staticDiv" style="top:26%">
			<img src="${pageContext.request.contextPath}/resources/images/mytitle.png" alt="..." />

			<p>
				<br />
			</p>
			<!-- 
			<button type="type" id="default_reg" class="btn btn-primary btn-lg" data-toggle="modal"
				data-target="#default_reg_modal" style="width:150px">注&nbsp;&nbsp;&nbsp;册</button>
			&nbsp;&nbsp;&nbsp; -->
			<button type="type" id="default_login" class="btn btn-danger btn-lg" data-toggle="modal"
				data-target="#default_login_modal" style="width:150px">登&nbsp;&nbsp;&nbsp;录</button>

			&nbsp;&nbsp;&nbsp; <a href="http://www.ujn.edu.cn/" target="blank" class="btn btn-default btn-lg" style="width:230px">了
				解 济 南 大 学 ></a>
			<p>
				<br />
			</p>
		</div>
		<div class="staticDiv" style="left:60%;bottom:5px">
			<table>
				<tr style="color:white">
					<td>&nbsp;@2014&nbsp;</td>
					<td>&nbsp;JMBrand@copyright&nbsp;</td>
					<td>&nbsp;<a style="color:white" href="javascript:;">使用系统前必读</a>&nbsp;
					</td>
					<td>&nbsp;<a style="color:white" href="javascript:;">公司简介</a>&nbsp;
					</td>
					<td>&nbsp;<a style="color:white" href="javascript:;">合作伙伴</a>&nbsp;
					</td>
					<td>&nbsp;鲁ICP备05001966号&nbsp;</td>
				</tr>
			</table>
		</div>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" style="height:100%">
			<div class="item active">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback5.jpg" alt="..." />
				<!--<img src="http://bfsu.sinaapp.com/wp-content/themes/bfsu/i/homepix/home5.jpg" style="width:100%;height:100%" alt="..." />  -->

			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback2.jpg" alt="..." />
				<!-- <img src="http://bfsu.sinaapp.com/wp-content/themes/bfsu/i/homepix/home2.jpg" style="width:100%;height:100%" alt="..." /> -->
				<!--	<div class="carousel-caption">...</div>-->
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback3.jpg" alt="..." />
				<!-- <img src="http://bfsu.sinaapp.com/wp-content/themes/bfsu/i/homepix/home3.jpg" style="width:100%;height:100%" alt="..." /> -->
				<!--	<div class="carousel-caption">...</div>-->
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback4.jpg" alt="..." />

			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback1.jpg" alt="..." />

			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback16.jpg" alt="..." />

			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback18.jpg" alt="..." />

			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback19.jpg" alt="..." />

			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback21.jpg" alt="..." />

			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/background/loginback22.jpg" alt="..." />


			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example" data-slide="prev"> <!-- <span class="glyphicon glyphicon-chevron-left"></span> --></a>
			<a class="right carousel-control" href="#carousel-example" data-slide="next"> <!-- <span
			class="glyphicon glyphicon-chevron-right"></span> -->
			</a>
		</div>

	</div>


	<jsp:include page="login_dialog.jsp"></jsp:include>

</body>
</html>

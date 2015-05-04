<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	 function convertPassword(username,password){
	    	//pwxwT1d6SMiYXYZ0ARGFhg+_94DABGioQOq2tTUO0AXYow
	    	var salt=username+"@zhtframework_94DABGioQOq2tTUO0AXYow";
	    //	var salt=username;
			//return hex_md5(password+"{"+salt+"}");
			return hex_md5(salt+password);
		}
	function dologin() {
		
		var userName = $("#userName");
		var password = $("#password");
		if (userName.val().length < 1) {
			$('#userName').popover('show');
		//	userName.focus();
			return;
		}
		if (password.val().length < 1) {
			$('#password').popover('show');
		//	password.focus();
			return;
		}

		$("#password").val(
				convertPassword(userName.val().trim(), password.val().trim()));
		ZHTAJAX.validateFromCallback($("#loginForm"), function(json) {
			if (json.statusCode == ZHT.statusCode.error) {
				$("#password").val("");
				$("#jcaptchaCode").val("");
				reloadValidateCode();
				
				if (json.message && alertMsg) {
					if("验证码错误"==json.message){
						$('#jcaptchaCode').popover('show');
					}else if("用户名或密码错误"==json.message){
						$('#login_modal_body').attr("data-content","用户名或密码错误");
						$('#login_modal_body').popover('show');
					}else{
						$('#login_modal_body').attr("data-content",json.message);
						$('#login_modal_body').popover('show');
					}
				//	$.messager.alert('提示1', json.message, 'error');
				}
			} else if (json.statusCode == ZHT.statusCode.serverError) {
				$("#password").val("");
				$("#jcaptchaCode").val("");
				reloadValidateCode();
				if (json.message && alertMsg) {
					$('#login_modal_body').attr("data-content",json.message);
					$('#login_modal_body').popover('show');
				//	$.messager.alert('提示', json.message, 'error');
				}
			} else {
				$("#password").val("");
				$('#userName,#password').popover('hide');
				$("#jcaptchaCode").val("");
				reloadValidateCode();
				if (json.message && alertMsg) {
					window.top.location.href = "${pageContext.request.contextPath}/rbac/user/core";
				}
			};
		});
	}
	//重新生成验证码
	function reloadValidateCode() {
		$("#validateCodeImg").hide().attr(
				"src","${pageContext.request.contextPath}/jcaptcha/jcaptcha.jpg?"+ Math.floor(Math.random() * 100)).fadeIn();
	}
</script>

<div class="modal fade" id="default_login_modal">
	<div id="default_loginDialog" class="modal-dialog" style="width:480px; border-radius: 50px;">
		<div class="modal-content" style="margin-top:200px">
			<div class="modal-header" id="login_modal_header" data-original-title="" data-placement="top"
				data-content="亲爱的用户,可以登录啦-_-">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title text-center">系统管理-登录</h4>
			</div>
			<div class="modal-body" id="login_modal_body" data-placement="top" data-content="用户名或密码错误。">
				<div class="form-group">
					<form id="loginForm" class="form-horizontal" action="${pageContext.request.contextPath}/rbac/user/login" method="post">
						<div class="form-group input-prepend">
							<label for="userName" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input id="userName" name="userName" type="text" class="form-control" placeholder="请输入您的用户名" data-placement="top"
									data-content="用户名不能为空">
							</div>
						</div>
						<div class="form-group input-prepend">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input id="password" name="password" type="password" class="form-control" placeholder="请输入您的登录密码"
									data-placement="top" data-content="密码不能为空">
							</div>
						</div>
						<div class="form-group input-prepend">
							<label for="jcaptchaCode" class="col-sm-2 control-label">验证码</label>
							<div class="col-sm-7">
								<input id="jcaptchaCode" name="jcaptchaCode" type="text" class="form-control" placeholder="请输入验证码"
									data-placement="top" data-content="验证码错误">
							</div>
							<div class="col-sm-3">

								<img border="0" width="70" height="35" id="validateCodeImg" align="middle"
									src="" onclick="javascript:reloadValidateCode();" />

							</div>
						</div>

					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button id="loginForm_user_login" type="button" class="btn btn-primary" style="width:200px;" onclick="dologin()">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
			</div>
		</div>
	</div>
</div>
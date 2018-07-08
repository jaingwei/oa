<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Pro.css" />
<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
   $(function(){
	   click();
	   tijiao1();
	   tijiao2();
   })

	function click() {
		$(".password").click(function() {
			$(".p4").show();
			$(".p4_2").hide();
		})
		$(".msg").click(function() {
			$(".p4").hide();
			$(".p4_2").show();
		})
	}
	function sendsms(){
		var number =$("input[name=number]");
		
		$.ajax({
			type:"post",
			data:{
				Number:number.val()
			},
			dataType:"json",
			url:"/oa/user/sendSms.do",
			success:function(data){
				$(".yanzhengma").attr("value",data);
				$(".yanzhengma").attr("disabled",'true');
			},
			error:function(){
				$(".yanzhengma").attr("value","发送验证码");
				$(".yanzhengma").removeAttr("disabled");
			}
		})
	}
	function tijiao1(){
		$('.submit1').click(function(){
			var usename = $('.p7_num')[0];
			if(usename.validity.valueMissing){
				usename.setCustomValidity('用户名不能为空');
				return;
			}
			if(usename.validity.patternMismatch){
				usename.setCustomValidity("用户名必须6位")
				return;
			}
			usename.setCustomValidity("");
			
			var numbe = $('.p7_pass')[0];
			if (numbe.validity.valueMissing) {
				numbe.setCustomValidity('号码不能为空');
				return;
			}
			if (numbe.validity.patternMismatch) {
				numbe.setCustomValidity('号码格式不对');
				return;
			}
			numbe.setCustomValidity('');
		})
	}
	function tijiao2(){
		$('.submit2').click(function(){
			var usename = $('.num')[0];
			if(usename.validity.valueMissing){
				usename.setCustomValidity('号码不能为空');
				return;
			}
			if(usename.validity.patternMismatch){
				usename.setCustomValidity("号码必须为11位")
				return;
			}
			usename.setCustomValidity("");
			
			var numbe = $('.pass')[0];
			if (numbe.validity.valueMissing) {
				numbe.setCustomValidity('验证码不能为空');
				return;
			}
			if (numbe.validity.patternMismatch) {
				numbe.setCustomValidity('验证格式不对');
				return;
			}
			numbe.setCustomValidity('');
		})
	}
	
</script>
</head>
<body>

	<header>
	<div class="p1">
		<div class="p2">
			<img src="../img/shouji.png" /> <span>移动应用下载</span>
		</div>
	</div>
	</header>
	<footer>
	<div class="p3">
		<div class="p4">
			<div class="p5"></div>
			<div class="p6">
				<span class="password">密码登录</span> <span class="msg">短信登录</span>
			</div>
			<div class="p7">
				<form action="/oa/user/dologin.do" method="post">
					<input type="text" name="name" placeholder="请输入账户名" class="p7_num" pattern="\d{3,6}" required/> 
					<input type="password" name="password" placeholder="请输入密码" class="p7_pass" required/> 
					<input type="submit" name="sunmit" value="登录" class="submit1" />
				</form>
				<p class="pp">
					<a href="#" target="_blank">忘记密码</a>
				</p>
			</div>

			<div class="p8"></div>
		</div>
		<div class="p4_2">
			<div class="p5"></div>
			<div class="p6">
				<span class="password">密码登录</span> <span class="msg">短信登录</span>
			</div>
			<div class="p7">
				<form action="/oa/user/sendLogin.do" method="post">
					<input required class="num" type="text" name="number" placeholder="请输入手机号码" />
					<input required class="pass" type="password" name="verification" placeholder="请输入验证码" /> 
					<input type="submit" name="sunmit" value="登录" class="submit2"/>
				</form>

				<p class="pp">
					<input type="button" value="获取验证码" class="yanzhengma" onclick="sendsms()"/>
				</p>
			</div>

			<div class="p8"></div>
		</div>
		<div class="p9">
			<span>试用账号：管理员用户名：admin，
				普通用户用户名:user，人力资源管理员用户名:systemain；密码均为：123456。其他用户名为姓名全拼（登录软件后在系统管理——用户帐后中查看姓名），如娄军的用户名为:
				loujun; 密码均为123456。</span>
		</div>
	</div>
	</footer>
	<div class="p10">
		<p>专注OA16年</p>
	</div>

</body>
</html>
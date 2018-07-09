<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
			$(function() {
				$('.h_click_li_return').click(function() {
					$('.h_over').toggle();
				})
				$('.s_left_1_hui').click(function(){
					var index = $('.s_left_1_hui').index($(this));
					$('.s_left_1_hui_ul').eq(index).toggle();
				})
				$('.h_head>ul>li').mouseover(function(){
					$(this).css('background-color','#3A5FCD')
				}).mouseout(function(){
					$(this).css('background-color','#039adf')
				})
			})
		</script>
</head>
<body>
	<header>
	<div class="h_head">
		<div class="h_img">
			<img src="/oa/img/FILE1563454828253BH.png" height="28px" width="28px" />
			<p>
				<a href="#">管理员</a> <a href="#">办公室</a>
			</p>
		</div>
		<ul>
			<li><a href="#"></a></li>
			<li><a href="#" class="h_top_a">快捷方式</a></li>
			<li><a href="#" class="h_top_a">个人办公</a></li>
			<li><a href="#" class="h_top_a">审批流程</a></li>
			<li><a href="#" class="h_top_a">工作中心</a></li>
			<li><a href="#" class="h_top_a">工作任务</a></li>
			<li><a href="#" class="h_top_a">内部邮件</a></li>
			<li><a href="#" class="h_top_a">文档中心</a></li>
			<li><a href="#" class="h_top_a">信息发布</a></li>
			<li class="h_click_li" title="更多列表">
				<p class="h_click_li_return"></p>
				<div class="h_over">
					<ul>
						<li><a href="#" class="h_top_a">公文发文</a></li>
						<li><a href="#" class="h_top_a">采购合同</a></li>
						<li><a href="#" class="h_top_a">设备管理</a></li>
					</ul>
					<ul>
						<li><a href="#" class="h_top_a">公文收文</a></li>
						<li><a href="#" class="h_top_a">人力资源</a></li>
						<li><a href="#" class="h_top_a">报表中心</a></li>
					</ul>
					<ul>
						<li><a href="#" class="h_top_a">客户管理</a></li>
						<li><a href="#" class="h_top_a">网上交流</a></li>
						<li><a href="#" class="h_top_a">工程管理</a></li>
					</ul>
					<ul>
						<li><a href="#" class="h_top_a">综合行政</a></li>
						<li><a href="#" class="h_top_a">电子邮件</a></li>
					</ul>
					<ul>
						<li><a href="#" class="h_top_a">考勤</a></li>
						<li><a href="#" class="h_top_a">系统管理</a></li>
					</ul>

				</div>
			</li>
		</ul>

		<p class="f_head_tubiao">
			<a href="#"></a> <a href="first.html"></a> <a href="#"></a> <a
				href="#"></a> <a href="#"></a> <a href="#"></a>
		</p>
	</div>

	</header>
	<section>
	<div class="section">
		<div class="s_left">
			<div class="s_left_1">
				<ul>
					<li><a href="#">快捷方式</a></li>
					<li><a href="#">消息提醒</a></li>
					<li><a href="#">我的信息</a></li>
					<li><a href="#">我的流程</a></li>
					<li class="s_left_1_all"><a href="#" class="s_left_1_hui">我的行政</a>
						<ul class="s_left_1_hui_ul">
							<li><a href="#">会议日历</a></li>
							<li><a href="#">会议发起</a></li>
							<li><a href="#">我的用车</a></li>
							<li><a href="#">用车日历</a></li>
							<li><a href="#">用品领取</a></li>
							<li><a href="#">我的考勤</a></li>
							<li><a href="#">考勤申请记录</a></li>
							<li><a href="#">我的图书</a></li>
						</ul></li>
					<li><a href="#">文件柜</a></li>
					<li><a href="#">通讯录</a></li>
				</ul>
			</div>
		</div>
		<div class="section_1"></div>
		<div class="f_right"></div>
	</section>
	<footer> </footer>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=URF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
		<link rel="stylesheet" type="text/css" href="/oa/css/KQsearch.css" />
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">$(function() {
	$('.h_click_li_return').click(function() {
		$('.h_over').toggle();
	})
	$('.s_left_1_hui').click(function() {
		var index = $('.s_left_1_hui').index($(this));
		$('.s_left_1_hui_ul').eq(index).toggle();
	})
	$('.h_head>ul>li').mouseover(function() {
		$(this).css('background-color', '#3A5FCD')
	}).mouseout(function() {
		$(this).css('background-color', '#039adf')
	})
})
</script>
</head>
<body>
<header>
			<div class="h_head">
				<div class="h_img">
					<img src="img/FILE1563454828253BH.png" height="28px" width="28px" />
					<p>
						<a href="#">管理员</a>
						<a href="#">办公室</a>
					</p>
				</div>
				<ul>
					<li>
						<a href="#"></a>
					</li>
					<li>
						<a href="#" class="h_top_a">快捷方式</a>
					</li>
					<li>
						<a href="#" class="h_top_a">个人办公</a>
					</li>
					<li>
						<a href="#" class="h_top_a">审批流程</a>
					</li>
					<li>
						<a href="#" class="h_top_a">工作中心</a>
					</li>
					<li>
						<a href="#" class="h_top_a">工作任务</a>
					</li>
					<li>
						<a href="#" class="h_top_a">内部邮件</a>
					</li>
					<li>
						<a href="#" class="h_top_a">文档中心</a>
					</li>
					<li>
						<a href="#" class="h_top_a">信息发布</a>
					</li>
					<li class="h_click_li" title="更多列表">
						<p class="h_click_li_return"></p>
						<div class="h_over">
							<ul>
								<li>
									<a href="#" class="h_top_a">公文发文</a>
								</li>
								<li>
									<a href="#" class="h_top_a">采购合同</a>
								</li>
								<li>
									<a href="#" class="h_top_a">设备管理</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">公文收文</a>
								</li>
								<li>
									<a href="#" class="h_top_a">人力资源</a>
								</li>
								<li>
									<a href="#" class="h_top_a">报表中心</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">客户管理</a>
								</li>
								<li>
									<a href="#" class="h_top_a">网上交流</a>
								</li>
								<li>
									<a href="#" class="h_top_a">工程管理</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">综合行政</a>
								</li>
								<li>
									<a href="#" class="h_top_a">电子邮件</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">考勤</a>
								</li>
								<li>
									<a href="#" class="h_top_a">系统管理</a>
								</li>
							</ul>

						</div>
					</li>
				</ul>

				<p class="f_head_tubiao">
					<a href="#"></a>
					<a href="first.html"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
				</p>
			</div>

		</header>
		<section>
			<div class="section">
				<div class="s_left">
					<div class="s_left_1">
						<ul>
							<li>
								<p>考勤管理</p>
							</li>
							<li>
								<a href="#">员工签到</a>
							</li>
							<li>
								<a href="#">考勤历史查询</a>
							</li>
							<li>
								<a href="#">考勤统计</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="section_1"></div>
				<div class="f_right">
					<div class="f_right_top">
						<p>当前位置:</p>
						<p>考勤历史查询</p>
					</div>
					<p class="f_right_biao">员工考勤查询</p>
					<div class="f_right_body">
						<form>
							<p>
								<span>输入时间段:</span> 
								<span>开始时间</span>
								<input name="startdate" type="date" />
								<span>-------结束时间</span>
								<input name="endsate" type="date" /> 
								<span>本日</span><input type="radio" />
								<span>本周</span><input type="radio" />
								<span>本月</span><input type="radio" />
							</p>

							<p>
								<span>查找范围:</span>
								<span>按机构</span><input type="radio" />
								<span>按部门</span><input type="radio" />
								<span>按员工号</span><input type="radio" />
								<span>按姓名</span><input type="radio" />
							</p>
							<p>
								<span>公司</span>
								<select>
									<option value="华天">华天</option>

								</select>
								<span>部门</span>
								<select>
									<option value="华天">华天</option>

								</select>
								<span>员工号</span>
								<input type="text" />
								<span>姓名</span>
								<input type="text" />
							</p>
							<p>
								<input type="submit" value="搜索" />

							</p>
						</form>
						<div class="f_right_body_table">
							<table cellspacing="0" border="1" frame="void" width="100%">
								<tr>
									<td>签到员工</td>
									<td>签卡时间</td>
									<td>签卡标记</td>
									<td>签卡备注</td>
									<td>所属部门</td>
									<td>所属公司</td>
								</tr>
								
									<tr>
									<td>签到员工</td>
									<td>签卡时间</td>
									<td>签卡标记</td>
									<td>签卡备注</td>
									<td>所属部门</td>
									<td>所属公司</td>
								</tr>
								
									</tr>
								
								
								
							</table>

						</div>
						
						

					</div>

				</div>
		</section>
		<footer>

		</footer>
</body>
</html>
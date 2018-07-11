<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/oa/css/public.css" charset="UTF-8"/>
<link rel="stylesheet" type="text/css" href="/oa/css/first.css" charset="UTF-8"/>
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
			
			
			$(function() {
				var time = setInterval("show()", 1000);
				pclick();
			})
			var index = 0;
			var num = 0;
			function show() {
				$('.f_image_1').addClass('showtype');
				$('.f_image_1').eq(index).removeClass('showtype');
				$('.f_image_1_round div').css('background-color', 'black');
				$('.f_image_1_round').eq(index).find('div').eq(index).css('background-color', 'blue');
				index++;
				if(index >= 3) {
					index = 0;
				}
			}

			function pclick() {
				$('.f_company_smalltop_p1').click(function() {
					num = $('.f_company_smalltop_p1').index($(this));
					$('.f_company_body_1').hide();
					$('.f_company_body_1').eq(num).show();
					$('.f_company_smalltop_p1').removeClass('fonttype');
					$(this).addClass('fonttype');

				})
			}
			
			
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
		
		 <div class="f_head_msg">
		
			   欢迎： <a href="/oa/MEmploye.jsp">${user.user_name}</a>
	     </div>
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

		<div class="f_right">
			<div class="f_right_boder1">
				<div class="f_right_1">
					<img src="/oa/img/portal_img_S.png" />
				</div>
				<div class="f_right_2">
					<div class="f_right_2_biao">
						<p>
							<a href="#">待我审批</a>
						</p>
						<p>更多</p>
					</div>
					<div class="f_right_2_text">
						<ul>
							<li><a href="#">办公用品申请</a>
								<p>管理员</p>
								<p>2018-1-1</p></li>
							<li><a href="#">办公用品申请</a>
								<p>管理员</p>
								<p>2018-1-1</p></li>
							<li></li>
							<li></li>
						</ul>

					</div>
				</div>
				<div class="f_right_3">
					<p>待办事项</p>
					<div class="f_right_3_text">
						<ul>
							<li><a>待我审批(0)</a></li>
							<li><a>待我阅读(0)</a></li>
							<li><a>内部邮件(0)</a></li>
							<li><a>工作任务(0)</a></li>
						</ul>
					</div>
				</div>

			</div>
			<div class="f_day">1</div>
			<div class="f_wen">1</div>
			<div>
				<div class="f_hui">
					<div class="f_hui_top">
						<p>我的会议</p>
						<p>更多</p>
					</div>
					<div class="f_hui_text"></div>
				</div>
				<div class="f_image">
					<div class="f_image_1">
						<div class="f_image_1_language">
							<div class="f_image_1_round">
								<div></div>
								<div></div>
								<div></div>
							</div>
							<p>AA集团2018全新OA系统上线暨全员应用培训大会今日在沪举行</p>
						</div>

					</div>
					<div class="f_image_1">
						<div class="f_image_1_language">
							<div class="f_image_1_round">
								<div></div>
								<div></div>
								<div></div>
							</div>
							<p>华天动力OA系统成功助力AA集团信息化升级改造项目</p>
						</div>

					</div>
					<div class="f_image_1">
						<div class="f_image_1_language">
							<div class="f_image_1_round">
								<div></div>
								<div></div>
								<div></div>
							</div>
							<p>华天动力OA系统开通知识分享社区的通知</p>
						</div>

					</div>
				</div>
				<div class="f_check">
					<p>我的考勤</p>
					<div class="f_check_message">
						<ul>
							<li><a>迟到(0)</a></li>
							<li><a>请假(0)</a></li>
							<li><a>外出(0)</a></li>
							<li><a>出差(0)</a></li>
							<li><a>早退(0)</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div></div>
			<div class="f_message">
				<div class="f_message_top">
					<p>内部邮件</p>
					<p>更多</p>
				</div>
				<div class="f_message_text">
					<ul>
						<li><a href="#">办公用品申请</a>
							<p>管理员</p>
							<p>2018-1-1</p></li>
						<li><a href="#">办公用品申请</a>
							<p>管理员</p>
							<p>2018-1-1</p></li>
						<li></li>
						<li></li>

					</ul>

				</div>

			</div>
			<div class="f_company">
				<div class="f_company_top">
					<p>公司动态</p>
					<p>重要：0</p>
				</div>
				<div class="f_company_smalltop">
					<p class="f_company_smalltop_p4">更多</p>
					<p class="f_company_smalltop_p1">新闻</p>
					<p class="f_company_smalltop_p1">通知</p>
					<p class="f_company_smalltop_p1">公告</p>
				</div>
				<div class="f_company_image"></div>
				<div class="f_company_body">
					<div class="f_company_body_1">
						<ul>
							<li><a href="#">办公用品申请</a>
								<p>2018-1-1</p></li>
							<li><a href="#">办公用品申请</a>
								<p>2018-1-1</p></li>
							<li><a href="#">办公用品申请</a>
								<p>2018-1-1</p></li>
							<li></li>
						</ul>

					</div>
					<div class="f_company_body_1">
						<ul>
							<li><a href="#">办公用品申请</a>
								<p>管理员</p>
								<p>2018-1-1</p></li>
							<li><a href="#">办公用品申请技术开发撒垃圾费</a>
								<p>管理员</p>
								<p>2018-1-1</p></li>
							<li></li>
							<li></li>
						</ul>
					</div>
					<div class="f_company_body_1">
						<ul>
							<li><a href="#">办公用品申请</a>
								<p>管理员</p>
								<p>2018-1-1</p></li>
							<li><a href="#">办公用品申请</a>
								<p>管理员</p>
								<p>2018-1-1</p></li>
							<li></li>
							<li></li>
						</ul>
					</div>

				</div>

			</div>
			<div class="f_knowledge">
				<div class="f_knowledge_top">
					<p>知识管理</p>
					<p>更多</p>
				</div>
				<div class="f_knowledge_text">
					<ul>
						<li><a href="#">办公用品申请</a>
							<p>管理员</p>
							<p>2018-1-1</p></li>
						<li><a href="#">办公用品申请</a>
							<p>管理员</p>
							<p>2018-1-1</p></li>
						<li></li>
						<li></li>
					</ul>
				</div>
			</div>
			<div class="f_search">
				<p>通讯录</p>
				<form action="first.html">
					<input type="search" name="search" placeholder="请输入查询姓名" />
				</form>
				<div class="f_search_return">搜索</div>
			</div>
			<div class="f_down"></div>

		</div>

	</div>

	</section>
	<footer></footer>
</body>
</html>
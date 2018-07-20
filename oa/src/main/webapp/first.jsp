<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/oa/css/public.css" charset="UTF-8"/>
<link rel="stylesheet" type="text/css" href="/oa/css/first.css" charset="UTF-8"/>
<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
			
             $(function() {
	           var time = setInterval("show()", 1000);
	           pclick();
	           click();
	           role();
	           roleclick();
             })
			function click(){
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
			}
			
			
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
			
			//获取菜单
			function role(){
				$.ajax({
					type:"post",
					data:{
						
					},
					dataType:"json",
					url:"/oa/role/getsys.do",
					success:function(data){
						var num=0;
						var i1 =0;
						var i2 =0;
						var i3 =0;
						var i4 =0;
						var i5 =0;
						var i6 =0;
						var roleul=$(".s_left_1_ul");
						$.each(data,function(i,v){
							if (v['parent_order']==1 && i1==0) {
								var li1 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i1++;
								num++;
								roleul.append(li1);
							}
							if (v['parent_order']==1 && i1==1) {
								var li11 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li11);
							}
							
							if (v['parent_order']==2 && i2==0) {
								var li2 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i2++;
								num++;
								roleul.append(li2);
							}
							if (v['parent_order']==2 && i2==1) {
								var li22 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li22);
							}
							
							if (v['parent_order']==3 && i3==0) {
								var li3 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i3++;
								num++;
								roleul.append(li3);
							}
							
							if (v['parent_order']==3 && i3==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
							if (v['parent_order']==4 && i4==0) {
								var li4 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i4++;
								num++;
								roleul.append(li4);
							}
							
							if (v['parent_order']==4 && i4==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
							if (v['parent_order']==5 && i5==0) {
								var li3 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i5++;
								num++;
								roleul.append(li3);
							}
							
							if (v['parent_order']==5 && i5==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
							if (v['parent_order']==6 && i6==0) {
								var li3 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i6++;
								num++;
								roleul.append(li3);
							}
							
							if (v['parent_order']==6 && i6==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+"</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
						})
					},
					error:function(){
						
					}
					
				})
			
			
			}
			
			function roleclick(){
				$(document).on("click",".s_left_1_ul>li",function(){
					$(this).find('ul').toggle();
				})
			}
			function removesession(){
				if ( confirm("是否退出") ) {
					$.ajax({
						type:"post",
						data:{
							
						},
						dataType:"json",
						url:"/oa/user/removeSession.do",
						success:function(data){
							
						},
						error:function(){
							
						}
					})
				}
				
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
		
			   欢迎： <a href="/oa/RSMmploye.jsp">${user.user_name}</a>
	     </div>
		<p class="f_head_tubiao">
		     
			<a href="#"></a> 
			<a href="/oa/first.jsp"></a> 
			<a href="#"></a> 
			<a href="/oa/first.jsp" onclick="removesession()" ></a>
		</p>
	</div>

	</header>
	<section>
	<div class="section">
		<div class="s_left">
			<div class="s_left_1">
				<ul class="s_left_1_ul">
						
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
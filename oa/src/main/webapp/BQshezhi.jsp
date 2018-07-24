<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华天协同OA平台</title>
<link rel="stylesheet" type="text/css" href="/oa/css/BQshezhi.css" />
<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
			$(function() {
				
				click();
				roleclick();
				role();
			})
			
			function click(){
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
				$("tr").click(function(){
					 location.href="BQxiugai.jsp"
				});
				$(".sub2").click(function(){
						$(".input1").val(" ");
						$(".tex").val(" ");
				});
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
			
			//添加
			function addMynote(){
				if (!title) {
					ytitle();
				}else if(!body){
					ybody();
				}else{
					 $.ajax({
							type:"post",
							data:{
								title:$(".input1").val(), 
								count:$('.tex').val()
							},
							dataType:"json",
							url:"/oa/mynote/addMynote.do",
							success:function(data){
								 $(".mmm").html(data);
								 $(".input1").val("");
								 $(".tex").val("");
							},
							error:function(){
							
							}
						})
				}  
			}
			
			//表单验证
			var title = false;
			var body = false;
			
			function ytitle() {
				var ti = $(".input1");
				if (ti.val()=="") {
					$(".titlespan").text("标题内容不可为空");
				}else if(ti.val().indexOf("<")!=-1 ||ti.val().indexOf(">")!=-1){
					$(".titlespan").text("标题内容含有非法字符");
				}else{
					title = true;
					$(".titlespan").text("验证通过");
				}
				
			}
			
			function ybody() {
				var tbody = $(".tex");
				if (tbody.val()=="") {
					$(".textp").text("文本内容不可为空");
				}else if(tbody.val().indexOf("<")!=-1 ||tbody.val().indexOf(">")!=-1){
					$(".textp").text("文本内容含有非法字符");
				}else{
					body = true;
					$(".textp").text("验证通过");
				}
				
			}
			
			
		</script>
</head>
<body>
	<header>
	<div class="h_head">
		<div class="h_img">
			<img src="img/FILE1563454828253BH.png" height="28px" width="28px" />
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

			<a href="#"></a> <a href="/oa/first.jsp"></a> <a href="#"></a> <a
				href="/oa/first.jsp" onclick="removesession()"></a>
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
			<h3>
				当前位置：<span>便签设置</span>
			</h3>
			<h1>个人便签设置</h1>
			<br />
			<hr />
			<br />
			<form>
				<ul>
					<li>便签标题：</li>
					<li><input type="text" class="input1" onblur="ytitle()" /> <span
						class="titlespan"></span></li>
					<li>便签内容：</li>
					<li><textarea class="tex" onblur="ybody()"
							style="resize: none; width: 1000px; height: 400px;"></textarea></li>
				</ul>
				<p>
					创建人：<span>${user.user_name}</span>
				</p>
				<p class="textp"></p>
				<input type="buttom" value="保存" name="buttom" style="width: 50px;"
					class="sub1" onclick="addMynote()" /> <input type="buttom"
					value="清空当前标签" name="submit1" class="sub2" /> <a
					href="/oa/BQbiaoqian.jsp"> <input type="buttom" value="返回"
					name="submit14" class="sub3" style="width: 50px;" />
				</a>
			</form>
			<p class="mmm"></p>
			<span class="cjsj">创建时间：</span>
			<div id="show_time">


				<script>
							setInterval("fun(show_time)", 1);
							function fun(timeID) {
								var date = new Date(); //创建对象  
								var y = date.getFullYear(); //获取年份  
								var m = date.getMonth() + 1; //获取月份  返回0-11  
								var d = date.getDate(); // 获取日  
								var h = date.getHours(); //时
								var minute = date.getMinutes() //分
								var s = date.getSeconds(); //秒
								if(m < 10) {
									m = "0" + m;
								}
								if(d < 10) {
									d = "0" + d;
								}
								if(h < 10) {
									h = "0" + h;
								}

								if(minute < 10) {
									minute = "0" + minute;
								}

								if(s < 10) {
									s = "0" + s;
								}
								document.getElementById(timeID.id).innerHTML = y + "-" + m + "-" + d + "   " + h + ":" + minute + ":" + s + "  ";
							}
						</script>
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>
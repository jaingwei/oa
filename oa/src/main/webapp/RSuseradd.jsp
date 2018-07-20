<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
		<link rel="stylesheet" type="text/css" href="/oa/css/RSuseradd.css" />
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
		$(function() {
			  click();
			  getOneUser();
			  getDeparts();
			  getRoles();
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
		
			//拿取修改用户的信息
		function getOneUser(){
			  $.ajax({
				  type:"post",
				  data:{
					 
				  },
				  dataType:"json",
				  url:"/oa/user/getOneUser.do",
				  success:function(data){ 
					  $(".input10").attr("value",data['user_id']);
					  $(".input11").attr("value",data['pass_word']);
					  $(".input111").attr("value",data['pass_word']);
					  $(".input12").attr("value",data['user_name']);
					  $(".input13").attr("value",data['user_state_name']);
					 
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		//拿取所有部门
		function getDeparts(){
			  $.ajax({
				  type:"post",
				  data:{
					 
				  },
				  dataType:"json",
				  url:"/oa/depart/getDeparts.do",
				  success:function(data){ 
					  $.each(data,function(i,v){
						  var bu ="<option selected='selected' value='"+v['depart_id']+"'>"+v['depart_name']+"</option>";
						  $(".select10").append(bu);
						 
					   })
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		//拿取所有角色
		function getRoles(){
			 
			  $.ajax({
				  type:"post",
				  data:{
					 
				  },
				  dataType:"json",
				  url:"/oa/role/getRoles.do",
				  success:function(data){ 
					  $.each(data,function(i,v){
						  var role ="<option selected='selected' value='"+v['role_id']+"'>"+v['role_name']+"</option>";
						  $(".select11").append(role);
					   })
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		
		 //修改用户信息
		  function updateUser(){
				$.ajax({
					type:"post",
					data:{
						userId:$(".input10").val(),
						password1:$(".input11").val(),
						password2:$(".input111").val(),
						name:$(".input12").val(),
						state:$(".input13").val(),
						depart:$(".select10>option:selected").val(),
						role:$(".select11>option:selected").val()
					},
					dataType:"json",
					url:"/oa/user/updateUsers.do",
					success:function(data){
						 $(".msgp").html(data);
						 $(".input10").val("");
						  $(".input11").val("");
						  $(".input12").val("");
						  $(".input13").val("");
					},
					error:function(){
					
					}
				})
			}
		 
		 function reStart(){
			 $(".msgp").html("");
			 $(".input10").val("");
			 $(".input11").val("");
			 $(".input111").val("");
			 $(".input12").val("");
			 $(".input13").val("");
			 $(".select10>option[value=-1]").attr("selected","selected");
			 $(".select11>option[value=-1]").attr("selected","selected");
		 }
		 
		 
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
					<h3>当前位置:文件搜索</h3>
					<div class="bb1">
						<h4>文件搜索</h4>
					</div>
					<p>_______________________________________________________________________________________________________________________________________________________________________</p>
					<div class="bb3">
						<form >
							用户登录名:<input name="username" class="input10" /><br />
							 密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:
							 <input type="text" name="password" class="input11" /><br /> 
							 确&nbsp;认&nbsp;密&nbsp;码:
							<input type="text"  class="input111" /><br /> 
							真&nbsp;实&nbsp;姓&nbsp;名:
							<input name="name"  class="input12" /><br /> 
							所&nbsp;在&nbsp;部&nbsp;门:
							<select name="select1" class="select10">
								<option  value="-1">--请选择--</option>
							</select>
							<div class="bb4">
							</div>
							<input class="bb5" type="file" /><br /> 
							角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:
							<select name="select2" class="select11">
								<option  value="-1">--请选择--</option>
							</select>
							<br /> 当&nbsp;&nbsp;状&nbsp;态:
							<input type="text" class="input13"/>
							<br />
							<input type="button" value="保存" onclick="updateUser()" />
							<input type="button" value="全部重写" onclick="reStart()"/>
							<a href="/oa/RSuserSearcch.jsp">
							<input type="button" value="返回" />
							</a>
						</form>
						<p class="msgp"></p>
					</div>
				</div>
		</section>
		<footer>

		</footer>
</body>
</html>
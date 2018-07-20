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
						  var bu ="<option  value='"+v['depart_id']+"'>"+v['depart_name']+"</option>";
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
						  var role ="<option  value='"+v['role_id']+"'>"+v['role_name']+"</option>";
						  $(".select11").append(role);
					   })
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		
		 //添加用户信息
		  function addUser(){
			 if (!Yid) {
				 yid();
			}else if(!Yname) {
				yname();
			}else if(!Ypassword1) {
				checkPassword();
			}else if(!Ypassword2) {
				checkRepass(); 
			}else if (!Ystate) {
				ystate();
			}else if (!Ynumber) {
				ynumber()
			}else{
				$.ajax({
					type:"post",
					data:{
						userId:$(".input10").val(),
						password1:$(".input11").val(),
						password2:$(".input111").val(),
						name:$(".input12").val(),
						state:$(".input13").val(),
						number:$(".input14").val(),
						depart:$(".select10>option:selected").val(),
						role:$(".select11>option:selected").val(), 
						sex:$('input[name="sex"]:checked').val()
					},
					dataType:"json",
					url:"/oa/user/addUser.do",
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
			}
		 function reStart(){
			 $(".msgp").html("");
			 $(".input10").val("");
			 $(".input11").val("");
			 $(".input111").val("");
			 $(".input12").val("");
			 $(".input13").val("");
			 $(".input14").val(""),
			 $(".select10>option[value=-1]").attr("selected","selected");
			 $(".select11>option[value=-1]").attr("selected","selected");
		 }
		 
		 
		 //表单验证
		 var Yid = false;
		 var Yname = false;
		 var Ypassword1 = false;
		 var Ypassword2 = false;
		 var Ystate= false;
		 var Ynumber= false;
		 
		 function yid() {
		  var id = 	$(".input10").val();
		  if (id==""){
			$(".span1").text("用户id不可为空");
		  }else{
			  $.ajax({
					type:"post",
					data:{
						userId:$(".input10").val()
					},
					dataType:"json",
					url:"/oa/user/YgetUser.do",
					success:function(data){
						
						if (data == "1") {
							  $(".span1").text("用户名已有，请重新输入");
						}else{
							  Yid=true;
							  $(".span1").text("输入成功");
						}
					},
					error:function(){
					
					}
				})  
		   }
		 }
		 //第一次密码验证
		 function checkPassword() {
				var pswd_reg = /^[a-zA-Z][a-zA-Z0-9]{5,17}$/;		
				var password = $(".input11");		
				var flag = pswd_reg.test(password.val());		
				if (flag) {
					 $(".span2").text("验证成功");
					 Ypassword1 = true;
				} else {
					 $(".span2").text("密码由6-18位字母，数字组合");
				}

			}
			//第二次密码验证（js验证）
			function checkRepass() {
				var password = $(".input11");
				var repass = $(".input111");
				if (repass.val() == password.val()) {
					 $(".span3").text("验证成功");
					Ypassword2 = true;
				} else {
					$(".span3").text("请输入相同的密码");
				}

			}
		 function yname() {
			 var tel = $(".input12").val();
			 if (tel=="") {
			 	  $(".span4").text("姓名不可为空，请输入");
			  }else{
					  Yname = true;
				 $(".span4").text("输入成功");
			  }
		}
		 
		 function ystate() {
			var state = $(".input13").val();
			if (state=="") {
			 	  $(".span5").text("内容不可为空，请输入");
			  }else{
				  if (state=="正常状态" || state=="屏蔽状态") {
					  Ystate = true;
					$(".span5").text("输入成功");
				} else {
					$(".span5").text(" 状态只有'正常状态'和'屏蔽状态' 这两种 ");
				}
				
			  }
		}
		 
		 function ynumber() {
			  var pswd_reg = /^[0-9]{11}$/;
			  var tel = $(".input14").val();
			  var flag = pswd_reg.test(tel);
			  if (tel=="") {
			 	  $(".span6").text("号码不可为空，请输入");
			  }else{
				  if (flag) {
					  Ynumber = true;
					  $(".span6").text("输入成功");
				 }else{
					 $(".span6").text("号码由11位数字组合");
				 }  
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
							用户登录名:<input name="username" class="input10" onblur="yid()"/><span class="span1"></span><br /> 	
							密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:
							<input type="password" name="password" class="input11" onblur="checkPassword()"/><span class="span2"></span><br /> 
							确&nbsp;认&nbsp;密&nbsp;码:
							<input type="password"  class="input111" onblur="checkRepass()"/><span class="span3"></span><br /> 
							
							真&nbsp;实&nbsp;姓&nbsp;名:
							<input name="name"  class="input12" onblur="yname()"/><span class="span4"></span><br /> 
							
							所&nbsp;在&nbsp;部&nbsp;门:
							<select name="select1" class="select10">
								<option selected="selected" value="-1">--请选择--</option>
								
							</select><br /> 性别:
							<br />
							<input type="radio"  name="sex" value="1" class="sex"/>男
							<input type="radio"  name="sex" value="0" class="sex"/>女
							<div class="bb4">
							</div>
							<input class="bb5" type="file" /><br /> 
							角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:
							<select name="select2" class="select11">
								<option selected="selected" value="-1">--请选择--</option>
								
							</select><br /> 
							当前状态:
							<input type="text" class="input13" onblur="ystate()"/><span class="span5"></span><br />
							
							用户号码:
							<input name="number"  class="input14" onblur="ynumber()"/><span class="span6"></span><br /> 
							
							<input type="button" value="保存" onclick="addUser()"/>
							<input type="button" value="全部重写" onclick="reStart()" />
							<a href="/oa/RSuserSearcch.jsp">
							<input type="button" value="返回"  />
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
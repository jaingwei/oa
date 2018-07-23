<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/RSbmgl.css" />
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
		$(function() {
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
			
		  
		  //拿取用户信息
		  function getUsers(){
			  $(".userman").html("");
			  $.ajax({
				  type:"post",
				  data:{
					 
				  },
				  dataType:"json",
				  url:"/oa/user/getUsers.do",
				  success:function(data){ 
					   $.each(data,function(i,v){
						   var userIn= $(".input11").val();
						   var user ="<p onclick=updateUser("+v['user_id']+");hide();update('"+userIn+"')>"+v['user_name']+"</p>"
						   $(".userman").append(user);
					   })
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		  //修改用户信息
		  function updateUser(userId){
			  $.ajax({
				  type:"post",
				  data:{
					  userId:userId
				  },
				  dataType:"json",
				  url:"/oa/user/updateUser.do",
				  success:function(data){ 
					  $.each(data,function(i,v){
						  $(".input11").attr("value",v['user_name']);
						  $(".input12").attr("value",v['number']);
					   })
					  getUsers();
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
			
		  //文本框中的用户信息改为普通用户
		  function update(userName){
			  $.ajax({
				  type:"post",
				  data:{
					  username:userName
				  },
				  dataType:"json",
				  url:"/oa/user/updateUserIn.do",
				  success:function(data){  
					  getUsers();
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		  function show() {
			$(".userman").show();
		  }
		  function hide(){
			$(".userman").hide();
		   }
		  //表单验证
		  var Yname = false;//部门名称验证
		  var Ynumber = false;//手机号码验证
		  
		function buyan() {
			  if ($(".input10").val()=="") {
				  $(".li10").text("部门名称不可为空，请输入");
		      }else if($(".input10").val().indexOf("<")!=-1 ||$(".input10").val().indexOf(">")!=-1 ){
					 $(".li10").text("用户id中含有非法符号，请重新输入");
			  }else{
		      		$.ajax({
						type:"post",
						data:{
							depart:$(".input10").val()
						},
						dataType:"json",
						url:"/oa/depart/search.do",
						success:function(data){
							if (data == "1") {
								  $(".li10").text("部门名称已有，请重新输入");
							}else{
								  Yname=true;
								  $(".li10").text("输入成功");
							}
						},
						error:function(){
							
						}
					})
		      	}
			  
		 }
		
		  function number() {
			  var pswd_reg = /^[0-9]{11}$/;
			  var tel = $(".input13").val();
			  var flag = pswd_reg.test(tel);
			  if (tel=="") {
			 	  $(".li13").text("号码不可为空，请输入");
			  }else if(tel.indexOf("<")!=-1 ||tel.indexOf(">")!=-1 ){
					 $(".li13").text("用户id中含有非法符号，请重新输入");
			   }else{
				  if (flag) {
					  Ynumber = true;
					  $(".li13").text("输入成功");
				 }else{
					 $(".li13").text("号码由11位数字组合");
				 }  
			  }
			 
		 }
		//添加部门信息(提交)
		  function updateDepart(){
			if (!Yname) {
				 buyan();
			}else if(!Ynumber){
				number();
			}else{
				$.ajax({
					type:"post",
					data:{
						name:$(".input10").val(),
						user:$(".input11").val(),
						number:$(".input12").val(),
						tel:$(".input13").val()
					},
					dataType:"json",
					url:"/oa/depart/addDepart.do",
					success:function(data){
						 $(".msgp").html(data);
						  $(".input10").val("");
						  $(".input11").val("");
						  $(".input12").val("");
						  $(".input13").val("");
					},
					error:function(){
					  alert("失败");
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
						<h3>当前位置：<span>部门信息</span></h3>
					<h1>保存部门信息</h1><br><hr/><br/>
					<form class="f_right_from">
						<strong><ul>
							<li>部门名称：</li>
							<li><input type="text" class="input10" onblur="buyan()" required /></li>
							<li class="li10"></li>
							<li>部门负责人：</li>
							<li><input type="text" class="input11 " required/> 
							<input type="button" value="请选择" onclick="getUsers();show()"/>
							</li>
							<li class="li11"></li>
							<li>联系电话：</li>
							<li><input type="text" class="input12"  required/></li>
							<li class="li12"></li>
							<li>移动电话：</li>
							<li><input type="text" class="input13" onblur=" number()" required/></li>
							<li class="li13"></li>
							<p class="msgp"></p>
						</ul></strong>
						
				   <br />
				 <input type="button" onclick="updateDepart()" value="保存" name="submit" class="sub"/>
			     
                 <a href="/oa/RSbmSearch.jsp"><input type="button"  value="退出" name="submit1" class="sub" /></a>
					<div class="userman">
				
				  
				
				    </div>
					</form>
					
				</div>
				
		</section>
		<footer>

		</footer>
</body>
</html>
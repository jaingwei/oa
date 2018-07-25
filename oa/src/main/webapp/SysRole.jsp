<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
		<link rel="stylesheet" type="text/css" href="/oa/css/sys.css"/>
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function() {
				click();
				getrole();
				role();
				roleclick();
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
				
				$(".system_permission_not>p:nth-of-type(1)>input").click(function(){
					$(".system_permission").hide();
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
			
			function clickdiv(){
				$(".system_permission").show();
			}
			
			function getrole(){
				$(".system_bg_table>tbody").html("");
				$.ajax({
					type:"post",
					data:{},
					dataType:"json",
					url:"/oa/role/getrole.do",
					success:function(data){
						$.each(data,function(i,v){
						   var tr ="<tr>"
							+ "<td>"+v['role_name']+"</td>"
							+ "<td>"+v['role_desc']+"</td>"
							+ "<td><a href='javascript:void(0)' onclick='getrole1("+v['role_id']+")'>修改</a></td>"
							+ "<td><a href='javascript:void(0)' onclick='removerole("+v['role_id']+")'>删除</a></td>"
							+ "<td><a href='javascript:void(0)' onclick='getAlreadySys("+v['role_id']+");getNotSys("+v['role_id']+");clickdiv()'>分配权限</a></td>"
						    + "</tr>";
						 $(".system_bg_table>tbody").append(tr);
						})
						
					},
					error:function(){
						 $(".system_bg_table").append("<tr><td>导入失败</td></tr>");
					}
				})
			}
			function getrole1(id){
				$(".system_bd_p").html("");
				 $(".system_bg_p").html("");
				$.ajax({
					type:"post",
					data:{
						roleid:id
					},
					dataType:"json",
					url:"/oa/role/getrole.do",
					success:function(data){
						 $(".system_bd_input").html("");
						 $(".system_bd_text").html("");
						$.each(data,function(i,v){
							var name=v['role_name'];
							var desc=v['role_desc'];
							
						  $(".system_bd_input").attr("value",name);
						  $(".system_bd_text").append(desc);
						  $(".button2").css("background-color","red");
						})
						
					},
					error:function(){
					
					}
				})
			}
			
			function updaterole(){
				if (!Yrolename) {
					yrilename();
				}else if(!Yroletext){
					yroletext();
				}else{
				 $(".system_bd_p").html("");
				 $(".system_bg_p").html("");
				$.ajax({
					type:"post",
					data:{
						name:$(".system_bd_input").val(),
						desc:$(".system_bd_text").val()
					},
					dataType:"json",
					url:"/oa/role/updaterole.do",
					success:function(data){
						 $(".system_bd_p").append(data);
						 if (data=="修改信息成功") {
							 $(".system_bd_input").attr("value",'');
							 $(".system_bd_text").html("");
							 $(".button2").css("background-color","#1B6D85");
							 getrole();
						 }
					},
					error:function(){
					
					}
				})
				
				}
			}
			
			function addrole(){
				var flag = true;
				if (!Yrolename) {
					yrilename();
					flag = false;
				}
				if(!Yroletext){
					yroletext();
					flag = false;
				}
				if (!flag) {
					return;
				}
					$(".system_bd_p").html("");
				    $(".system_bg_p").html("");
					$.ajax({
						type:"post",
						data:{
							name:$(".system_bd_input").val(),
							desc:$(".system_bd_text").val()
						},
						dataType:"json",
						url:"/oa/role/addrole.do",
						success:function(data){
							 $(".system_bd_p").append(data);
							 if (data == "添加信息成功") { 
								 getrole();
								 Yrolename = false;
								 Yroletext = false;
							 }
						},
						error:function(){
						
						}
					})
			}
			
			function removerole(id){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    if (confirm("确认删除")) {
			    	$.ajax({
						type:"post",
						data:{
							roleid:id
						},
						dataType:"json",
						url:"/oa/role/removerole.do",
						success:function(data){
							getrole(); 
							$(".system_bg_p").html(data);
						},
						error:function(){
							
						}
					})
				}
			}
			
			
			function getAlreadySys(id){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_have div").html("");
			    $.ajax({
					type:"post",
					data:{
						roleid:id
					},
					dataType:"json",
					url:"/oa/role/getAlreadySys.do",
					success:function(data){
						$.each(data,function(i,v){
							var sys = "<p>"
							+v['display_name']
							+"<a onclick='removeSys("+v['node_id']+","+v['role_id']+")'>删除</a> "
							+"</p>";	
							$(".system_permission_have div").append(sys);
						})
					},
					error:function(){
						
					}
				})
			}
			
			function getNotSys(id){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_not div").html("");
			    $.ajax({
					type:"post",
					data:{
						roleid:id
					},
					dataType:"json",
					url:"/oa/role/getNotSys.do",
					success:function(data){
						$.each(data,function(i,v){
							var sys ="<p>"
							+v['display_name']
							+"<a onclick='addSys("+v['node_id']+","+v['id']+")'>添加</a> "
							+"</p>";	
							$(".system_permission_not div").append(sys);
						})
					},
					error:function(){
						
					}
				})
			}
			
			function addSys(nodeid,roleid){
				
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_not div").html("");
			    $(".system_permission_have div").html("");
			    $.ajax({
					type:"post",
					data:{
						nodeid:nodeid,
						roleid:roleid
					},
					dataType:"json",
					url:"/oa/role/addSys.do",
					success:function(data){
						getNotSys(roleid);
						getAlreadySys(roleid);
					},
					error:function(){
						
					}
				})
			}
			
			function removeSys(nodeid,roleid){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_not div").html("");
			    $(".system_permission_have div").html("");
			    $.ajax({
					type:"post",
					data:{
						nodeid:nodeid,
						roleid:roleid
					},
					dataType:"json",
					url:"/oa/role/removeSys.do",
					success:function(data){
						getNotSys(roleid);
						getAlreadySys(roleid);
					},
					error:function(){
						
					}
				})
			}
			
			//表单验证
			var Yrolename = false;
			var Yroletext = false;
			function yrilename() {
					  var id = 	$(".system_bd_input").val();
					  if (id==""){
						$(".span1").text("用户id不可为空");
					  }else if(id.indexOf("<")!=-1 ||id.indexOf(">")!=-1 ){
							 $(".span1").text("用户id中含有非法符号");
						}else{
						  $.ajax({
								type:"post",
								data:{
									roleName:$(".system_bd_input").val()
								},
								dataType:"json",
								url:"/oa/role/yGetrole.do",
								success:function(data){
									if (data == "1") {
										  $(".span1").text("用户名已有，请重新输入");
									}else{
										  Yrolename=true;
										  $(".span1").text("输入成功");
									}
								},
								error:function(){
								
								}
							})  
					   }
			}
			
            function yroletext() {
            	var tel = $(".system_bd_text").val();
   			 if (tel=="") {
   			 	  $(".span2").text("姓名不可为空，请输入");
   			  }else if(tel.indexOf("<")!=-1 ||tel.indexOf(">")!=-1 ){
					 $(".span2").text("用户id中含有非法符号");
				}else{
   				 Yroletext = true;
   				 $(".span2").text("输入成功");
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
					<div class="system">
						<h1>角色管理</h1><br />
						<hr />
						<div class="system_bd">
							<ul>
								<li><span>角色名称</span></li>
								<li><input type="text" name="userName" onblur="yrilename()" style="width: 300px;height: 25px;" class="system_bd_input" />
								<span class="span1"></span>
								</li>
								<li><span>角色说明</span></li>
								<li><textarea name="userdesc" onblur="yroletext()" style="resize: none; width: 300px; height: 100px;" class="system_bd_text"></textarea>
								<span class="span2"></span>
								</li>
							</ul>
							<p class="system_bd_p"></p>
							<button class="button1" onclick="addrole()"  >添加</button>
							<button class="button2" onclick="updaterole()">保存修改</button>
						</div>
						<div class="system_bg">
							<table border="1" cellspacing="0" class="system_bg_table">
								<thead>
								<tr>
									<th>角色名称</th>
									<th>角色说明</th>
									<th>修改</th>
									<th>删除</th>
									<th>分配角色权限</td>
								</tr>
								</thead>
								<tbody></tbody>
							</table>
							<p class="system_bg_p"></p>
						</div>
						<div class="system_permission">
							<div class="system_permission_have">
								<p>
									已有权限
								</p>
								<hr color="black"/>
								<div></div>
							</div>
							<div class="system_permission_not">
								  <p>
								  	 未添加权限
								  	 <input type="button" value="关闭" />
								  </p>  
								   <hr  color="black"/>
								   <div></div>
							</div>
						</div>
					</div>
				</div>
		</section>
		<footer>

		</footer>

</body>
</html>